import 'dart:async';
import 'dart:io';

import 'package:babel/src/babel.dart';
import 'package:babel/src/exceptions/exceptions.dart';
import 'package:babel/src/reports/mode.dart';
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
              expect(buffer.toString(), mocks[reportMode]![displayMode]);

              final String exportFilePath = normalize(
                  join(exportPath, filenames[reportMode]![displayMode]!));
              final File file = File(exportFilePath);
              final String content = file.readAsStringSync();

              expect(content.removeGeneratedOn(),
                  exports[reportMode]![displayMode]);

              file.deleteSync();
              exportDirectory.deleteSync();
            });
          }
        });
      }
    });
  });
}

extension on String {
  String removeGeneratedOn() {
    final RegExp regex =
        RegExp(r'> Generated on: \d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d{6}\n');
    return replaceAll(regex, '');
  }
}
