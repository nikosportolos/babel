import 'package:babel/src/babel.dart';
import 'package:babel/src/reports/missing_translations.dart';
import 'package:dart_cmder/dart_cmder.dart';

class ListMissingCommand extends BaseCommand {
  ListMissingCommand();

  @override
  String get name => 'missing';

  @override
  String get description => 'List all missing translation keys of the project';

  @override
  Future<void> execute() async {
    final Babel babel = Babel.fromPath(path);
    babel.printInfo();

    MissingTranslationsReport(babel.project).generate();
  }

  @override
  List<BaseArgument<void>> get arguments => <BaseArgument<void>>[];
}
