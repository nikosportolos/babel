import 'dart:io';

import 'package:babel/src/models/project.dart';
import 'package:babel/src/utils/loader.dart';
import 'package:path/path.dart';

final Project exampleProject = Loader.loadProjectFromPath(exampleProjectPath);

final String exampleProjectPath = join(
  Directory.current.path,
  'test',
  'mocks',
  'example_project',
);

final String testPath = join(
  Directory.current.path,
  'test',
);

final String mocksPath = join(
  Directory.current.path,
  'test',
  'mocks',
);

final String localizationOptionsMocksPath = join(
  Directory.current.path,
  'test',
  'mocks',
  'localization_options',
);

final String exampleTranslationsPath = join(
  exampleProjectPath,
  'lib',
  'l10n',
);
