import 'package:babel/cli/commands/clean/generated.dart';
import 'package:babel/cli/commands/clean/unused.dart';
import 'package:dart_cmder/dart_cmder.dart';

export 'generated.dart';
export 'unused.dart';

class CleanCommand extends BaseCommand {
  CleanCommand() {
    <BaseCommand>[
      CleanUnusedTranslationsCommand(),
      CleanGeneratedFilesCommand(),
    ].forEach(addSubcommand);
  }

  @override
  String get name => 'clean';

  @override
  String get description => 'Clean translations-related files';

  @override
  Future<void> execute() async {}

  @override
  List<BaseArgument<void>> get arguments => <BaseArgument<void>>[];
}
