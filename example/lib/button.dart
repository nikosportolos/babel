import 'package:example_project/extensions.dart';
import 'package:flutter/material.dart';

class DemoButton extends StatelessWidget {
  const DemoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // ignore: avoid_print
      onPressed: () => print(DateTime.now()),
      child: Text(
        context.translations.btnOk,
      ),
    );
  }
}
