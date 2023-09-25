import 'package:example_project/generated/l10n.dart';
import 'package:example_project/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
    localizationsDelegates: [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
  ));
}
