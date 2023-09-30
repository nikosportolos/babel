// coverage:ignore-file

import 'package:babel/babel.dart';
import 'package:dart_cmder/dart_cmder.dart';

class CleanGeneratedFilesCommand extends BaseCommand {
  @override
  String get name => 'generated-files';

  @override
  String get description => 'Deletes all generated localization files.';

  @override
  Future<void> execute() async {
    await Babel.fromPath(path).cleanGeneratedFiles();
  }
}
