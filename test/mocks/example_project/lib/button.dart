import 'package:example_project/extensions.dart';
import 'package:flutter/material.dart';
import 'package:trace/trace.dart';

class DemoButton extends StatelessWidget {
  const DemoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Trace.info(DateTime.now()),
      child: Text(
        context.translations.btnOk,
      ),
    );
  }
}
