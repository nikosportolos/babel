import 'dart:async';
import 'dart:io';

import 'package:ansix/ansix.dart';
import 'package:babel/src/babel.dart';
import 'package:babel/src/exceptions/exceptions.dart';
import 'package:babel/src/reports/mode.dart';
import 'package:babel/src/reports/unused_translations.dart';
import 'package:babel/src/utils/loader.dart';
import 'package:path/path.dart';
import 'package:test/test.dart';
import 'package:trace/trace.dart';

import '../mocks/list_mocks.dart';
import '../mocks/mocks.dart';

void main() {
  final StringBuffer buffer = StringBuffer();
  final StreamSubscription<LogEntry> subscription =
      Trace.stream.listen((LogEntry entry) => buffer.writeln(entry.message));

  tearDown(() => buffer.clear());

  tearDownAll(() async {
    await subscription.cancel();
    await Trace.dispose();
  });

  group('Babel', () {
    test('throws LocalizationOptionsNotFound', () {
      expect(
        () => Babel.fromPath('.'),
        throwsA(isA<LocalizationOptionsNotFound>()),
      );
    });

    group('ReportDisplayMode', () {
      final Babel babel = Babel.fromPath(exampleProjectPath);
      AnsiX.colorFormat = ColorFormat.ansi;

      for (final ReportMode reportMode in ReportMode.values) {
        group(reportMode.name, () {
          for (final ReportDisplayMode displayMode
              in ReportDisplayMode.values) {
            test(displayMode.name, () async {
              await babel.printReport(
                displayMode: displayMode,
                reportMode: reportMode,
                exportDirectory: exportDirectory,
              );

              await Future<void>.delayed(const Duration(milliseconds: 100));
              final String mock = Platform.isWindows
                  ? mocks[reportMode]![displayMode]!
                  : mocks[reportMode]![displayMode]!.replaceAll(r'\', '/');

              expect(buffer.toString().removeExportPath(reportMode), mock);

              final String exportFilePath = normalize(
                  join(exportPath, filenames[reportMode]![displayMode]!));
              final File file = File(exportFilePath);
              final String content = file.readAsStringSync();

              expect(
                content.removeGeneratedOn(),
                exports[reportMode]![displayMode],
              );

              file.deleteSync(recursive: true);
              exportDirectory.deleteSync(recursive: true);
            });
          }
        });
      }
    });
  });

  group('clean unused translations', () {
    final MockBabel babel = MockBabel(exampleProject);

    test('--no-dry-run', () async {
      await babel.cleanUnusedTranslations(false);
      expect(babel.deletedTranslations, isTrue);
    });

    test('dry-run', () async {
      expect(
        () async => await babel.cleanUnusedTranslations(true),
        throwsA(isA<UnusedTranslationsFound>()),
      );
      expect(babel.deletedTranslations, isFalse);
    });
  });
}

class MockBabel extends Babel {
  factory MockBabel.fromPath(final String? path) {
    return MockBabel(Loader.loadProjectFromPath(path));
  }

  MockBabel(super.project);

  bool deletedTranslations = false;

  @override
  Future<void> cleanUnusedTranslations(final bool dryRun) async {
    deletedTranslations = false;
    return await super.cleanUnusedTranslations(dryRun);
  }

  @override
  void deleteUnusedTranslations(final UnusedTranslationsReport report) {
    deletedTranslations = true;
  }
}

extension on String {
  String removeGeneratedOn() {
    return replaceAll(
      RegExp(r'> Generated on: \d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d{6}\n'),
      '> Generated on:',
    );
  }

  String removeExportPath(final ReportMode reportMode) {
    if (Platform.isWindows) {
      return this;
    }
    switch (reportMode) {
      case ReportMode.all:
        final RegExp allRegex = RegExp(
            '(> Writing [1mAll Translations[22m report to [/a-zA-Z]*)');
        if (allRegex.hasMatch(this)) {
          return replaceAll(
            allRegex,
            r'> Writing [1mAll Translations[22m report to D:\workspace\Flutter\Packages\babel\test\export',
          ).replaceAll(r'\', '/');
        }
        break;

      case ReportMode.missing:
        final RegExp missingRegex = RegExp(
            '(> Writing [1mMissing Translations[22m report to [/a-zA-Z]*)');
        if (missingRegex.hasMatch(this)) {
          return replaceAll(
            missingRegex,
            r'> Writing [1mMissing Translations[22m report to D:\workspace\Flutter\Packages\babel\test\export',
          ).replaceAll(r'\', '/');
        }
        break;

      case ReportMode.unused:
        final RegExp unusedRegex = RegExp(
            '(> Writing [1mUnused Translations[22m report to [/a-zA-Z]*)');
        if (unusedRegex.hasMatch(this)) {
          return replaceAll(
            unusedRegex,
            r'> Writing [1mUnused Translations[22m report to D:\workspace\Flutter\Packages\babel\test\export',
          ).replaceAll(r'\', '/');
        }
        break;
    }

    return this;
  }
}
