import 'package:babel/src/exceptions/exceptions.dart';
import 'package:babel/src/models/models.dart';
import 'package:babel/src/utils/loader.dart';
import 'package:path/path.dart';
import 'package:test/test.dart';

import '../mocks/mocks.dart';

void main() {
  group('Loader', () {
    group('LocalizationOptions', () {
      test('empty arb dir', () {
        expect(
          () => Loader.loadLocalizationOptions(join(
            localizationOptionsMocksPath,
            'empty_arb_dir',
          )),
          throwsA(isA<ArbDirNotFound>()),
        );
      });

      test('no l10n.yaml', () {
        expect(
          () => Loader.loadLocalizationOptions(join(
            localizationOptionsMocksPath,
            'no_l10n',
          )),
          throwsA(isA<LocalizationOptionsNotFound>()),
        );
      });

      test('all options', () {
        final LocalizationOptions options = Loader.loadLocalizationOptions(
          join(localizationOptionsMocksPath, 'all_options'),
        );

        expect(options.arbDir, 'lib/l10n');
        expect(options.templateArbFile, 'intl_en.arb');
        expect(options.outputLocalizationFile, 'app_localizations.dart');
        expect(options.outputClass, 'S');
        expect(options.nullableGetter, false);
        expect(options.useEscaping, true);
        expect(options.untranslatedMessagesFile, 'untranslated.txt');
        // TODO: Test all available options
      });
    });

    group('loadTranslationsFromPath', () {
      final List<TranslationFile> translations = Loader.loadTranslationsFromPath(
        exampleTranslationsPath,
      )..sort((TranslationFile a, TranslationFile b) => a.locale.compareTo(b.locale));

      test('2 arb files', () {
        expect(translations.length, 2);
      });

      test('el', () {
        expect(translations.first.locale, 'el');
        expect(translations.first.path, join(exampleTranslationsPath, 'intl_el.arb'));

        final List<TranslationKey> elKeys = translations.first.keys.toList(growable: false);
        expect(
          elKeys,
          <TranslationKey>[
            const TranslationKey(
              key: 'app_name',
              value: 'Example App',
              attributes: TranslationKeyAttributes(
                description: 'Application name',
              ),
            ),
            const TranslationKey(key: 'btnCancel', value: 'Cancel'),
            const TranslationKey(key: 'btnOk', value: 'Ok'),
            const TranslationKey(key: 'btnSave', value: 'Save'),
            const TranslationKey(key: 'demoMessage', value: 'This is a demo message'),
          ],
        );
      });

      test('en', () {
        final List<TranslationKey> enKeys = translations.last.keys.toList(growable: false);
        expect(translations.last.locale, 'en');
        expect(translations.last.path, join(exampleTranslationsPath, 'intl_en.arb'));
        expect(enKeys.length, 5);

        expect(
          enKeys,
          <TranslationKey>[
            const TranslationKey(
              key: 'app_name',
              value: 'Example App',
              attributes: TranslationKeyAttributes(
                description: 'Application name',
              ),
            ),
            const TranslationKey(key: 'btnOk', value: 'Ok'),
            const TranslationKey(key: 'btnSave', value: 'Save'),
            const TranslationKey(key: 'demoMessage', value: 'This is a demo message'),
            const TranslationKey(key: 'thisIsAnExampleApp', value: 'This is an example app'),
          ],
        );
      });
    });

    group('loadProjectFromPath', () {
      test('throws on invalid path', () {
        expect(
          () => Loader.loadProjectFromPath('.'),
          throwsA(isA<LocalizationOptionsNotFound>()),
        );
      });

      test('invalid arb dir', () {
        expect(
          () => Loader.loadProjectFromPath(join(
            localizationOptionsMocksPath,
            'invalid_arb_dir',
          )),
          throwsA(isA<InvalidArbDir>()),
        );
      });

      test('throws on invalid (null) path', () {
        expect(
          () => Loader.loadProjectFromPath(null),
          throwsA(isA<LocalizationOptionsNotFound>()),
        );
      });

      test('loads and returns a valid project', () {
        final Project project = Loader.loadProjectFromPath(exampleProjectPath);
        expect(project.translations.length, 2);
        expect(project.lib.path, join(exampleProjectPath, 'lib'));
        expect(project.distinctKeys.length, 6);
        expect(project.locales.length, 2);
      });
    });
  });
}
