// ignore_for_file: avoid_print
// coverage:ignore-file

import 'dart:io' show IOSink;

import 'package:babel/cli/commands/commands.dart';
import 'package:babel/src/core/theme.dart';
import 'package:dart_cmder/dart_cmder.dart';
import 'package:trace/trace.dart';

const String babelDescription = 'Translations management for Flutter apps';

class CliRunner extends BaseRunner {
  CliRunner({
    final IOSink? sink,
  }) : super(
          sink: sink,
          executableName: 'babel',
          description: babelDescription,
          $commands: <BaseCommand>[
            ListCommand(),
            SortCommand(),
            CleanCommand(),
          ],
          loggerTheme: LoggerTheme(
            sections: <LogSection>[LogSection.message],
            colorMap: BabelTheme.logColorMap,
          ),
          logo: BabelTheme.logo,
        ) {
    Trace.listItemThemeMap = BabelTheme.listItemThemeMap;
  }
}
