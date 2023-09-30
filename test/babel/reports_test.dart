import 'package:babel/src/reports/reports.dart';
import 'package:test/test.dart';

import '../mocks/mocks.dart';

void main() {
  group('Reports', () {
    test('AllTranslationsReport', () async {
      final AllTranslationsReport report = AllTranslationsReport(exampleProject);
      await report.generate();
      expect(report.keys.length, 6);
      expect(
        report.keys,
        <String>['app_name', 'btnCancel', 'btnOk', 'btnSave', 'demoMessage', 'thisIsAnExampleApp'],
      );
    });

    test('MissingTranslationsReport', () async {
      final MissingTranslationsReport report = MissingTranslationsReport(exampleProject);
      await report.generate();
      expect(report.keys.length, 2);
      expect(
        report.keys,
        <String>['btnCancel', 'thisIsAnExampleApp'],
      );
    });

    test('UnusedTranslationsReport', () async {
      final UnusedTranslationsReport report = UnusedTranslationsReport(exampleProject);
      await report.generate();
      expect(report.keys.length, 3);
      expect(
        report.keys,
        <String>['btnCancel', 'demoMessage', 'btnSave'],
      );
    });
  });
}
