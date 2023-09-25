import 'dart:convert';
import 'dart:io';

import 'package:babel/src/babel.dart';
import 'package:babel/src/models/translations/file.dart';
import 'package:babel/src/reports/reports.dart';
import 'package:dart_cmder/dart_cmder.dart';
import 'package:trace/trace.dart';

class CleanUnusedTranslationsCommand extends BaseCommand {
  @override
  String get name => 'unused-translations';

  @override
  String get description => 'Deletes all unused translation keys.';

  @override
  Future<void> execute() async {
    final Babel babel = Babel.fromPath(path);

    Trace.info('\nClearing unused translation keys');

    final UnusedTranslationsReport report = UnusedTranslationsReport(babel.project);
    await report.generate();

    for (final TranslationFile translationFile in babel.project.translations) {
      final File file = File(translationFile.path);
      final Map<String, dynamic> json = jsonDecode(file.readAsStringSync());
      json.removeWhere((String key, dynamic value) => report.keys.contains(key));
      file.writeAsStringSync(const JsonEncoder.withIndent(' ').convert(json));
    }
  }
}
