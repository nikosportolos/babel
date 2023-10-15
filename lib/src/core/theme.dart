// coverage:ignore-file

import 'package:ansix/ansix.dart';
import 'package:babel/cli/runner.dart' show babelDescription;
import 'package:dart_cmder/dart_cmder.dart';
import 'package:trace/trace.dart';

class BabelColors {
  static const AnsiColor primary = AnsiColor.deepSkyBlue3;
  static const AnsiColor accent = AnsiColor.deepSkyBlue5;
  static const AnsiColor dark = AnsiColor.deepSkyBlue7;
  static const AnsiColor light = AnsiColor.lightSkyBlue3;

  static const AnsiColor text = AnsiColor.grey84;
  static const AnsiColor subtitle = AnsiColor.grey74;

  static const AnsiColor success = AnsiColor.green;
  static const AnsiColor warning = AnsiColor.orange3;
  static const AnsiColor error = AnsiColor.red;
  static const AnsiColor fatal = AnsiColor.red2;

  static const List<AnsiColor> colors = <AnsiColor>[
    primary,
    accent,
    dark,
    text,
    subtitle,
    warning,
    success,
    error,
    fatal,
  ];
}

class BabelTheme {
  static final Logo logo = Logo(
    title: AnsiText(
      '╔═╗   ╔══╗  ╔═╗   ╔══╗  ╦   \n'
      '╠═╩╗  ╠══╣  ╠═╩╗  ║═╣   ║   \n'
      '╚══╝  ╩  ╩  ╚══╝  ╚══╝  ╩══╝\n',
      style: const AnsiTextStyle(bold: true),
      alignment: AnsiTextAlignment.center,
      foregroundColor: BabelColors.primary,
    ),
    subtitle: AnsiText(
      babelDescription,
      style: const AnsiTextStyle(italic: true),
      alignment: AnsiTextAlignment.center,
      padding: AnsiPadding.horizontal(4),
      foregroundColor: BabelColors.text,
    ),
    border: const AnsiBorder(
      style: AnsiBorderStyle.rounded,
      type: AnsiBorderType.outside,
      color: BabelColors.dark,
    ),
    wrapOptions: const WrapOptions(lineLength: 120),
  );

  static final Map<LogLevel, AnsiColor> logColorMap = <LogLevel, AnsiColor>{
    LogLevel.none: AnsiColor.none,
    LogLevel.verbose: AnsiColor.none,
    LogLevel.debug: BabelColors.subtitle,
    LogLevel.info: BabelColors.text,
    LogLevel.success: BabelColors.success,
    LogLevel.warning: BabelColors.warning,
    LogLevel.error: BabelColors.error,
    LogLevel.fatal: BabelColors.fatal,
  };

  static const Map<int, ListItemTheme> listItemThemeMap = <int, ListItemTheme>{
    0: ListItemTheme(
      '>',
      foregroundColor: BabelColors.primary,
    ),
    1: ListItemTheme(
      '─',
      foregroundColor: BabelColors.accent,
    ),
    3: ListItemTheme('○'),
  };

  static const ListItemTheme successListItemTheme = ListItemTheme(
    '✔',
    foregroundColor: BabelColors.success,
  );

  static const ListItemTheme errorListItemTheme = ListItemTheme(
    '❌',
    foregroundColor: BabelColors.error,
  );

  static AnsiTreeViewTheme defaultTreeViewTheme = AnsiTreeViewTheme(
    compact: false,
    anchorTheme: const AnsiTreeAnchorTheme(
      color: AnsiColor.deepSkyBlue5,
      style: AnsiBorderStyle.square,
    ),
    keyTheme: const AnsiTreeNodeKeyTheme(
      color: AnsiColor.white,
      textStyle: AnsiTextStyle(bold: true),
    ),
    valueTheme: const AnsiTreeNodeValueTheme(
      textStyle: AnsiTextStyle(italic: true),
      alignment: AnsiTextAlignment.left,
      color: AnsiColor.grey69,
      wrapText: true,
    ),
    headerTheme: AnsiTreeHeaderTheme(
      customHeader: 'Translations',
      textTheme: AnsiTextTheme(
        style: const AnsiTextStyle(bold: true),
        padding: AnsiPadding.horizontal(2),
        foregroundColor: BabelColors.text,
        alignment: AnsiTextAlignment.left,
      ),
      border: const AnsiBorder(
        style: AnsiBorderStyle.square,
        type: AnsiBorderType.all,
        color: AnsiColor.deepSkyBlue5,
      ),
    ),
  );

  static final AnsiGridTheme defaultAnsiGridTheme = AnsiGridTheme(
    headerTextTheme: AnsiTextTheme(
      alignment: AnsiTextAlignment.center,
      backgroundColor: AnsiColor.deepSkyBlue7,
      style: const AnsiTextStyle(bold: true),
      padding: AnsiPadding.symmetric(vertical: 1, horizontal: 2),
    ),
    overrideTheme: true,
    keepSameWidth: false,
    wrapText: true,
    wrapOptions: const WrapOptions(
      lineLength: 35,
    ),
    border: const AnsiBorder(
      style: AnsiBorderStyle.rounded,
      type: AnsiBorderType.all,
      color: AnsiColor.white,
    ),
    cellTextTheme: AnsiTextTheme(
      alignment: AnsiTextAlignment.center,
      padding: AnsiPadding.horizontal(2),
    ),
  );
}
