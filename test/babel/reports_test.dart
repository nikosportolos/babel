import 'dart:io';

import 'package:babel/src/reports/reports.dart';
import 'package:collection/collection.dart';
import 'package:path/path.dart';
import 'package:test/test.dart';

import '../mocks/mocks.dart';

class MockReport extends Report {
  MockReport(
    super.project, {
    required super.name,
  });

  @override
  Future<void> generate() {
    throw UnimplementedError();
  }
}

void main() {
  group('Reports', () {
    test('getProjectFiles', () {
      final MockReport report = MockReport(exampleProject, name: 'Mock');
      final List<FileSystemEntity> files = report.getProjectFiles();

      final List<String> filenames = files
          .map((FileSystemEntity e) => basename(e.path))
          .sorted((String a, String b) => a.compareTo(b));

      expect(files.length, 5);
      expect(
        filenames,
        <String>[
          'button.dart',
          'extensions.dart',
          'home.dart',
          'locale.dart',
          'main.dart'
        ],
      );
    });

    test('AllTranslationsReport', () async {
      final AllTranslationsReport report =
          AllTranslationsReport(exampleProject);
      await report.generate();
      report.keys.sort((String a, String b) => a.compareTo(b));
      expect(report.keys.length, 6);
      expect(
        report.keys,
        <String>[
          'app_name',
          'btnCancel',
          'btnOk',
          'btnSave',
          'demoMessage',
          'thisIsAnExampleApp'
        ],
      );
    });

    test('MissingTranslationsReport', () async {
      final MissingTranslationsReport report =
          MissingTranslationsReport(exampleProject);
      await report.generate();
      report.keys.sort((String a, String b) => a.compareTo(b));
      expect(report.keys.length, 2);
      expect(
        report.keys,
        <String>['btnCancel', 'thisIsAnExampleApp'],
      );
    });

    test('UnusedTranslationsReport', () async {
      final UnusedTranslationsReport report =
          UnusedTranslationsReport(exampleProject);
      await report.generate();
      report.keys.sort((String a, String b) => a.compareTo(b));
      expect(report.keys.length, 3);
      expect(
        report.keys,
        <String>['btnCancel', 'btnSave', 'demoMessage'],
      );
    });
  });
}
