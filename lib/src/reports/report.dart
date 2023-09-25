import 'dart:io';

import 'package:ansix/ansix.dart';
import 'package:babel/src/models/models.dart';
import 'package:collection/collection.dart';
import 'package:dart_cmder/dart_cmder.dart';
import 'package:path/path.dart';
import 'package:trace/trace.dart';

enum ReportDisplayMode { grid, tree }

abstract class Report {
  Report(
    this.project, {
    this.mode = ReportDisplayMode.grid,
  });

  final Project project;
  final ReportDisplayMode mode;
  final List<String> keys = <String>[];

  Future<void> generate();

  Future<void> generateAndPrint({final ReportDisplayMode mode = ReportDisplayMode.grid});

  void print({final ReportDisplayMode mode = ReportDisplayMode.grid}) {
    if (keys.isEmpty) {
      return;
    }

    switch (mode) {
      case ReportDisplayMode.grid:
        printTranslationGrid(keys);
        break;

      case ReportDisplayMode.tree:
        printTranslationTree(keys);
        break;
    }
  }

  List<FileSystemEntity> getProjectFiles() {
    final List<String> excludedPaths = <String>[
      join(project.root.absolute.path, 'lib', 'generated'),
      join(project.root.absolute.path, 'lib', 'generated', 'intl'),
    ];

    return Finder.findDartFiles(path: project.lib.path)
        .where((FileSystemEntity f) => !excludedPaths.contains(dirname(f.absolute.path)))
        .toList(growable: false);
  }

  void printTranslationTree(final List<String> keys) {
    final Map<Object, Object> data = <Object, Object>{
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
                'missing translation'.bold().red(),
        },
    };

    AnsiX.printTreeView(
      data,
      theme: AnsiTreeViewTheme(
        anchorTheme: const AnsiTreeAnchorTheme(
          color: AnsiColor.deepSkyBlue5,
          style: AnsiBorderStyle.square,
        ),
        keyTheme: const AnsiTreeNodeKeyTheme(
          color: AnsiColor.white,
          textStyle: AnsiTextStyle(bold: true),
        ),
        valueTheme: const AnsiTreeNodeValueTheme(
          textStyle: AnsiTextStyle(italic: true),
          alignment: AnsiTextAlignment.left,
          color: AnsiColor.grey69,
          wrapText: true,
          wrapOptions: WrapOptions(lineLength: 100),
        ),
        headerTheme: AnsiTreeHeaderTheme(
          customHeader: 'Translations',
          textTheme: AnsiTextTheme(
            style: const AnsiTextStyle(bold: true),
            padding: AnsiPadding.horizontal(2),
            foregroundColor: AnsiColor.white,
            alignment: AnsiTextAlignment.left,
          ),
          border: const AnsiBorder(
            style: AnsiBorderStyle.square,
            type: AnsiBorderType.all,
            color: AnsiColor.deepSkyBlue5,
          ),
        ),
      ),
    );
  }

  void printTranslationGrid(final List<String> keys) {
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
                  AnsiText(
                    'missing translation',
                    foregroundColor: AnsiColor.red,
                    style: const AnsiTextStyle(bold: true),
                    padding: AnsiPadding.horizontal(2),
                  ),
          ],
      ],
      theme: AnsiGridTheme(
        headerTextTheme: AnsiTextTheme(
          alignment: AnsiTextAlignment.center,
          backgroundColor: AnsiColor.deepSkyBlue7,
          style: const AnsiTextStyle(bold: true),
          padding: AnsiPadding.symmetric(vertical: 1, horizontal: 2),
        ),
        overrideTheme: true,
        keepSameWidth: false,
        wrapText: true,
        wrapOptions: const WrapOptions(
          lineLength: 35,
        ),
        border: const AnsiBorder(
          style: AnsiBorderStyle.square,
          type: AnsiBorderType.all,
          color: AnsiColor.white,
        ),
        cellTextTheme: AnsiTextTheme(
          alignment: AnsiTextAlignment.center,
          padding: AnsiPadding.horizontal(2),
        ),
      ),
    );

    Trace.info(grid);
  }
}
