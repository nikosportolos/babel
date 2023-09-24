import 'package:babel/src/reports/report.dart';
import 'package:trace/trace.dart';

class AllTranslationsReport extends Report {
  AllTranslationsReport(super.project);

  @override
  void generate() {
    Trace.printListItem('Generating translations list...');
    printTranslationGrid(project.distinctKeys);
  }
}
