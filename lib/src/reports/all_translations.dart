import 'package:babel/src/reports/report.dart';
import 'package:trace/trace.dart';

class AllTranslationsReport extends Report {
  AllTranslationsReport(super.project);

  @override
  Future<void> generate() async {
    Trace.printListItem('Generating translations list...');
    keys
      ..clear()
      ..addAll(project.distinctKeys);
  }

  @override
  Future<void> generateAndPrint({ReportDisplayMode mode = ReportDisplayMode.grid}) async {
    await generate();
    super.print(mode: mode);
  }
}
