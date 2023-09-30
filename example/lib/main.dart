import 'package:example_project/generated/l10n.dart';
import 'package:example_project/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:trace/trace.dart';

void main() {
  Trace.level = LogLevel.verbose;

  Trace.registerLoggers([
    ConsoleLogger(),
    FileLogger(),
  ]);

  runApp(
    const MaterialApp(
      home: Home(),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    ),
  );
}
