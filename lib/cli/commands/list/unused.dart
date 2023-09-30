// coverage:ignore-file

import 'package:babel/cli/commands/list/mixin.dart';
import 'package:babel/src/babel.dart';
import 'package:babel/src/reports/mode.dart';
import 'package:dart_cmder/dart_cmder.dart';

class ListUnusedCommand extends BaseCommand with ListCommandMixin {
  @override
  String get name => 'unused';

  @override
  String get description => 'List all unused translation keys of the project';

  ListUnusedCommand() : super(arguments: ListCommandMixin.listArguments);

  @override
  Future<void> execute() async {
    await Babel.fromPath(path).printReport(
      reportMode: ReportMode.unused,
      displayMode: mode,
      exportDirectory: exportDirectory,
    );
  }
}
