import 'dart:convert';
import 'dart:io';

import 'package:ansix/ansix.dart';
import 'package:babel/src/babel.dart';
import 'package:babel/src/models/translations/file.dart';
import 'package:babel/src/models/translations/key.dart';
import 'package:babel/src/utils/loader.dart';
import 'package:collection/collection.dart';
import 'package:dart_cmder/dart_cmder.dart';
import 'package:path/path.dart';
import 'package:trace/trace.dart';

class SortCommand extends BaseCommand {
  @override
  String get name => 'sort';

  @override
  String get description => 'Sorts the translation keys in arb files.';

  @override
  Future<void> execute() async {
    final Babel babel = Babel.fromPath(path);

    Trace.info('\nSorting translation keys');

    for (final TranslationFile translationFile in babel.project.translations) {
      final List<TranslationKey> sorted = translationFile.keys.sorted((TranslationKey a, TranslationKey b) {
        return a.key.compareTo(b.key);
      });

      final Map<String, dynamic> json = <String, dynamic>{
        Loader.localeTag: translationFile.locale,
      };

      for (TranslationKey tr in sorted) {
        json.addAll(<String, dynamic>{
          tr.key: tr.value,
          if (tr.hasAttributes)
            '@${tr.key}': <String, dynamic>{
              if (tr.attributes.description != null) //
                'description': tr.attributes.description,
              ...tr.attributes.placeholders,
            },
        });
      }

      File(translationFile.path).writeAsStringSync(
        const JsonEncoder.withIndent('  ').convert(json),
      );

      Trace.printListItem(
        basename(translationFile.path).bold(),
        level: 1,
      );
    }
  }
}
