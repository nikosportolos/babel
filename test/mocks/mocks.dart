import 'dart:io';

import 'package:babel/src/models/project.dart';
import 'package:babel/src/utils/loader.dart';
import 'package:path/path.dart';

final Project exampleProject = Loader.loadProjectFromPath(exampleProjectPath);

final String exampleProjectPath = join(Directory.current.path, 'example');
final String exampleTranslationsPath = join(exampleProjectPath, 'lib', 'l10n');

final String testPath = join(Directory.current.path, 'test');
final String mocksPath = join(testPath, 'mocks');
final String localizationOptionsMocksPath = join(mocksPath, 'localization_options');

final String exportPath = join(testPath, 'export');
final Directory exportDirectory = Directory(exportPath);
