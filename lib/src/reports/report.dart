import 'dart:convert';
import 'dart:io';

import 'package:ansix/ansix.dart';
import 'package:babel/src/core/theme.dart';
import 'package:babel/src/models/models.dart';
import 'package:babel/src/reports/reports.dart';
import 'package:collection/collection.dart';
import 'package:dart_cmder/dart_cmder.dart';
import 'package:path/path.dart';
import 'package:trace/trace.dart';

export 'mode.dart';

abstract class Report {
  Report(
    this.project, {
    required this.name,
    this.mode = ReportDisplayMode.grid,
    this.exportDirectory,
  }) : exportFilename =
            'babel-${name.split(' ').first.toLowerCase()}-${mode.name}.txt';

  final String name;
  final Project project;
  final ReportDisplayMode mode;
  final List<String> keys = <String>[];
  final Directory? exportDirectory;
  final String exportFilename;

  AnsiText get missingTranslationText => AnsiText(
        '(missing translation)',
        foregroundColor: BabelColors.error,
        style: const AnsiTextStyle(italic: true),
        alignment: AnsiTextAlignment.center,
      );

  Future<void> generate();

  Future<void> generateAndPrint() async {
    Trace.printListItem('Generating report:');
    Trace.printListItem('Name: ${name.bold()}', level: 1);
    Trace.printListItem('Mode: ${mode.title.bold()}', level: 1);
    Trace.info('');

    await generate();
    print();
  }

  void print() {
    if (keys.isEmpty) {
      return;
    }

    final String report = switch (mode) {
      ReportDisplayMode.grid => getTranslationGrid(keys: keys),
      ReportDisplayMode.tree => getTranslationTree(keys: keys),
      ReportDisplayMode.json => getTranslationJson(keys: keys),
    };

    Trace.info(report);

    if (exportDirectory != null) {
      final StringBuffer buffer = StringBuffer();
      buffer
        ..writeln(BabelTheme.logo.formattedText.unformatted)
        ..writeLines(1)
        ..writeln('> Report: $name')
        ..writeln('> Display mode: ${mode.title}')
        ..writeln('> Generated on: ${DateTime.now()}')
        ..writeLines(2)
        ..write(report.unformatted)
        ..writeLines(1);

      printToFile(buffer.toString());
    }
  }

  List<FileSystemEntity> getProjectFiles() {
    final List<String> excludedPaths = <String>[
      join(project.root.absolute.path, 'lib', 'generated'),
      join(project.root.absolute.path, 'lib', 'generated', 'intl'),
    ];

    return Finder.findDartFiles(path: project.lib.path)
        .where((FileSystemEntity f) =>
            !excludedPaths.contains(dirname(f.absolute.path)))
        .toList(growable: false);
  }

  String getTranslationTree({required final List<String> keys}) {
    return AnsiTreeView(
      getTranslationJsonData(keys: keys),
      theme: BabelTheme.defaultTreeViewTheme.copyWith.headerTheme
          .customHeader(name),
    ).toString();
  }

  String getTranslationGrid({required final List<String> keys}) {
    final AnsiGrid grid = AnsiGrid.fromRows(
      <List<Object?>>[
        <Object?>['#', 'Translation key', ...project.locales],
        for (int i = 0; i < keys.length; i++)
          <Object?>[
            i + 1,
            keys[i],
            for (final String locale in project.locales)
              project.translations
                      .where((TranslationFile f) => f.locale == locale)
                      .firstOrNull
                      ?.keys
                      .where((TranslationKey tr) => tr.key == keys[i])
                      .firstOrNull
                      ?.value ??
                  missingTranslationText,
          ],
      ],
      theme: BabelTheme.defaultAnsiGridTheme,
    );

    return grid.toString();
  }

  String getTranslationJson({required final List<String> keys}) {
    final String title = AnsiOutlinedText(
      name,
      foregroundColor: BabelColors.light,
      border: AnsiBorder.$default,
      padding: AnsiPadding.horizontal(2),
    ).formattedText;

    final String json = const JsonEncoder.withIndent('  ')
        .convert(getTranslationJsonData(keys: keys, formatted: false))
        .colored(foreground: BabelColors.light);

    return '$title\n$json';
  }

  Map<Object, Object> getTranslationJsonData({
    required final List<String> keys,
    final bool formatted = true,
  }) {
    final String missing = formatted //
        ? missingTranslationText.formattedText
        : missingTranslationText.text;

    return <Object, Object>{
      for (final String key in keys)
        key: <String, String>{
          for (final String locale in project.locales) //
            locale: project.translations
                    .where((TranslationFile f) => f.locale == locale)
                    .firstOrNull
                    ?.keys
                    .where((TranslationKey tr) => tr.key == key)
                    .firstOrNull
                    ?.value ??
                missing
        },
    };
  }

  void printToFile(final String content) {
    try {
      if (exportDirectory == null) {
        return;
      }

      Trace.info('');

      if (!exportDirectory!.existsSync()) {
        exportDirectory!.createSync(recursive: true);
      }

      Trace.printListItem(
          'Writing ${name.bold()} report to ${exportDirectory!.path}');

      File(
        join(exportDirectory!.path, exportFilename),
      ).writeAsString(content);

      Trace.printListItem(
        'Successfully exported ${exportFilename.bold()}',
        level: 0,
        map: <int, ListItemTheme>{
          0: BabelTheme.successListItemTheme,
        },
      );
    } catch (e, st) {
      Trace.error(
        'Failed printing $exportFilename to ${exportDirectory!.path}',
        error: e,
        stackTrace: st,
      );
    }
  }
}
