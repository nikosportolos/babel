import 'package:example_project/extensions.dart';
import 'package:example_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TranslationsMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).app_name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(translations.thisIsAnExampleApp),
          // Text(S.of(context).btnSave),
        ],
      ),
    );
  }
}
