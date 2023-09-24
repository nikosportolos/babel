import 'package:dart_cmder/dart_cmder.dart';

class CleanUnusedTranslationsCommand extends BaseCommand {
  CleanUnusedTranslationsCommand();

  @override
  String get name => 'unused-translations';

  @override
  String get description => 'Deletes all unused translation key.';

  @override
  List<BaseArgument<void>> get arguments => <BaseArgument<void>>[];

  @override
  Future<void> execute() async {}
}
