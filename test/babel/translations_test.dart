import 'package:babel/src/models/models.dart';
import 'package:test/test.dart';

import '../mocks/mocks.dart';

void main() {
  group('TranslationKey ', () {
    test('hasAttributes', () {
      final TranslationKey key = exampleProject.translations.first.keys
          .where((TranslationKey k) => k.key == 'app_name')
          .first;
      expect(key.hasAttributes, true);
    });

    test('!hasAttributes', () {
      final TranslationKey key = exampleProject.translations.last.keys
          .where((TranslationKey k) => k.key == 'thisIsAnExampleApp')
          .first;
      expect(key.hasAttributes, false);
    });
  });
}
