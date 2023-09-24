import 'dart:convert';
import 'dart:io';

import 'package:ansix/ansix.dart';
import 'package:babel/src/exceptions/exceptions.dart';
import 'package:babel/src/models/models.dart';
import 'package:babel/src/utils/utils.dart';
import 'package:path/path.dart';
import 'package:trace/trace.dart';

class Babel {
  /// Shorthand constructor
  Babel({
    required this.project,
  });

  final Project project;

  /// Creates a new instance of [Project] from the given [path].
  factory Babel.fromPath(
    final String? path,
  ) {
    final Directory root = FileHelper.findDirectoryFromPath(path);
    final String yamlPath = join(root.path, FileHelper.l10nYaml);

    final File localizationOptionsFile = File(yamlPath);
    if (!localizationOptionsFile.existsSync()) {
      throw LocalizationOptionsNotFound(yamlPath);
    }

    final LocalizationOptions options = LocalizationOptions.fromFile(localizationOptionsFile);
    if (options.arbDir.isNullOrEmpty) {
      throw const ProjectParsingFailed("'arbDir' is not defined in ${FileHelper.l10nYaml}");
    }

    final String arbDirPath = normalize(join(root.path, options.arbDir!));
    final Directory arbDir = Directory(arbDirPath);
    if (!arbDir.existsSync()) {
      throw ProjectParsingFailed(
        "Invalid 'arbDir' directory set in ${FileHelper.l10nYaml}: [${options.arbDir!}]",
      );
    }

    final List<FileSystemEntity> arbFiles = FileHelper.findArbFiles(
      path: arbDir.path,
      recursive: false,
    );

    const String localeTag = '@@locale';
    final List<TranslationFile> translationFiles = <TranslationFile>[];
    for (final FileSystemEntity file in arbFiles) {
      final String content = File(file.path).readAsStringSync();
      final Map<String, dynamic> json = jsonDecode(content);
      final String? locale = json[localeTag];

      final Map<String, TranslationKey> keys = <String, TranslationKey>{};

      for (final MapEntry<String, dynamic> entry in json.entries) {
        String key = entry.key;
        if (key == localeTag) {
          continue;
        }

        if (key.startsWith('@')) {
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

      translationFiles.add(TranslationFile(
        path: file.path,
        locale: locale ?? '',
        keys: keys.values.toList(growable: false)
          ..sort((TranslationKey a, TranslationKey b) {
            return a.key.compareTo(b.key);
          }),
      ));
    }

    return Babel(
      project: Project(
        root: root,
        options: options,
        translations: translationFiles,
      ),
    );
  }

  void printInfo() {
    Trace.printListItem('Localization options file found in ${join(project.root.path, FileHelper.l10nYaml)}');
    Trace.printListItem(
        'Found ${project.translations.length.toString().bold()} arb files in ${project.options.arbDir!}:');
    for (final TranslationFile f in project.translations) {
      Trace.printListItem(basename(f.path), level: 1);
    }
  }

  List<String?> keysForLocale(final String locale, List<String> keys) {
    final TranslationFile? file = project.translations //
        .where((TranslationFile f) => f.locale == locale)
        .map((TranslationFile f) => f)
        .firstOrNull;

    if (file == null) {
      return <String>[];
    }

    return <String>[
      for (final String key in keys) //
        file.keys.where((TranslationKey tr) => tr.key == key).firstOrNull?.value ?? 'null'.red()
    ];
  }
}
