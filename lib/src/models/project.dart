import 'dart:io';

import 'package:babel/src/models/models.dart';
import 'package:babel/src/utils/converters.dart';
import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:path/path.dart';

part 'project.gen.dart';

@DataClass()
abstract class Project {
  const Project.ctor();

  /// Default constructor
  const factory Project({
    required Directory root,
    required LocalizationOptions options,
    List<TranslationFile> translations,
  }) = _$ProjectImpl;

  @DirectoryJsonConverter()
  Directory get root;

  LocalizationOptions get options;

  @DefaultValue(<TranslationFile>[])
  List<TranslationFile> get translations;

  Directory get lib => Directory(join(root.path, 'lib'));

  List<String> get locales =>
      translations.map((TranslationFile f) => f.locale).toList(growable: false);

  List<String> get distinctKeys => translations
      .expand((TranslationFile f) => f.keys)
      .toList(growable: false)
      .map((TranslationKey k) => k.key)
      .toSet()
      .toList(growable: false);

  /// Creates an instance of [Project] from [json]
  factory Project.fromJson(Map<dynamic, dynamic> json) = _$ProjectImpl.fromJson;

  /// Converts [Project] to a [Map] json
  Map<String, dynamic> toJson();
}
