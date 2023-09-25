// ignore_for_file: avoid_print

import 'dart:io' show IOSink;

import 'package:ansix/ansix.dart';
import 'package:babel/cli/commands/commands.dart';
import 'package:dart_cmder/dart_cmder.dart';
import 'package:trace/trace.dart';

class CliRunner extends BaseRunner {
  static const String _description = 'Translations management for Flutter apps.';

  CliRunner({
    final IOSink? sink,
  }) : super(
          sink: sink,
          executableName: 'babel',
          description: _description,
          $commands: <BaseCommand>[
            ListCommand(),
            SortCommand(),
            CleanCommand(),
          ],
          loggerTheme: LoggerTheme(
            sections: <LogSection>[LogSection.message],
            colorMap: <LogLevel, AnsiColor>{
              LogLevel.none: AnsiColor.none,
              LogLevel.verbose: AnsiColor.none,
              LogLevel.debug: AnsiColor.none,
              LogLevel.info: AnsiColor.grey84,
              LogLevel.success: AnsiColor.green2,
              LogLevel.warning: AnsiColor.orange3,
              LogLevel.error: AnsiColor.red,
              LogLevel.fatal: AnsiColor.red2,
            },
          ),
          logo: Logo(
            title: AnsiText(
              '╔═╗   ╔══╗  ╔═╗   ╔══╗  ╦   \n'
              '╠═╩╗  ╠══╣  ╠═╩╗  ║═╣   ║   \n'
              '╚══╝  ╩  ╩  ╚══╝  ╚══╝  ╩══╝\n',
              style: const AnsiTextStyle(bold: true),
              alignment: AnsiTextAlignment.center,
              foregroundColor: AnsiColor.deepSkyBlue3,
            ),
            subtitle: AnsiText(
              _description,
              style: const AnsiTextStyle(italic: true),
              alignment: AnsiTextAlignment.center,
              padding: AnsiPadding.horizontal(4),
              foregroundColor: AnsiColor.white,
            ),
            theme: const AnsiGridTheme(
              overrideTheme: true,
              border: AnsiBorder(
                style: AnsiBorderStyle.rounded,
                type: AnsiBorderType.outside,
                color: AnsiColor.deepSkyBlue7,
              ),
              cellTextTheme: AnsiTextTheme(
                alignment: AnsiTextAlignment.center,
              ),
            ),
          ),
        );
}
