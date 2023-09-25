import 'package:babel/babel.dart';
import 'package:babel/src/reports/all_translations.dart';
import 'package:dart_cmder/dart_cmder.dart';

class ListAllCommand extends BaseCommand {
  @override
  String get name => 'all';

  @override
  String get description => 'List all translation keys of the project';

  ListAllCommand()
      : super(
          arguments: <BaseArgument<void>>[
            const OptionArgument<String>(
              name: 'export-path',
              abbr: 'e',
              help: 'If this field is not empty, it will be used to export the results.',
            ),
          ],
        );

  @override
  Future<void> execute() async {
    final Babel babel = Babel.fromPath(path);
    babel.printInfo();

    await AllTranslationsReport(babel.project).generateAndPrint();
  }
}
