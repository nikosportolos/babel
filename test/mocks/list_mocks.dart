import 'package:babel/src/reports/report.dart'
    show ReportMode, ReportDisplayMode;

const Map<ReportMode, Map<ReportDisplayMode, String>> mocks =
    <ReportMode, Map<ReportDisplayMode, String>>{
      ReportMode.all: <ReportDisplayMode, String>{
        ReportDisplayMode.grid: allGridMock,
        ReportDisplayMode.tree: allTreeMock,
        ReportDisplayMode.json: allJsonMock,
      },
      ReportMode.missing: <ReportDisplayMode, String>{
        ReportDisplayMode.grid: missingGridMock,
        ReportDisplayMode.tree: missingTreeMock,
        ReportDisplayMode.json: missingJsonMock,
      },
      ReportMode.unused: <ReportDisplayMode, String>{
        ReportDisplayMode.grid: unusedGridMock,
        ReportDisplayMode.tree: unusedTreeMock,
        ReportDisplayMode.json: unusedJsonMock,
      },
    };

const Map<ReportMode, Map<ReportDisplayMode, String>> filenames =
    <ReportMode, Map<ReportDisplayMode, String>>{
      ReportMode.all: <ReportDisplayMode, String>{
        ReportDisplayMode.grid: 'babel-all-grid.txt',
        ReportDisplayMode.tree: 'babel-all-tree.txt',
        ReportDisplayMode.json: 'babel-all-json.txt',
      },
      ReportMode.missing: <ReportDisplayMode, String>{
        ReportDisplayMode.grid: 'babel-missing-grid.txt',
        ReportDisplayMode.tree: 'babel-missing-tree.txt',
        ReportDisplayMode.json: 'babel-missing-json.txt',
      },
      ReportMode.unused: <ReportDisplayMode, String>{
        ReportDisplayMode.grid: 'babel-unused-grid.txt',
        ReportDisplayMode.tree: 'babel-unused-tree.txt',
        ReportDisplayMode.json: 'babel-unused-json.txt',
      },
    };

const Map<ReportMode, Map<ReportDisplayMode, String>> exports =
    <ReportMode, Map<ReportDisplayMode, String>>{
      ReportMode.all: <ReportDisplayMode, String>{
        ReportDisplayMode.grid: allGridExport,
        ReportDisplayMode.tree: allTreeExport,
        ReportDisplayMode.json: allJsonExport,
      },
      ReportMode.missing: <ReportDisplayMode, String>{
        ReportDisplayMode.grid: missingGridExport,
        ReportDisplayMode.tree: missingTreeExport,
        ReportDisplayMode.json: missingJsonExport,
      },
      ReportMode.unused: <ReportDisplayMode, String>{
        ReportDisplayMode.grid: unusedGridExport,
        ReportDisplayMode.tree: unusedTreeExport,
        ReportDisplayMode.json: unusedJsonExport,
      },
    };

const String allJsonMock =
    r'''> Localization options file found in [1mexample\l10n.yaml[22m
> Found [1m2[22m arb files in [1mexample\lib\l10n[22m:
  ─ intl_el.arb
  ─ intl_en.arb
> Generating report:
  ─ Name: [1mAll Translations[22m
  ─ Mode: [1mJSON[22m

[38;5;15m┌────────────────────┐[0m
[38;5;15m│[0m  [38;5;110mAll Translations  [0m[38;5;15m│[0m
[38;5;15m└────────────────────┘[0m
[38;5;110m{
  "app_name": {
    "el": "Example App",
    "en": "Example App"
  },
  "btnCancel": {
    "el": "Cancel",
    "en": "(missing translation)"
  },
  "btnOk": {
    "el": "Ok",
    "en": "Ok"
  },
  "btnSave": {
    "el": "Save",
    "en": "Save"
  },
  "demoMessage": {
    "el": "This is a demo message",
    "en": "This is a demo message"
  },
  "thisIsAnExampleApp": {
    "el": "(missing translation)",
    "en": "This is an example app"
  }
}[0m

> Writing [1mAll Translations[22m report to D:\workspace\Flutter\Packages\babel\test\export
[38;5;2m✔[0m Successfully exported [1mbabel-all-json.txt[22m
''';

const String allTreeMock = r'''
> Localization options file found in [1mexample\l10n.yaml[22m
> Found [1m2[22m arb files in [1mexample\lib\l10n[22m:
  ─ intl_el.arb
  ─ intl_en.arb
> Generating report:
  ─ Name: [1mAll Translations[22m
  ─ Mode: [1mTree View[22m

[38;5;31m┌────────────────────┐[0m
[38;5;31m│[0m  [1m[38;5;188mAll Translations[22m  [0m[38;5;31m│[0m
[38;5;31m└──────────┬─────────┘[0m
           [38;5;31m│[0m
           [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mapp_name[22m[0m
           [38;5;31m│[0m     [38;5;31m│[0m
           [38;5;31m│[0m     [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mel[22m[0m: [38;5;145m[3mExample App[23m[0m
           [38;5;31m│[0m     [38;5;31m│[0m
           [38;5;31m│[0m     [38;5;31m└[0m[38;5;31m────[0m [38;5;15m[1men[22m[0m: [38;5;145m[3mExample App[23m[0m
           [38;5;31m│[0m
           [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mbtnCancel[22m[0m
           [38;5;31m│[0m     [38;5;31m│[0m
           [38;5;31m│[0m     [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mel[22m[0m: [38;5;145m[3mCancel[23m[0m
           [38;5;31m│[0m     [38;5;31m│[0m
           [38;5;31m│[0m     [38;5;31m└[0m[38;5;31m────[0m [38;5;15m[1men[22m[0m: [38;5;145m[3m[3m[38;5;9m(missing translation)[23m[0m[23m[0m
           [38;5;31m│[0m
           [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mbtnOk[22m[0m
           [38;5;31m│[0m     [38;5;31m│[0m
           [38;5;31m│[0m     [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mel[22m[0m: [38;5;145m[3mOk[23m[0m
           [38;5;31m│[0m     [38;5;31m│[0m
           [38;5;31m│[0m     [38;5;31m└[0m[38;5;31m────[0m [38;5;15m[1men[22m[0m: [38;5;145m[3mOk[23m[0m
           [38;5;31m│[0m
           [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mbtnSave[22m[0m
           [38;5;31m│[0m     [38;5;31m│[0m
           [38;5;31m│[0m     [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mel[22m[0m: [38;5;145m[3mSave[23m[0m
           [38;5;31m│[0m     [38;5;31m│[0m
           [38;5;31m│[0m     [38;5;31m└[0m[38;5;31m────[0m [38;5;15m[1men[22m[0m: [38;5;145m[3mSave[23m[0m
           [38;5;31m│[0m
           [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mdemoMessage[22m[0m
           [38;5;31m│[0m     [38;5;31m│[0m
           [38;5;31m│[0m     [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mel[22m[0m: [38;5;145m[3mThis is a demo message[23m[0m
           [38;5;31m│[0m     [38;5;31m│[0m
           [38;5;31m│[0m     [38;5;31m└[0m[38;5;31m────[0m [38;5;15m[1men[22m[0m: [38;5;145m[3mThis is a demo message[23m[0m
           [38;5;31m│[0m
           [38;5;31m└[0m[38;5;31m────[0m [38;5;15m[1mthisIsAnExampleApp[22m[0m
                 [38;5;31m│[0m
                 [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mel[22m[0m: [38;5;145m[3m[3m[38;5;9m(missing translation)[23m[0m[23m[0m
                 [38;5;31m│[0m
                 [38;5;31m└[0m[38;5;31m────[0m [38;5;15m[1men[22m[0m: [38;5;145m[3mThis is an example app[23m[0m


> Writing [1mAll Translations[22m report to D:\workspace\Flutter\Packages\babel\test\export
[38;5;2m✔[0m Successfully exported [1mbabel-all-tree.txt[22m
''';

const String allGridMock = r'''
> Localization options file found in [1mexample\l10n.yaml[22m
> Found [1m2[22m arb files in [1mexample\lib\l10n[22m:
  ─ intl_el.arb
  ─ intl_en.arb
> Generating report:
  ─ Name: [1mAll Translations[22m
  ─ Mode: [1mData Grid[22m

[0m[38;5;15m╭─────┬──────────────────────┬──────────────────────────┬──────────────────────────╮[0m
[0m[38;5;15m│[0m[48;5;24m  [1m[22m  [48;5;24m [0m[38;5;15m│[0m[48;5;24m         [0m[48;5;24m  [1m[22m  [48;5;24m         [0m[38;5;15m│[0m[48;5;24m           [0m[48;5;24m  [1m[22m  [48;5;24m           [0m[38;5;15m│[0m[48;5;24m           [0m[48;5;24m  [1m[22m  [48;5;24m           [0m[38;5;15m│[0m
[0m[38;5;15m│[0m[48;5;24m  [1m#[22m  [0m[38;5;15m│[0m[48;5;24m [0m[48;5;24m  [1mTranslation key[22m  [0m[48;5;24m  [0m[38;5;15m│[0m[48;5;24m          [0m[48;5;24m  [1mel[22m  [0m[48;5;24m          [0m[38;5;15m│[0m[48;5;24m          [0m[48;5;24m  [1men[22m  [0m[48;5;24m          [0m[38;5;15m│[0m
[0m[38;5;15m│[0m[48;5;24m  [1m[22m  [48;5;24m [0m[38;5;15m│[0m[48;5;24m         [0m[48;5;24m  [1m[22m  [48;5;24m         [0m[38;5;15m│[0m[48;5;24m           [0m[48;5;24m  [1m[22m  [48;5;24m           [0m[38;5;15m│[0m[48;5;24m           [0m[48;5;24m  [1m[22m  [48;5;24m           [0m[38;5;15m│[0m
[0m[38;5;15m├─────┼──────────────────────┼──────────────────────────┼──────────────────────────┤[0m
[0m[38;5;15m│[0m  1  [38;5;15m│[0m       app_name       [38;5;15m│[0m       Example App        [38;5;15m│[0m       Example App        [38;5;15m│[0m
[0m[38;5;15m├─────┼──────────────────────┼──────────────────────────┼──────────────────────────┤[0m
[0m[38;5;15m│[0m  2  [38;5;15m│[0m      btnCancel       [38;5;15m│[0m          Cancel          [38;5;15m│[0m  [3m[38;5;9m(missing translation)[23m[0m   [38;5;15m│[0m
[0m[38;5;15m├─────┼──────────────────────┼──────────────────────────┼──────────────────────────┤[0m
[0m[38;5;15m│[0m  3  [38;5;15m│[0m        btnOk         [38;5;15m│[0m            Ok            [38;5;15m│[0m            Ok            [38;5;15m│[0m
[0m[38;5;15m├─────┼──────────────────────┼──────────────────────────┼──────────────────────────┤[0m
[0m[38;5;15m│[0m  4  [38;5;15m│[0m       btnSave        [38;5;15m│[0m           Save           [38;5;15m│[0m           Save           [38;5;15m│[0m
[0m[38;5;15m├─────┼──────────────────────┼──────────────────────────┼──────────────────────────┤[0m
[0m[38;5;15m│[0m  5  [38;5;15m│[0m     demoMessage      [38;5;15m│[0m  This is a demo message  [38;5;15m│[0m  This is a demo message  [38;5;15m│[0m
[0m[38;5;15m├─────┼──────────────────────┼──────────────────────────┼──────────────────────────┤[0m
[0m[38;5;15m│[0m  6  [38;5;15m│[0m  thisIsAnExampleApp  [38;5;15m│[0m  [3m[38;5;9m(missing translation)[23m[0m   [38;5;15m│[0m  This is an example app  [38;5;15m│[0m
[0m[38;5;15m╰─────┴──────────────────────┴──────────────────────────┴──────────────────────────╯[0m

> Writing [1mAll Translations[22m report to D:\workspace\Flutter\Packages\babel\test\export
[38;5;2m✔[0m Successfully exported [1mbabel-all-grid.txt[22m
''';

const String missingJsonMock = r'''
> Localization options file found in [1mexample\l10n.yaml[22m
> Found [1m2[22m arb files in [1mexample\lib\l10n[22m:
  ─ intl_el.arb
  ─ intl_en.arb
> Generating report:
  ─ Name: [1mMissing Translations[22m
  ─ Mode: [1mJSON[22m

[38;5;15m┌────────────────────────┐[0m
[38;5;15m│[0m  [38;5;110mMissing Translations  [0m[38;5;15m│[0m
[38;5;15m└────────────────────────┘[0m
[38;5;110m{
  "btnCancel": {
    "el": "Cancel",
    "en": "(missing translation)"
  },
  "thisIsAnExampleApp": {
    "el": "(missing translation)",
    "en": "This is an example app"
  }
}[0m

> Writing [1mMissing Translations[22m report to D:\workspace\Flutter\Packages\babel\test\export
[38;5;2m✔[0m Successfully exported [1mbabel-missing-json.txt[22m
''';

const String missingTreeMock = r'''
> Localization options file found in [1mexample\l10n.yaml[22m
> Found [1m2[22m arb files in [1mexample\lib\l10n[22m:
  ─ intl_el.arb
  ─ intl_en.arb
> Generating report:
  ─ Name: [1mMissing Translations[22m
  ─ Mode: [1mTree View[22m

[38;5;31m┌────────────────────────┐[0m
[38;5;31m│[0m  [1m[38;5;188mMissing Translations[22m  [0m[38;5;31m│[0m
[38;5;31m└────────────┬───────────┘[0m
             [38;5;31m│[0m
             [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mbtnCancel[22m[0m
             [38;5;31m│[0m     [38;5;31m│[0m
             [38;5;31m│[0m     [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mel[22m[0m: [38;5;145m[3mCancel[23m[0m
             [38;5;31m│[0m     [38;5;31m│[0m
             [38;5;31m│[0m     [38;5;31m└[0m[38;5;31m────[0m [38;5;15m[1men[22m[0m: [38;5;145m[3m[3m[38;5;9m(missing translation)[23m[0m[23m[0m
             [38;5;31m│[0m
             [38;5;31m└[0m[38;5;31m────[0m [38;5;15m[1mthisIsAnExampleApp[22m[0m
                   [38;5;31m│[0m
                   [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mel[22m[0m: [38;5;145m[3m[3m[38;5;9m(missing translation)[23m[0m[23m[0m
                   [38;5;31m│[0m
                   [38;5;31m└[0m[38;5;31m────[0m [38;5;15m[1men[22m[0m: [38;5;145m[3mThis is an example app[23m[0m


> Writing [1mMissing Translations[22m report to D:\workspace\Flutter\Packages\babel\test\export
[38;5;2m✔[0m Successfully exported [1mbabel-missing-tree.txt[22m
''';

const String missingGridMock = r'''
> Localization options file found in [1mexample\l10n.yaml[22m
> Found [1m2[22m arb files in [1mexample\lib\l10n[22m:
  ─ intl_el.arb
  ─ intl_en.arb
> Generating report:
  ─ Name: [1mMissing Translations[22m
  ─ Mode: [1mData Grid[22m

[0m[38;5;15m╭─────┬──────────────────────┬─────────────────────┬──────────────────────────╮[0m
[0m[38;5;15m│[0m[48;5;24m  [1m[22m  [48;5;24m [0m[38;5;15m│[0m[48;5;24m         [0m[48;5;24m  [1m[22m  [48;5;24m         [0m[38;5;15m│[0m[48;5;24m        [0m[48;5;24m  [1m[22m  [48;5;24m         [0m[38;5;15m│[0m[48;5;24m           [0m[48;5;24m  [1m[22m  [48;5;24m           [0m[38;5;15m│[0m
[0m[38;5;15m│[0m[48;5;24m  [1m#[22m  [0m[38;5;15m│[0m[48;5;24m [0m[48;5;24m  [1mTranslation key[22m  [0m[48;5;24m  [0m[38;5;15m│[0m[48;5;24m       [0m[48;5;24m  [1mel[22m  [0m[48;5;24m        [0m[38;5;15m│[0m[48;5;24m          [0m[48;5;24m  [1men[22m  [0m[48;5;24m          [0m[38;5;15m│[0m
[0m[38;5;15m│[0m[48;5;24m  [1m[22m  [48;5;24m [0m[38;5;15m│[0m[48;5;24m         [0m[48;5;24m  [1m[22m  [48;5;24m         [0m[38;5;15m│[0m[48;5;24m        [0m[48;5;24m  [1m[22m  [48;5;24m         [0m[38;5;15m│[0m[48;5;24m           [0m[48;5;24m  [1m[22m  [48;5;24m           [0m[38;5;15m│[0m
[0m[38;5;15m├─────┼──────────────────────┼─────────────────────┼──────────────────────────┤[0m
[0m[38;5;15m│[0m  1  [38;5;15m│[0m      btnCancel       [38;5;15m│[0m       Cancel        [38;5;15m│[0m  [3m[38;5;9m(missing translation)[23m[0m   [38;5;15m│[0m
[0m[38;5;15m├─────┼──────────────────────┼─────────────────────┼──────────────────────────┤[0m
[0m[38;5;15m│[0m  2  [38;5;15m│[0m  thisIsAnExampleApp  [38;5;15m│[0m[3m[38;5;9m(missing translation)[23m[0m[38;5;15m│[0m  This is an example app  [38;5;15m│[0m
[0m[38;5;15m╰─────┴──────────────────────┴─────────────────────┴──────────────────────────╯[0m

> Writing [1mMissing Translations[22m report to D:\workspace\Flutter\Packages\babel\test\export
[38;5;2m✔[0m Successfully exported [1mbabel-missing-grid.txt[22m
''';

const String unusedJsonMock = r'''
> Localization options file found in [1mexample\l10n.yaml[22m
> Found [1m2[22m arb files in [1mexample\lib\l10n[22m:
  ─ intl_el.arb
  ─ intl_en.arb
> Generating report:
  ─ Name: [1mUnused Translations[22m
  ─ Mode: [1mJSON[22m

> Project contains [38;5;32m[1m5[22m[0m dart files
> Found references in [38;5;32m[1m2[22m[0m dart files
> Analyzing dart files to discover translation keys usage
  ─ [38;5;248m[3m/lib/button.dart[23m[0m
  ─ [38;5;248m[3m/lib/home.dart[23m[0m
> Found [38;5;32m[1m3[22m[0m unused translation keys
[38;5;15m┌───────────────────────┐[0m
[38;5;15m│[0m  [38;5;110mUnused Translations  [0m[38;5;15m│[0m
[38;5;15m└───────────────────────┘[0m
[38;5;110m{
  "btnCancel": {
    "el": "Cancel",
    "en": "(missing translation)"
  },
  "demoMessage": {
    "el": "This is a demo message",
    "en": "This is a demo message"
  },
  "btnSave": {
    "el": "Save",
    "en": "Save"
  }
}[0m

> Writing [1mUnused Translations[22m report to D:\workspace\Flutter\Packages\babel\test\export
[38;5;2m✔[0m Successfully exported [1mbabel-unused-json.txt[22m
''';

const String unusedTreeMock = r'''
> Localization options file found in [1mexample\l10n.yaml[22m
> Found [1m2[22m arb files in [1mexample\lib\l10n[22m:
  ─ intl_el.arb
  ─ intl_en.arb
> Generating report:
  ─ Name: [1mUnused Translations[22m
  ─ Mode: [1mTree View[22m

> Project contains [38;5;32m[1m5[22m[0m dart files
> Found references in [38;5;32m[1m2[22m[0m dart files
> Analyzing dart files to discover translation keys usage
  ─ [38;5;248m[3m/lib/button.dart[23m[0m
  ─ [38;5;248m[3m/lib/home.dart[23m[0m
> Found [38;5;32m[1m3[22m[0m unused translation keys
[38;5;31m┌───────────────────────┐[0m
[38;5;31m│[0m  [1m[38;5;188mUnused Translations[22m  [0m[38;5;31m│[0m
[38;5;31m└──────────┬────────────┘[0m
           [38;5;31m│[0m
           [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mbtnCancel[22m[0m
           [38;5;31m│[0m     [38;5;31m│[0m
           [38;5;31m│[0m     [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mel[22m[0m: [38;5;145m[3mCancel[23m[0m
           [38;5;31m│[0m     [38;5;31m│[0m
           [38;5;31m│[0m     [38;5;31m└[0m[38;5;31m────[0m [38;5;15m[1men[22m[0m: [38;5;145m[3m[3m[38;5;9m(missing translation)[23m[0m[23m[0m
           [38;5;31m│[0m
           [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mdemoMessage[22m[0m
           [38;5;31m│[0m     [38;5;31m│[0m
           [38;5;31m│[0m     [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mel[22m[0m: [38;5;145m[3mThis is a demo message[23m[0m
           [38;5;31m│[0m     [38;5;31m│[0m
           [38;5;31m│[0m     [38;5;31m└[0m[38;5;31m────[0m [38;5;15m[1men[22m[0m: [38;5;145m[3mThis is a demo message[23m[0m
           [38;5;31m│[0m
           [38;5;31m└[0m[38;5;31m────[0m [38;5;15m[1mbtnSave[22m[0m
                 [38;5;31m│[0m
                 [38;5;31m├[0m[38;5;31m────[0m [38;5;15m[1mel[22m[0m: [38;5;145m[3mSave[23m[0m
                 [38;5;31m│[0m
                 [38;5;31m└[0m[38;5;31m────[0m [38;5;15m[1men[22m[0m: [38;5;145m[3mSave[23m[0m


> Writing [1mUnused Translations[22m report to D:\workspace\Flutter\Packages\babel\test\export
[38;5;2m✔[0m Successfully exported [1mbabel-unused-tree.txt[22m
''';

const String unusedGridMock = r'''
> Localization options file found in [1mexample\l10n.yaml[22m
> Found [1m2[22m arb files in [1mexample\lib\l10n[22m:
  ─ intl_el.arb
  ─ intl_en.arb
> Generating report:
  ─ Name: [1mUnused Translations[22m
  ─ Mode: [1mData Grid[22m

> Project contains [38;5;32m[1m5[22m[0m dart files
> Found references in [38;5;32m[1m2[22m[0m dart files
> Analyzing dart files to discover translation keys usage
  ─ [38;5;248m[3m/lib/button.dart[23m[0m
  ─ [38;5;248m[3m/lib/home.dart[23m[0m
> Found [38;5;32m[1m3[22m[0m unused translation keys
[0m[38;5;15m╭─────┬───────────────────┬──────────────────────────┬──────────────────────────╮[0m
[0m[38;5;15m│[0m[48;5;24m  [1m[22m  [48;5;24m [0m[38;5;15m│[0m[48;5;24m       [0m[48;5;24m  [1m[22m  [48;5;24m        [0m[38;5;15m│[0m[48;5;24m           [0m[48;5;24m  [1m[22m  [48;5;24m           [0m[38;5;15m│[0m[48;5;24m           [0m[48;5;24m  [1m[22m  [48;5;24m           [0m[38;5;15m│[0m
[0m[38;5;15m│[0m[48;5;24m  [1m#[22m  [0m[38;5;15m│[0m[48;5;24m  [1mTranslation key[22m  [0m[38;5;15m│[0m[48;5;24m          [0m[48;5;24m  [1mel[22m  [0m[48;5;24m          [0m[38;5;15m│[0m[48;5;24m          [0m[48;5;24m  [1men[22m  [0m[48;5;24m          [0m[38;5;15m│[0m
[0m[38;5;15m│[0m[48;5;24m  [1m[22m  [48;5;24m [0m[38;5;15m│[0m[48;5;24m       [0m[48;5;24m  [1m[22m  [48;5;24m        [0m[38;5;15m│[0m[48;5;24m           [0m[48;5;24m  [1m[22m  [48;5;24m           [0m[38;5;15m│[0m[48;5;24m           [0m[48;5;24m  [1m[22m  [48;5;24m           [0m[38;5;15m│[0m
[0m[38;5;15m├─────┼───────────────────┼──────────────────────────┼──────────────────────────┤[0m
[0m[38;5;15m│[0m  1  [38;5;15m│[0m     btnCancel     [38;5;15m│[0m          Cancel          [38;5;15m│[0m  [3m[38;5;9m(missing translation)[23m[0m   [38;5;15m│[0m
[0m[38;5;15m├─────┼───────────────────┼──────────────────────────┼──────────────────────────┤[0m
[0m[38;5;15m│[0m  2  [38;5;15m│[0m    demoMessage    [38;5;15m│[0m  This is a demo message  [38;5;15m│[0m  This is a demo message  [38;5;15m│[0m
[0m[38;5;15m├─────┼───────────────────┼──────────────────────────┼──────────────────────────┤[0m
[0m[38;5;15m│[0m  3  [38;5;15m│[0m      btnSave      [38;5;15m│[0m           Save           [38;5;15m│[0m           Save           [38;5;15m│[0m
[0m[38;5;15m╰─────┴───────────────────┴──────────────────────────┴──────────────────────────╯[0m

> Writing [1mUnused Translations[22m report to D:\workspace\Flutter\Packages\babel\test\export
[38;5;2m✔[0m Successfully exported [1mbabel-unused-grid.txt[22m
''';

const String allGridExport = r'''
╭────────────────────────────────────────────────╮
│          ╔═╗   ╔══╗  ╔═╗   ╔══╗  ╦             │
│          ╠═╩╗  ╠══╣  ╠═╩╗  ║═╣   ║             │
│          ╚══╝  ╩  ╩  ╚══╝  ╚══╝  ╩══╝          │
│    Translations management for Flutter apps    │
╰────────────────────────────────────────────────╯

> Report: All Translations
> Display mode: Data Grid
> Generated on:

╭─────┬──────────────────────┬──────────────────────────┬──────────────────────────╮
│     │                      │                          │                          │
│  #  │   Translation key    │            el            │            en            │
│     │                      │                          │                          │
├─────┼──────────────────────┼──────────────────────────┼──────────────────────────┤
│  1  │       app_name       │       Example App        │       Example App        │
├─────┼──────────────────────┼──────────────────────────┼──────────────────────────┤
│  2  │      btnCancel       │          Cancel          │  (missing translation)   │
├─────┼──────────────────────┼──────────────────────────┼──────────────────────────┤
│  3  │        btnOk         │            Ok            │            Ok            │
├─────┼──────────────────────┼──────────────────────────┼──────────────────────────┤
│  4  │       btnSave        │           Save           │           Save           │
├─────┼──────────────────────┼──────────────────────────┼──────────────────────────┤
│  5  │     demoMessage      │  This is a demo message  │  This is a demo message  │
├─────┼──────────────────────┼──────────────────────────┼──────────────────────────┤
│  6  │  thisIsAnExampleApp  │  (missing translation)   │  This is an example app  │
╰─────┴──────────────────────┴──────────────────────────┴──────────────────────────╯
''';

const String allTreeExport = r'''
╭────────────────────────────────────────────────╮
│          ╔═╗   ╔══╗  ╔═╗   ╔══╗  ╦             │
│          ╠═╩╗  ╠══╣  ╠═╩╗  ║═╣   ║             │
│          ╚══╝  ╩  ╩  ╚══╝  ╚══╝  ╩══╝          │
│    Translations management for Flutter apps    │
╰────────────────────────────────────────────────╯

> Report: All Translations
> Display mode: Tree View
> Generated on:

┌────────────────────┐
│  All Translations  │
└──────────┬─────────┘
           │
           ├──── app_name
           │     │
           │     ├──── el: Example App
           │     │
           │     └──── en: Example App
           │
           ├──── btnCancel
           │     │
           │     ├──── el: Cancel
           │     │
           │     └──── en: (missing translation)
           │
           ├──── btnOk
           │     │
           │     ├──── el: Ok
           │     │
           │     └──── en: Ok
           │
           ├──── btnSave
           │     │
           │     ├──── el: Save
           │     │
           │     └──── en: Save
           │
           ├──── demoMessage
           │     │
           │     ├──── el: This is a demo message
           │     │
           │     └──── en: This is a demo message
           │
           └──── thisIsAnExampleApp
                 │
                 ├──── el: (missing translation)
                 │
                 └──── en: This is an example app

''';

const String allJsonExport = r'''
╭────────────────────────────────────────────────╮
│          ╔═╗   ╔══╗  ╔═╗   ╔══╗  ╦             │
│          ╠═╩╗  ╠══╣  ╠═╩╗  ║═╣   ║             │
│          ╚══╝  ╩  ╩  ╚══╝  ╚══╝  ╩══╝          │
│    Translations management for Flutter apps    │
╰────────────────────────────────────────────────╯

> Report: All Translations
> Display mode: JSON
> Generated on:

┌────────────────────┐
│  All Translations  │
└────────────────────┘
{
  "app_name": {
    "el": "Example App",
    "en": "Example App"
  },
  "btnCancel": {
    "el": "Cancel",
    "en": "(missing translation)"
  },
  "btnOk": {
    "el": "Ok",
    "en": "Ok"
  },
  "btnSave": {
    "el": "Save",
    "en": "Save"
  },
  "demoMessage": {
    "el": "This is a demo message",
    "en": "This is a demo message"
  },
  "thisIsAnExampleApp": {
    "el": "(missing translation)",
    "en": "This is an example app"
  }
}
''';

const String missingGridExport = r'''
╭────────────────────────────────────────────────╮
│          ╔═╗   ╔══╗  ╔═╗   ╔══╗  ╦             │
│          ╠═╩╗  ╠══╣  ╠═╩╗  ║═╣   ║             │
│          ╚══╝  ╩  ╩  ╚══╝  ╚══╝  ╩══╝          │
│    Translations management for Flutter apps    │
╰────────────────────────────────────────────────╯

> Report: Missing Translations
> Display mode: Data Grid
> Generated on:

╭─────┬──────────────────────┬─────────────────────┬──────────────────────────╮
│     │                      │                     │                          │
│  #  │   Translation key    │         el          │            en            │
│     │                      │                     │                          │
├─────┼──────────────────────┼─────────────────────┼──────────────────────────┤
│  1  │      btnCancel       │       Cancel        │  (missing translation)   │
├─────┼──────────────────────┼─────────────────────┼──────────────────────────┤
│  2  │  thisIsAnExampleApp  │(missing translation)│  This is an example app  │
╰─────┴──────────────────────┴─────────────────────┴──────────────────────────╯
''';

const String missingJsonExport = r'''
╭────────────────────────────────────────────────╮
│          ╔═╗   ╔══╗  ╔═╗   ╔══╗  ╦             │
│          ╠═╩╗  ╠══╣  ╠═╩╗  ║═╣   ║             │
│          ╚══╝  ╩  ╩  ╚══╝  ╚══╝  ╩══╝          │
│    Translations management for Flutter apps    │
╰────────────────────────────────────────────────╯

> Report: Missing Translations
> Display mode: JSON
> Generated on:

┌────────────────────────┐
│  Missing Translations  │
└────────────────────────┘
{
  "btnCancel": {
    "el": "Cancel",
    "en": "(missing translation)"
  },
  "thisIsAnExampleApp": {
    "el": "(missing translation)",
    "en": "This is an example app"
  }
}
''';

const String missingTreeExport = r'''
╭────────────────────────────────────────────────╮
│          ╔═╗   ╔══╗  ╔═╗   ╔══╗  ╦             │
│          ╠═╩╗  ╠══╣  ╠═╩╗  ║═╣   ║             │
│          ╚══╝  ╩  ╩  ╚══╝  ╚══╝  ╩══╝          │
│    Translations management for Flutter apps    │
╰────────────────────────────────────────────────╯

> Report: Missing Translations
> Display mode: Tree View
> Generated on:

┌────────────────────────┐
│  Missing Translations  │
└────────────┬───────────┘
             │
             ├──── btnCancel
             │     │
             │     ├──── el: Cancel
             │     │
             │     └──── en: (missing translation)
             │
             └──── thisIsAnExampleApp
                   │
                   ├──── el: (missing translation)
                   │
                   └──── en: This is an example app

''';

const String unusedGridExport = r'''
╭────────────────────────────────────────────────╮
│          ╔═╗   ╔══╗  ╔═╗   ╔══╗  ╦             │
│          ╠═╩╗  ╠══╣  ╠═╩╗  ║═╣   ║             │
│          ╚══╝  ╩  ╩  ╚══╝  ╚══╝  ╩══╝          │
│    Translations management for Flutter apps    │
╰────────────────────────────────────────────────╯

> Report: Unused Translations
> Display mode: Data Grid
> Generated on:

╭─────┬───────────────────┬──────────────────────────┬──────────────────────────╮
│     │                   │                          │                          │
│  #  │  Translation key  │            el            │            en            │
│     │                   │                          │                          │
├─────┼───────────────────┼──────────────────────────┼──────────────────────────┤
│  1  │     btnCancel     │          Cancel          │  (missing translation)   │
├─────┼───────────────────┼──────────────────────────┼──────────────────────────┤
│  2  │    demoMessage    │  This is a demo message  │  This is a demo message  │
├─────┼───────────────────┼──────────────────────────┼──────────────────────────┤
│  3  │      btnSave      │           Save           │           Save           │
╰─────┴───────────────────┴──────────────────────────┴──────────────────────────╯
''';

const String unusedTreeExport = r'''
╭────────────────────────────────────────────────╮
│          ╔═╗   ╔══╗  ╔═╗   ╔══╗  ╦             │
│          ╠═╩╗  ╠══╣  ╠═╩╗  ║═╣   ║             │
│          ╚══╝  ╩  ╩  ╚══╝  ╚══╝  ╩══╝          │
│    Translations management for Flutter apps    │
╰────────────────────────────────────────────────╯

> Report: Unused Translations
> Display mode: Tree View
> Generated on:

┌───────────────────────┐
│  Unused Translations  │
└──────────┬────────────┘
           │
           ├──── btnCancel
           │     │
           │     ├──── el: Cancel
           │     │
           │     └──── en: (missing translation)
           │
           ├──── demoMessage
           │     │
           │     ├──── el: This is a demo message
           │     │
           │     └──── en: This is a demo message
           │
           └──── btnSave
                 │
                 ├──── el: Save
                 │
                 └──── en: Save

''';

const String unusedJsonExport = r'''
╭────────────────────────────────────────────────╮
│          ╔═╗   ╔══╗  ╔═╗   ╔══╗  ╦             │
│          ╠═╩╗  ╠══╣  ╠═╩╗  ║═╣   ║             │
│          ╚══╝  ╩  ╩  ╚══╝  ╚══╝  ╩══╝          │
│    Translations management for Flutter apps    │
╰────────────────────────────────────────────────╯

> Report: Unused Translations
> Display mode: JSON
> Generated on:

┌───────────────────────┐
│  Unused Translations  │
└───────────────────────┘
{
  "btnCancel": {
    "el": "Cancel",
    "en": "(missing translation)"
  },
  "demoMessage": {
    "el": "This is a demo message",
    "en": "This is a demo message"
  },
  "btnSave": {
    "el": "Save",
    "en": "Save"
  }
}
''';
