// coverage:ignore-file

import 'package:babel/src/babel.dart';
import 'package:dart_cmder/dart_cmder.dart';

class SortCommand extends BaseCommand {
  @override
  String get name => 'sort';

  @override
  String get description => 'Sorts the translation keys in the arb files of the project.';

  @override
  Future<void> execute() async {
    await Babel.fromPath(path).sortTranslationKeys();
  }
}
