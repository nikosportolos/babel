import 'dart:convert' show JsonEncoder, jsonDecode;
import 'dart:io' show Directory, File;

import 'package:ansix/ansix.dart';
import 'package:babel/src/core/theme.dart';
import 'package:babel/src/exceptions/exceptions.dart';
import 'package:babel/src/models/models.dart';
import 'package:babel/src/reports/reports.dart';
import 'package:babel/src/utils/utils.dart';
import 'package:collection/collection.dart';
import 'package:dart_cmder/dart_cmder.dart';
import 'package:meta/meta.dart' show visibleForTesting;
import 'package:path/path.dart';
import 'package:trace/trace.dart';

class Babel {
  @visibleForTesting
  Babel(this.project);

  final Project project;

  /// Creates a new instance of [Project] from the given [path].
  factory Babel.fromPath(
    final String? path,
  ) {
    return Babel(
      Loader.loadProjectFromPath(path),
    );
  }

  void printInfo() {
    final String l10nYaml =
        normalize(join(basename(project.root.path), Finder.l10nYaml));
    Trace.printListItem(
        'Localization options file found in ${l10nYaml.bold()}');

    final String arbDir =
        normalize(join(basename(project.root.path), project.options.arbDir!));
    Trace.printListItem(
        'Found ${project.translations.length.toString().bold()} '
        'arb files in ${arbDir.bold()}:');

    for (final TranslationFile f in project.translations) {
      Trace.printListItem(basename(f.path), level: 1);
    }
  }

  Future<void> printReport({
    required final ReportDisplayMode displayMode,
    required final ReportMode reportMode,
    final Directory? exportDirectory,
  }) async {
    printInfo();

    final Report report = switch (reportMode) {
      ReportMode.all => AllTranslationsReport(project,
          mode: displayMode, exportDirectory: exportDirectory),
      ReportMode.missing => MissingTranslationsReport(project,
          mode: displayMode, exportDirectory: exportDirectory),
      ReportMode.unused => UnusedTranslationsReport(project,
          mode: displayMode, exportDirectory: exportDirectory),
    };

    await report.generateAndPrint();
  }

  Future<void> sortTranslationKeys() async {
    Trace.info('\nSorting translation keys');

    for (final TranslationFile translationFile in project.translations) {
      final List<TranslationKey> sorted = translationFile.keys.sorted(
        (TranslationKey a, TranslationKey b) => a.key.compareTo(b.key),
      );

      final Map<String, dynamic> json = <String, dynamic>{
        Loader.localeTag: translationFile.locale,
      };

      for (TranslationKey tr in sorted) {
        json.addAll(<String, dynamic>{
          tr.key: tr.value,
          if (tr.hasAttributes)
            '@${tr.key}': <String, dynamic>{
              if (tr.attributes.description != null) //
                'description': tr.attributes.description,
              ...tr.attributes.placeholders,
            },
        });
      }

      File(translationFile.path).writeAsStringSync(
        const JsonEncoder.withIndent('  ').convert(json),
      );

      Trace.printListItem(
        basename(translationFile.path).bold(),
        level: 1,
        map: <int, ListItemTheme>{
          1: BabelTheme.successListItemTheme,
        },
      );
    }

    Trace.success(
        '\nSuccessfully sorted all translation keys in ${project.translations.length.toString().bold()} localization files');
  }

  Future<void> cleanUnusedTranslations(final bool dryRun) async {
    Trace.info('\nClearing unused translation keys');

    final UnusedTranslationsReport report = UnusedTranslationsReport(project);
    await report.generate();

    if (report.keys.isEmpty) {
      Trace.success('No unused translation keys found');
      return;
    }

    for (final String key in report.keys) {
      Trace.printListItem(key, level: 1);
    }

    if (dryRun) {
      throw UnusedTranslationsFound(report.keys.length);
    }

    deleteUnusedTranslations(report);

    Trace.success('\nSuccessfully deleted all unused translation keys!');
  }

  @visibleForTesting
  void deleteUnusedTranslations(final UnusedTranslationsReport report) {
    for (final TranslationFile translationFile in project.translations) {
      final File file = File(translationFile.path);
      final Map<String, dynamic> json = jsonDecode(file.readAsStringSync());
      json.removeWhere((String key, dynamic value) {
        if (key.startsWith('@')) {
          return report.keys.contains(key.substring(1));
        }
        return report.keys.contains(key);
      });
      file.writeAsStringSync(const JsonEncoder.withIndent(' ').convert(json));
    }
  }

  Future<void> cleanGeneratedFiles() async {
    Trace.info('\nClearing generated localization files');

    final String flutterGenPath =
        join(project.root.path, '.dart_tool', 'flutter_gen');
    final Directory flutterGenDirectory = Directory(flutterGenPath);
    if (flutterGenDirectory.existsSync()) {
      flutterGenDirectory.deleteSync(recursive: true);
      Trace.printListItem('Deleted $flutterGenPath', level: 1);
    }

    final String generatedPath = join(project.root.path, 'lib', 'generated');
    final Directory generatedDirectory = Directory(generatedPath);
    if (generatedDirectory.existsSync()) {
      generatedDirectory.deleteSync(recursive: true);
      Trace.printListItem('Deleted $generatedPath', level: 1);
    }

    Trace.success('\nSuccessfully deleted all generated localization files!');
  }
}
