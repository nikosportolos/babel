import 'dart:io';

import 'package:ansix/ansix.dart';
import 'package:babel/src/analyzer/analyzer.dart';
import 'package:babel/src/core/theme.dart';
import 'package:babel/src/reports/report.dart';
import 'package:dart_cmder/dart_cmder.dart';
import 'package:path/path.dart';
import 'package:trace/trace.dart';

class UnusedTranslationsReport extends Report {
  UnusedTranslationsReport(
    super.project, {
    super.mode,
    super.exportDirectory,
  }) : super(name: 'Unused Translations');

  @override
  Future<void> generate() async {
    final List<String> excludedPaths = <String>[
      join(project.root.absolute.path, 'lib', 'generated'),
      join(project.root.absolute.path, 'lib', 'generated', 'intl'),
    ];

    final List<String> filesPaths = <String>[];

    final List<FileSystemEntity> dartFiles =
        Finder.findDartFiles(path: project.lib.path)
            .where((FileSystemEntity f) =>
                !excludedPaths.contains(dirname(f.absolute.path)))
            .toList(growable: false);

    final String filesCount = '${dartFiles.length}'
        .styled(const AnsiTextStyle(bold: true), BabelColors.primary);
    Trace.printListItem('Project contains $filesCount dart files');

    final List<String> distinctKeys = project.distinctKeys;
    final Set<String> unusedKeys = Set<String>.from(distinctKeys);

    for (final FileSystemEntity file in dartFiles) {
      final String content = File(file.absolute.path).readAsStringSync();

      for (final String key in distinctKeys) {
        if (RegExp(key).hasMatch(content)) {
          unusedKeys.remove(key);
          filesPaths.add(file.absolute.path);
        }
      }
    }

    final String referenceFilesCount = filesPaths
        .toSet()
        .toList(growable: false)
        .length
        .toString()
        .styled(const AnsiTextStyle(bold: true), BabelColors.primary);
    Trace.printListItem('Found references in $referenceFilesCount dart files');

    if (filesPaths.isNotEmpty) {
      Trace.printListItem(
          'Analyzing dart files to discover translation keys usage');
      final Set<String> references = await BabelAnalyzer().getReferences(
        filesPaths,
        searchClass: project.options.outputClass,
        rootDir: project.root.path,
      );

      if (references.isNotEmpty) {
        unusedKeys.removeAll(<String>[
          for (final String key in unusedKeys)
            if (references.contains(key)) key
        ]);

        unusedKeys.addAll(<String>[
          for (final String key in distinctKeys)
            if (!references.contains(key)) key
        ]);
      }
    }

    if (unusedKeys.isNotEmpty) {
      final String unusedKeysCount = '${unusedKeys.length}'
          .styled(const AnsiTextStyle(bold: true), BabelColors.primary);
      Trace.printListItem(
        'Found $unusedKeysCount unused translation keys',
        logLevel: LogLevel.warning,
      );

      keys
        ..clear()
        ..addAll(unusedKeys);

      return;
    }

    Trace.printListItem(
      'No unused translation keys found',
      logLevel: LogLevel.success,
    );
  }
}
