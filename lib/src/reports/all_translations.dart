import 'package:babel/src/reports/report.dart';

class AllTranslationsReport extends Report {
  AllTranslationsReport(
    super.project, {
    super.mode,
    super.exportDirectory,
  }) : super(name: 'All Translations');

  @override
  Future<void> generate() async {
    keys
      ..clear()
      ..addAll(project.distinctKeys);
  }
}
