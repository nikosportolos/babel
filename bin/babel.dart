import 'dart:io';

import 'package:ansix/ansix.dart';
import 'package:babel/cli/runner.dart';

void main(List<String> args) async {
  AnsiX.ensureSupportsAnsi(silent: true);
  AnsiX.allowPrint = true;

  await CliRunner().run(args);
  exitCode = 0;
}
