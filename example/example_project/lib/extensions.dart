import 'package:example_project/generated/l10n.dart';
import 'package:example_project/locale.dart';
import 'package:flutter/material.dart';

typedef TranslationProvider = String Function(S translations);

extension TranslationsExtension on BuildContext {
  @pragma('vm:prefer-inline')
  S get translations => S.of(this);

  Locale get locale => Localizations.localeOf(this);

  bool get isEnglish => locale.toString() == AppLocale.english.countryCode;

  bool get isSwedish => locale.toString() == AppLocale.greek.countryCode;
}

mixin TranslationsMixin<T extends StatefulWidget> on State<T> {
  @pragma('vm:prefer-inline')
  S get translations => context.translations;
}
