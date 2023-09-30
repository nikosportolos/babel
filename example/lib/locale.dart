import 'package:flutter/material.dart' show Locale;

enum AppLocale {
  english('en', 'GB', 'English'),
  greek('el', 'EL', 'Greek');

  const AppLocale(
    this.languageCode,
    this.countryCode,
    this.name,
  );

  final String languageCode;
  final String countryCode;
  final String name;

  Locale get locale => Locale(countryCode);

  /// Converts [AppLocale] to a json value
  String toJson() => '$languageCode-$countryCode';

  /// Creates an instance of [AppLocale] from [json]
  factory AppLocale.fromJson(String json) {
    return AppLocale.values.firstWhere((AppLocale e) => e.countryCode == json);
  }
}
