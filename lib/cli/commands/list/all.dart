// coverage:ignore-file

import 'package:babel/babel.dart';
import 'package:babel/cli/commands/list/mixin.dart';
import 'package:babel/src/reports/mode.dart';
import 'package:dart_cmder/dart_cmder.dart';

class ListAllCommand extends BaseCommand with ListCommandMixin {
  @override
  String get name => 'all';

  @override
  String get description => 'List all translation keys of the project';

  ListAllCommand() : super(arguments: ListCommandMixin.listArguments);

  @override
  Future<void> execute() async {
    await Babel.fromPath(path).printReport(
      reportMode: ReportMode.all,
      displayMode: mode,
      exportDirectory: exportDirectory,
    );
  }
}
