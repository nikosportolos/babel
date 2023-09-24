import 'dart:io';

import 'package:ansix/ansix.dart';
import 'package:babel/src/reports/report.dart';
import 'package:babel/src/utils/utils.dart';
import 'package:path/path.dart';
import 'package:trace/trace.dart';

class UnusedTranslationsReport extends Report {
  UnusedTranslationsReport(super.project);

  @override
  void generate() {
    Trace.printListItem('Generating unused translations list...');

    final List<String> excludedPaths = <String>[
      join(project.root.absolute.path, 'lib', 'generated'),
      join(project.root.absolute.path, 'lib', 'generated', 'intl'),
    ];

    final List<FileSystemEntity> dartFiles = FileHelper.findDartFiles(path: project.lib.path)
        .where((FileSystemEntity f) => !excludedPaths.contains(dirname(f.absolute.path)))
        .toList(growable: false);

    final List<String> distinctKeys = project.distinctKeys;
    final Set<String> unusedKeys = Set<String>.from(distinctKeys);

    for (final FileSystemEntity file in dartFiles) {
      final String content = File(file.absolute.path).readAsStringSync();

      for (final String key in distinctKeys) {
        if (RegExp(key).hasMatch(content)) {
          unusedKeys.remove(key);
        }
      }
    }

    Trace.printListItem('Searched in ${dartFiles.length.toString().bold()} dart files');
    Trace.printListItem('Found ${unusedKeys.length.toString().bold()} unused translation keys');

    printTranslationGrid(
      unusedKeys.toList(growable: false),
    );
  }
}
