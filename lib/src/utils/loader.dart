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
    final String yamlPath = join(root.path, Finder.l10nYaml);

    final File localizationOptionsFile = File(yamlPath);
    if (!localizationOptionsFile.existsSync()) {
      throw LocalizationOptionsNotFound(yamlPath);
    }

    final LocalizationOptions options = LocalizationOptions.fromFile(localizationOptionsFile);
    if (options.arbDir.isNullOrEmpty) {
      throw const ProjectParsingFailed("'arbDir' is not defined in ${Finder.l10nYaml}");
    }

    final String arbDirPath = normalize(join(root.path, options.arbDir!));
    final Directory arbDir = Directory(arbDirPath);
    if (!arbDir.existsSync()) {
      throw ProjectParsingFailed(
        "Invalid 'arbDir' directory set in ${Finder.l10nYaml}: [${options.arbDir!}]",
      );
    }

    return Project(
      root: root,
      options: options,
      translations: loadTranslationsFromPath(arbDir.path),
    );
  }

  static List<TranslationFile> loadTranslationsFromPath(
    final String path,
  ) {
    final List<FileSystemEntity> arbFiles = Finder.findArbFiles(
      path: path,
      recursive: false,
    );

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
        final TranslationKeyAttributes attributes = TranslationKeyAttributes.fromJson(entry.value);
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
