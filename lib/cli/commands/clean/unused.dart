// coverage:ignore-file

import 'package:babel/src/babel.dart';
import 'package:dart_cmder/dart_cmder.dart';

class CleanUnusedTranslationsCommand extends BaseCommand {
  @override
  String get name => 'unused-translations';

  @override
  String get description => 'Deletes all unused translation keys.';

  @override
  Future<void> execute() async {
    await Babel.fromPath(path).cleanUnusedTranslations();
  }
}
