import 'dart:io';

import 'package:ansix/ansix.dart';
import 'package:babel/cli/runner.dart';
import 'package:trace/trace.dart';

void main(List<String> args) async {
  try {
    AnsiX.ensureSupportsAnsi(silent: true);
    AnsiX.allowPrint = true;

    await CliRunner().run(args);
    exitCode = 0;
  } catch (e, st) {
    Trace.fatal('❌ Babel crashed! 🤪', e, st);
    await Trace.dispose();
    exitCode = 1;
  }
}
