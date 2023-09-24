import 'package:babel/src/babel.dart';
import 'package:babel/src/reports/unused_translations.dart';
import 'package:dart_cmder/dart_cmder.dart';

class ListUnusedCommand extends BaseCommand {
  ListUnusedCommand();

  @override
  String get name => 'unused';

  @override
  String get description => 'List all unused translation keys of the project';

  @override
  Future<void> execute() async {
    final Babel babel = Babel.fromPath(path);
    babel.printInfo();

    UnusedTranslationsReport(babel.project).generate();
  }

  @override
  List<BaseArgument<void>> get arguments => <BaseArgument<void>>[];
}
