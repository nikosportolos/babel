import 'dart:convert';
import 'dart:io';

import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:yaml/yaml.dart';

part 'options.gen.dart';

/// Typed configuration from the localizations config file.
///
/// https://github.com/flutter/flutter/blob/2c477b181297a9089f73d508acb7d07bd4784f89/packages/flutter_tools/lib/src/localizations/localizations_utils.dart
@DataClass()
abstract class LocalizationOptions {
  LocalizationOptions.ctor();

  /// Default constructor
  factory LocalizationOptions({
    String? arbDir,
    String? outputDir,
    String? templateArbFile,
    String? outputLocalizationFile,
    String? untranslatedMessagesFile,
    String? outputClass,
    List<String>? preferredSupportedLocales,
    String? header,
    String? headerFile,
    bool? useDeferredLoading,
    String? genInputsAndOutputsList,
    bool? syntheticPackage,
    String? projectDir,
    bool? requiredResourceAttributes,
    bool? nullableGetter,
    bool? format,
    bool? useEscaping,
    bool? suppressWarnings,
    bool? relaxSyntax,
  }) = _$LocalizationOptionsImpl;

  String? get arbDir;

  String? get outputDir;

  String? get templateArbFile;

  String? get outputLocalizationFile;

  String? get untranslatedMessagesFile;

  String? get outputClass;

  List<String>? get preferredSupportedLocales;

  String? get header;

  String? get headerFile;

  bool? get useDeferredLoading;

  String? get genInputsAndOutputsList;

  bool? get syntheticPackage;

  String? get projectDir;

  bool? get requiredResourceAttributes;

  bool? get nullableGetter;

  bool? get format;

  bool? get useEscaping;

  bool? get suppressWarnings;

  bool? get relaxSyntax;

  /// Creates an instance of [LocalizationOptions] from [file]
  static LocalizationOptions fromFile(final File file) {
    final String content = file.readAsStringSync();
    final dynamic json = jsonEncode(loadYaml(content));
    return LocalizationOptions.fromJson(jsonDecode(json));
  }

  /// Creates an instance of [LocalizationOptions] from [json]
  factory LocalizationOptions.fromJson(Map<dynamic, dynamic> json) = _$LocalizationOptionsImpl.fromJson;

  /// Converts [LocalizationOptions] to a [Map] json
  Map<String, dynamic> toJson();
}
