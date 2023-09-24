import 'package:dart_cmder/dart_cmder.dart';

class CleanGeneratedFilesCommand extends BaseCommand {
  CleanGeneratedFilesCommand();

  @override
  String get name => 'generated-files';

  @override
  String get description => 'Deletes all generated translation files.';

  @override
  Future<void> execute() async {}

  @override
  List<BaseArgument<void>> get arguments => <BaseArgument<void>>[];
}
