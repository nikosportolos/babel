import 'dart:convert';
import 'dart:io';

import 'package:ansix/ansix.dart';
import 'package:babel/src/exceptions/exceptions.dart';
import 'package:babel/src/models/models.dart';
import 'package:dart_cmder/dart_cmder.dart';
import 'package:path/path.dart';

class Loader {
  static const String localeTag = '@@locale';
  static const String attributeTag = '@';

  static Project loadProjectFromPath(final String? path) {
    final Directory root = Finder.findDirectoryFromPath(path);
    final LocalizationOptions options = loadLocalizationOptions(root.path);

    final String arbDirPath = normalize(join(root.path, options.arbDir!));
    if (!Directory(arbDirPath).existsSync()) {
      throw InvalidArbDir(options.arbDir!);
    }

    return Project(
      root: root,
      options: options,
      translations: loadTranslationsFromPath(arbDirPath),
    );
  }

  static LocalizationOptions loadLocalizationOptions(final String projectPath) {
    final String yamlPath = join(projectPath, Finder.l10nYaml);

    final LocalizationOptions options =
        LocalizationOptions.fromFilePath(yamlPath);
    if (options.arbDir.isNullOrEmpty) {
      throw ArbDirNotFound(yamlPath);
    }

    return options;
  }

  static List<TranslationFile> loadTranslationsFromPath(
    final String path,
  ) {
    final List<FileSystemEntity> arbFiles = Finder.findArbFiles(
      path: path,
      recursive: false,
    )..sort((FileSystemEntity a, FileSystemEntity b) =>
        basename(a.path).compareTo(basename(b.path)));

    return <TranslationFile>[
      for (final FileSystemEntity file in arbFiles) //
        _parseTranslationFile(file)
    ];
  }

  static TranslationFile _parseTranslationFile(final FileSystemEntity file) {
    final String content = File(file.path).readAsStringSync();
    final Map<String, dynamic> json = jsonDecode(content);
    final String? locale = json[localeTag];

    final Map<String, TranslationKey> keys = <String, TranslationKey>{};

    for (final MapEntry<String, dynamic> entry in json.entries) {
      String key = entry.key;
      if (key == localeTag) {
        continue;
      }

      if (key.startsWith(attributeTag)) {
        final TranslationKeyAttributes attributes =
            TranslationKeyAttributes.fromJson(entry.value);
        key = key.substring(1);

        if (keys[key] == null) {
          keys[key] = TranslationKey(
            key: key,
            value: '',
            attributes: attributes,
          );
          continue;
        }

        keys[key] = keys[key]!.copyWith(attributes: attributes);
        continue;
      }

      if (keys[key] == null) {
        keys[key] = TranslationKey(
          key: key,
          value: entry.value,
          attributes: const TranslationKeyAttributes(),
        );
        continue;
      }

      keys[key] = keys[key]!.copyWith(
        key: key,
        value: entry.value,
      );
    }

    return TranslationFile(
      path: file.path,
      locale: locale ?? '',
      keys: Set<TranslationKey>.from(
        keys.values.toList(growable: false)
          ..sort(
            (TranslationKey a, TranslationKey b) {
              return a.key.compareTo(b.key);
            },
          ),
      ),
    );
  }
}
