// coverage:ignore-file

import 'package:babel/cli/commands/list/mixin.dart';
import 'package:babel/src/babel.dart';
import 'package:babel/src/reports/mode.dart';
import 'package:dart_cmder/dart_cmder.dart';

class ListMissingCommand extends BaseCommand with ListCommandMixin {
  @override
  String get name => 'missing';

  @override
  String get description => 'List all missing translation keys of the project';

  ListMissingCommand() : super(arguments: ListCommandMixin.listArguments);

  @override
  Future<void> execute() async {
    await Babel.fromPath(path).printReport(
      reportMode: ReportMode.missing,
      displayMode: mode,
      exportDirectory: exportDirectory,
    );
  }
}
