import 'package:babel/src/models/models.dart';
import 'package:babel/src/reports/report.dart';
import 'package:trace/trace.dart';

class MissingTranslationsReport extends Report {
  MissingTranslationsReport(super.project);

  @override
  void generate() {
    if (project.translations.length == 1) {
      Trace.warning('Single arb file found.');
      return;
    }

    Trace.printListItem('Generating missing translations list...');

    final List<String> missingKeys = <String>[
      for (final String key in project.distinctKeys)
        for (final String locale in project.locales)
          if (project.translations
                  .where((TranslationFile f) => f.locale == locale)
                  .firstOrNull
                  ?.keys
                  .where((TranslationKey tr) => tr.key == key)
                  .firstOrNull
                  ?.value ==
              null)
            key
    ];

    printTranslationGrid(missingKeys);
  }
}
