import 'dart:convert';
import 'dart:io';

import 'package:babel/src/exceptions/exceptions.dart';
import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:yaml/yaml.dart';

part 'options.gen.dart';

/// Typed configuration from the localizations config file.
///
/// https://docs.flutter.dev/ui/accessibility-and-localization/internationalization#configuring-the-l10nyaml-file
///
/// https://github.com/flutter/flutter/blob/2c477b181297a9089f73d508acb7d07bd4784f89/packages/flutter_tools/lib/src/localizations/localizations_utils.dart#L336-L470
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

  /// The `--arb-dir` argument.
  ///
  /// The directory where all input localization files should reside.
  String? get arbDir;

  /// The `--output-dir` argument.
  ///
  /// The directory where all output localization files should be generated.
  String? get outputDir;

  /// The `--template-arb-file` argument.
  ///
  /// This path is relative to [arbDirectory].
  String? get templateArbFile;

  /// The `--output-localization-file` argument.
  ///
  /// This path is relative to [arbDir].
  String? get outputLocalizationFile;

  /// The `--untranslated-messages-file` argument.
  ///
  /// This path is relative to [arbDir].
  String? get untranslatedMessagesFile;

  /// The `--output-class` argument.
  String? get outputClass;

  /// The `--preferred-supported-locales` argument.
  List<String>? get preferredSupportedLocales;

  /// The `--header` argument.
  ///
  /// The header to prepend to the generated Dart localizations.
  String? get header;

  /// The `--header-file` argument.
  ///
  /// A file containing the header to prepend to the generated
  /// Dart localizations.
  String? get headerFile;

  /// The `--use-deferred-loading` argument.
  ///
  /// Whether to generate the Dart localization file with locales imported
  /// as deferred.
  bool? get useDeferredLoading;

  /// The `--gen-inputs-and-outputs-list` argument.
  ///
  /// This path is relative to [arbDir].
  String? get genInputsAndOutputsList;

  /// The `--synthetic-package` argument.
  ///
  /// Whether to generate the Dart localization files in a synthetic package
  /// or in a custom directory.
  bool? get syntheticPackage;

  /// The `--project-dir` argument.
  ///
  /// This path is relative to [arbDir].
  String? get projectDir;

  /// The `required-resource-attributes` argument.
  ///
  /// Whether to require all resource ids to contain a corresponding
  /// resource attribute.
  bool? get requiredResourceAttributes;

  /// The `nullable-getter` argument.
  ///
  /// Whether or not the localizations class getter is nullable.
  bool? get nullableGetter;

  /// The `format` argument.
  ///
  /// Whether or not to format the generated files.
  bool? get format;

  /// The `use-escaping` argument.
  ///
  /// Whether or not the ICU escaping syntax is used.
  bool? get useEscaping;

  /// The `suppress-warnings` argument.
  ///
  /// Whether or not to suppress warnings.
  bool? get suppressWarnings;

  /// The `relax-syntax` argument.
  ///
  /// Whether or not to relax the syntax. When specified, the syntax will be
  /// relaxed so that the special character "{" is treated as a string if it is
  /// not followed by a valid placeholder and "}" is treated as a string if it
  /// does not close any previous "{" that is treated as a special character.
  /// This was added in for backward compatibility and is not recommended
  /// as it may mask errors.
  bool? get relaxSyntax;

  /// Creates an instance of [LocalizationOptions] from [file]
  factory LocalizationOptions.fromFile(final File file) {
    final String content = file.readAsStringSync();
    final dynamic json = jsonEncode(loadYaml(content));
    return LocalizationOptions.fromJson(jsonDecode(json));
  }

  /// Creates an instance of [LocalizationOptions] from [filepath]
  factory LocalizationOptions.fromFilePath(final String filepath) {
    final File file = File(filepath);
    if (!file.existsSync()) {
      throw LocalizationOptionsNotFound(filepath);
    }

    return LocalizationOptions.fromFile(file);
  }

  /// Creates an instance of [LocalizationOptions] from [json]
  factory LocalizationOptions.fromJson(Map<dynamic, dynamic> json) = _$LocalizationOptionsImpl.fromJson;

  /// Converts [LocalizationOptions] to a [Map] json
  Map<String, dynamic> toJson();
}
