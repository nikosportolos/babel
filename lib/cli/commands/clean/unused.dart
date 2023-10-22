// coverage:ignore-file

import 'package:babel/src/babel.dart';
import 'package:dart_cmder/dart_cmder.dart';

class CleanUnusedTranslationsCommand extends BaseCommand {
  @override
  String get name => 'unused-translations';

  @override
  String get description => 'Deletes all unused translation keys.';

  CleanUnusedTranslationsCommand()
      : super(arguments: <BaseArgument<void>>[dryRunArg]);

  static const FlagArgument dryRunArg = FlagArgument(
    name: 'dry-run',
    help: 'If set to true, babel will return with error '
        'when unused translations are found in a project.',
    defaultsTo: false,
    negatable: false,
  );

  @override
  Future<void> execute() async {
    final bool dryRun = dryRunArg.parse(argResults);
    await Babel.fromPath(path).cleanUnusedTranslations(dryRun);
  }
}
