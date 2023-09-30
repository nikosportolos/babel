// coverage:ignore-file

import 'dart:io' show Directory;

import 'package:babel/src/reports/mode.dart';
import 'package:dart_cmder/dart_cmder.dart';

mixin ListCommandMixin on BaseCommand {
  Directory? get exportDirectory => exportDirectoryArg.parse(argResults);

  ReportDisplayMode get mode => reportDisplayModeArg.parse(argResults)!;

  static final List<BaseArgument<void>> listArguments = <BaseArgument<void>>[
    exportDirectoryArg,
    reportDisplayModeArg
  ];

  static final DirectoryArgument exportDirectoryArg = DirectoryArgument(
    name: 'export-directory',
    abbr: 'e',
    help: 'If this field is not empty, it will be used to export the results.',
    valueBuilder: (Object? value) {
      return Finder.findDirectoryFromPath(value.toString());
    },
  );

  static const EnumArgument<ReportDisplayMode> reportDisplayModeArg =
      EnumArgument<ReportDisplayMode>(
    name: 'mode',
    abbr: 'm',
    help: 'Defines how the report will be displayed.',
    allowedValues: ReportDisplayMode.values,
    defaultsTo: ReportDisplayMode.grid,
  );
}
