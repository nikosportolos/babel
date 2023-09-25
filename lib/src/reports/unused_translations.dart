import 'dart:io';

import 'package:ansix/ansix.dart';
import 'package:babel/src/analyzer/analyzer.dart';
import 'package:babel/src/reports/report.dart';
import 'package:dart_cmder/dart_cmder.dart';
import 'package:path/path.dart';
import 'package:trace/trace.dart';

class UnusedTranslationsReport extends Report {
  UnusedTranslationsReport(super.project);

  @override
  Future<void> generate({final bool inDepth = true}) async {
    Trace.printListItem('Generating unused translations list...');

    final List<String> excludedPaths = <String>[
      join(project.root.absolute.path, 'lib', 'generated'),
      join(project.root.absolute.path, 'lib', 'generated', 'intl'),
    ];

    final List<String> filesPaths = <String>[];

    final List<FileSystemEntity> dartFiles = Finder.findDartFiles(path: project.lib.path)
        .where((FileSystemEntity f) => !excludedPaths.contains(dirname(f.absolute.path)))
        .toList(growable: false);

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

    Trace.printListItem('Searched in ${dartFiles.length.toString().bold()} dart files');

    if (inDepth && filesPaths.isNotEmpty) {
      final Set<String> references = await BabelAnalyzer.getReferences(filesPaths);

      unusedKeys.removeAll(<String>[
        for (final String key in unusedKeys)
          if (references.contains(key)) key
      ]);

      unusedKeys.addAll(<String>[
        for (final String key in distinctKeys)
          if (!references.contains(key)) key
      ]);
    }

    if (unusedKeys.isNotEmpty) {
      Trace.printListItem(
        'Found ${unusedKeys.length.toString().bold()} unused translation keys',
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

  @override
  Future<void> generateAndPrint({
    final bool inDepth = true,
    ReportDisplayMode mode = ReportDisplayMode.grid,
  }) async {
    await generate(inDepth: inDepth);
    super.print(mode: mode);
  }
}
