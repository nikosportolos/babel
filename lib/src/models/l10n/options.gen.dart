// AUTO GENERATED - DO NOT MODIFY
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
// coverage:ignore-file

part of 'options.dart';

class _$LocalizationOptionsImpl extends LocalizationOptions {
  _$LocalizationOptionsImpl({
    this.arbDir,
    this.outputDir,
    this.templateArbFile,
    this.outputLocalizationFile,
    this.untranslatedMessagesFile,
    this.outputClass,
    this.preferredSupportedLocales,
    this.header,
    this.headerFile,
    this.useDeferredLoading,
    this.genInputsAndOutputsList,
    this.syntheticPackage,
    this.projectDir,
    this.requiredResourceAttributes,
    this.nullableGetter,
    this.format,
    this.useEscaping,
    this.suppressWarnings,
    this.relaxSyntax,
  }) : super.ctor();

  @override
  final String? arbDir;

  @override
  final String? outputDir;

  @override
  final String? templateArbFile;

  @override
  final String? outputLocalizationFile;

  @override
  final String? untranslatedMessagesFile;

  @override
  final String? outputClass;

  @override
  final List<String>? preferredSupportedLocales;

  @override
  final String? header;

  @override
  final String? headerFile;

  @override
  final bool? useDeferredLoading;

  @override
  final String? genInputsAndOutputsList;

  @override
  final bool? syntheticPackage;

  @override
  final String? projectDir;

  @override
  final bool? requiredResourceAttributes;

  @override
  final bool? nullableGetter;

  @override
  final bool? format;

  @override
  final bool? useEscaping;

  @override
  final bool? suppressWarnings;

  @override
  final bool? relaxSyntax;

  factory _$LocalizationOptionsImpl.fromJson(Map<dynamic, dynamic> json) {
    return _$LocalizationOptionsImpl(
      arbDir: json['arb-dir'] as String?,
      outputDir: json['output-dir'] as String?,
      templateArbFile: json['template-arb-file'] as String?,
      outputLocalizationFile: json['output-localization-file'] as String?,
      untranslatedMessagesFile: json['untranslated-messages-file'] as String?,
      outputClass: json['output-class'] as String?,
      preferredSupportedLocales: json['preferred-supported-locales'] == null
          ? null
          : <String>[
              for (final dynamic i0
                  in (json['preferred-supported-locales'] as List<dynamic>))
                i0 as String,
            ],
      header: json['header'] as String?,
      headerFile: json['header-file'] as String?,
      useDeferredLoading: json['use-deferred-loading'] as bool?,
      genInputsAndOutputsList: json['gen-inputs-and-outputs-list'] as String?,
      syntheticPackage: json['synthetic-package'] as bool?,
      projectDir: json['project-dir'] as String?,
      requiredResourceAttributes: json['required-resource-attributes'] as bool?,
      nullableGetter: json['nullable-getter'] as bool?,
      format: json['format'] as bool?,
      useEscaping: json['use-escaping'] as bool?,
      suppressWarnings: json['suppress-warnings'] as bool?,
      relaxSyntax: json['relax-syntax'] as bool?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'arb-dir': arbDir,
      'output-dir': outputDir,
      'template-arb-file': templateArbFile,
      'output-localization-file': outputLocalizationFile,
      'untranslated-messages-file': untranslatedMessagesFile,
      'output-class': outputClass,
      'preferred-supported-locales': preferredSupportedLocales,
      'header': header,
      'header-file': headerFile,
      'use-deferred-loading': useDeferredLoading,
      'gen-inputs-and-outputs-list': genInputsAndOutputsList,
      'synthetic-package': syntheticPackage,
      'project-dir': projectDir,
      'required-resource-attributes': requiredResourceAttributes,
      'nullable-getter': nullableGetter,
      'format': format,
      'use-escaping': useEscaping,
      'suppress-warnings': suppressWarnings,
      'relax-syntax': relaxSyntax,
    };
  }

  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is LocalizationOptions &&
            runtimeType == other.runtimeType &&
            arbDir == other.arbDir &&
            outputDir == other.outputDir &&
            templateArbFile == other.templateArbFile &&
            outputLocalizationFile == other.outputLocalizationFile &&
            untranslatedMessagesFile == other.untranslatedMessagesFile &&
            outputClass == other.outputClass &&
            deepEquality(
              preferredSupportedLocales,
              other.preferredSupportedLocales,
            ) &&
            header == other.header &&
            headerFile == other.headerFile &&
            useDeferredLoading == other.useDeferredLoading &&
            genInputsAndOutputsList == other.genInputsAndOutputsList &&
            syntheticPackage == other.syntheticPackage &&
            projectDir == other.projectDir &&
            requiredResourceAttributes == other.requiredResourceAttributes &&
            nullableGetter == other.nullableGetter &&
            format == other.format &&
            useEscaping == other.useEscaping &&
            suppressWarnings == other.suppressWarnings &&
            relaxSyntax == other.relaxSyntax;
  }

  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      arbDir,
      outputDir,
      templateArbFile,
      outputLocalizationFile,
      untranslatedMessagesFile,
      outputClass,
      preferredSupportedLocales,
      header,
      headerFile,
      useDeferredLoading,
      genInputsAndOutputsList,
      syntheticPackage,
      projectDir,
      requiredResourceAttributes,
      nullableGetter,
      format,
      useEscaping,
      suppressWarnings,
      relaxSyntax,
    ]);
  }

  @override
  String toString() {
    String toStringOutput = 'LocalizationOptions{<optimized out>}';
    assert(() {
      toStringOutput =
          'LocalizationOptions@<$hexIdentity>{arbDir: $arbDir, outputDir: $outputDir, templateArbFile: $templateArbFile, outputLocalizationFile: $outputLocalizationFile, untranslatedMessagesFile: $untranslatedMessagesFile, outputClass: $outputClass, preferredSupportedLocales: $preferredSupportedLocales, header: $header, headerFile: $headerFile, useDeferredLoading: $useDeferredLoading, genInputsAndOutputsList: $genInputsAndOutputsList, syntheticPackage: $syntheticPackage, projectDir: $projectDir, requiredResourceAttributes: $requiredResourceAttributes, nullableGetter: $nullableGetter, format: $format, useEscaping: $useEscaping, suppressWarnings: $suppressWarnings, relaxSyntax: $relaxSyntax}';
      return true;
    }());
    return toStringOutput;
  }

  @override
  Type get runtimeType => LocalizationOptions;
}

abstract interface class _LocalizationOptionsCopyWithProxy {
  LocalizationOptions arbDir(String? newValue);

  LocalizationOptions outputDir(String? newValue);

  LocalizationOptions templateArbFile(String? newValue);

  LocalizationOptions outputLocalizationFile(String? newValue);

  LocalizationOptions untranslatedMessagesFile(String? newValue);

  LocalizationOptions outputClass(String? newValue);

  LocalizationOptions preferredSupportedLocales(List<String>? newValue);

  LocalizationOptions header(String? newValue);

  LocalizationOptions headerFile(String? newValue);

  LocalizationOptions useDeferredLoading(bool? newValue);

  LocalizationOptions genInputsAndOutputsList(String? newValue);

  LocalizationOptions syntheticPackage(bool? newValue);

  LocalizationOptions projectDir(String? newValue);

  LocalizationOptions requiredResourceAttributes(bool? newValue);

  LocalizationOptions nullableGetter(bool? newValue);

  LocalizationOptions format(bool? newValue);

  LocalizationOptions useEscaping(bool? newValue);

  LocalizationOptions suppressWarnings(bool? newValue);

  LocalizationOptions relaxSyntax(bool? newValue);

  LocalizationOptions call({
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
  });
}

class _LocalizationOptionsCopyWithProxyImpl
    implements _LocalizationOptionsCopyWithProxy {
  _LocalizationOptionsCopyWithProxyImpl(this._value);

  final LocalizationOptions _value;

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions arbDir(String? newValue) => this(arbDir: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions outputDir(String? newValue) => this(outputDir: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions templateArbFile(String? newValue) =>
      this(templateArbFile: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions outputLocalizationFile(String? newValue) =>
      this(outputLocalizationFile: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions untranslatedMessagesFile(String? newValue) =>
      this(untranslatedMessagesFile: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions outputClass(String? newValue) =>
      this(outputClass: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions preferredSupportedLocales(List<String>? newValue) =>
      this(preferredSupportedLocales: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions header(String? newValue) => this(header: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions headerFile(String? newValue) =>
      this(headerFile: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions useDeferredLoading(bool? newValue) =>
      this(useDeferredLoading: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions genInputsAndOutputsList(String? newValue) =>
      this(genInputsAndOutputsList: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions syntheticPackage(bool? newValue) =>
      this(syntheticPackage: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions projectDir(String? newValue) =>
      this(projectDir: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions requiredResourceAttributes(bool? newValue) =>
      this(requiredResourceAttributes: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions nullableGetter(bool? newValue) =>
      this(nullableGetter: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions format(bool? newValue) => this(format: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions useEscaping(bool? newValue) =>
      this(useEscaping: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions suppressWarnings(bool? newValue) =>
      this(suppressWarnings: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions relaxSyntax(bool? newValue) =>
      this(relaxSyntax: newValue);

  @pragma('vm:prefer-inline')
  @override
  LocalizationOptions call({
    Object? arbDir = const Object(),
    Object? outputDir = const Object(),
    Object? templateArbFile = const Object(),
    Object? outputLocalizationFile = const Object(),
    Object? untranslatedMessagesFile = const Object(),
    Object? outputClass = const Object(),
    Object? preferredSupportedLocales = const Object(),
    Object? header = const Object(),
    Object? headerFile = const Object(),
    Object? useDeferredLoading = const Object(),
    Object? genInputsAndOutputsList = const Object(),
    Object? syntheticPackage = const Object(),
    Object? projectDir = const Object(),
    Object? requiredResourceAttributes = const Object(),
    Object? nullableGetter = const Object(),
    Object? format = const Object(),
    Object? useEscaping = const Object(),
    Object? suppressWarnings = const Object(),
    Object? relaxSyntax = const Object(),
  }) {
    return _$LocalizationOptionsImpl(
      arbDir: identical(arbDir, const Object())
          ? _value.arbDir
          : (arbDir as String?),
      outputDir: identical(outputDir, const Object())
          ? _value.outputDir
          : (outputDir as String?),
      templateArbFile: identical(templateArbFile, const Object())
          ? _value.templateArbFile
          : (templateArbFile as String?),
      outputLocalizationFile: identical(outputLocalizationFile, const Object())
          ? _value.outputLocalizationFile
          : (outputLocalizationFile as String?),
      untranslatedMessagesFile:
          identical(untranslatedMessagesFile, const Object())
          ? _value.untranslatedMessagesFile
          : (untranslatedMessagesFile as String?),
      outputClass: identical(outputClass, const Object())
          ? _value.outputClass
          : (outputClass as String?),
      preferredSupportedLocales:
          identical(preferredSupportedLocales, const Object())
          ? _value.preferredSupportedLocales
          : (preferredSupportedLocales as List<String>?),
      header: identical(header, const Object())
          ? _value.header
          : (header as String?),
      headerFile: identical(headerFile, const Object())
          ? _value.headerFile
          : (headerFile as String?),
      useDeferredLoading: identical(useDeferredLoading, const Object())
          ? _value.useDeferredLoading
          : (useDeferredLoading as bool?),
      genInputsAndOutputsList:
          identical(genInputsAndOutputsList, const Object())
          ? _value.genInputsAndOutputsList
          : (genInputsAndOutputsList as String?),
      syntheticPackage: identical(syntheticPackage, const Object())
          ? _value.syntheticPackage
          : (syntheticPackage as bool?),
      projectDir: identical(projectDir, const Object())
          ? _value.projectDir
          : (projectDir as String?),
      requiredResourceAttributes:
          identical(requiredResourceAttributes, const Object())
          ? _value.requiredResourceAttributes
          : (requiredResourceAttributes as bool?),
      nullableGetter: identical(nullableGetter, const Object())
          ? _value.nullableGetter
          : (nullableGetter as bool?),
      format: identical(format, const Object())
          ? _value.format
          : (format as bool?),
      useEscaping: identical(useEscaping, const Object())
          ? _value.useEscaping
          : (useEscaping as bool?),
      suppressWarnings: identical(suppressWarnings, const Object())
          ? _value.suppressWarnings
          : (suppressWarnings as bool?),
      relaxSyntax: identical(relaxSyntax, const Object())
          ? _value.relaxSyntax
          : (relaxSyntax as bool?),
    );
  }
}

sealed class $LocalizationOptionsCopyWithProxyChain<$Result> {
  factory $LocalizationOptionsCopyWithProxyChain(
    LocalizationOptions value,
    $Result Function(LocalizationOptions update) chain,
  ) = _LocalizationOptionsCopyWithProxyChainImpl<$Result>;

  $Result arbDir(String? newValue);

  $Result outputDir(String? newValue);

  $Result templateArbFile(String? newValue);

  $Result outputLocalizationFile(String? newValue);

  $Result untranslatedMessagesFile(String? newValue);

  $Result outputClass(String? newValue);

  $Result preferredSupportedLocales(List<String>? newValue);

  $Result header(String? newValue);

  $Result headerFile(String? newValue);

  $Result useDeferredLoading(bool? newValue);

  $Result genInputsAndOutputsList(String? newValue);

  $Result syntheticPackage(bool? newValue);

  $Result projectDir(String? newValue);

  $Result requiredResourceAttributes(bool? newValue);

  $Result nullableGetter(bool? newValue);

  $Result format(bool? newValue);

  $Result useEscaping(bool? newValue);

  $Result suppressWarnings(bool? newValue);

  $Result relaxSyntax(bool? newValue);

  $Result call({
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
  });
}

class _LocalizationOptionsCopyWithProxyChainImpl<$Result>
    implements $LocalizationOptionsCopyWithProxyChain<$Result> {
  _LocalizationOptionsCopyWithProxyChainImpl(this._value, this._chain);

  final LocalizationOptions _value;
  final $Result Function(LocalizationOptions update) _chain;

  @pragma('vm:prefer-inline')
  @override
  $Result arbDir(String? newValue) => this(arbDir: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result outputDir(String? newValue) => this(outputDir: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result templateArbFile(String? newValue) => this(templateArbFile: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result outputLocalizationFile(String? newValue) =>
      this(outputLocalizationFile: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result untranslatedMessagesFile(String? newValue) =>
      this(untranslatedMessagesFile: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result outputClass(String? newValue) => this(outputClass: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result preferredSupportedLocales(List<String>? newValue) =>
      this(preferredSupportedLocales: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result header(String? newValue) => this(header: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result headerFile(String? newValue) => this(headerFile: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result useDeferredLoading(bool? newValue) =>
      this(useDeferredLoading: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result genInputsAndOutputsList(String? newValue) =>
      this(genInputsAndOutputsList: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result syntheticPackage(bool? newValue) => this(syntheticPackage: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result projectDir(String? newValue) => this(projectDir: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result requiredResourceAttributes(bool? newValue) =>
      this(requiredResourceAttributes: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result nullableGetter(bool? newValue) => this(nullableGetter: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result format(bool? newValue) => this(format: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result useEscaping(bool? newValue) => this(useEscaping: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result suppressWarnings(bool? newValue) => this(suppressWarnings: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result relaxSyntax(bool? newValue) => this(relaxSyntax: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result call({
    Object? arbDir = const Object(),
    Object? outputDir = const Object(),
    Object? templateArbFile = const Object(),
    Object? outputLocalizationFile = const Object(),
    Object? untranslatedMessagesFile = const Object(),
    Object? outputClass = const Object(),
    Object? preferredSupportedLocales = const Object(),
    Object? header = const Object(),
    Object? headerFile = const Object(),
    Object? useDeferredLoading = const Object(),
    Object? genInputsAndOutputsList = const Object(),
    Object? syntheticPackage = const Object(),
    Object? projectDir = const Object(),
    Object? requiredResourceAttributes = const Object(),
    Object? nullableGetter = const Object(),
    Object? format = const Object(),
    Object? useEscaping = const Object(),
    Object? suppressWarnings = const Object(),
    Object? relaxSyntax = const Object(),
  }) {
    return _chain(
      _$LocalizationOptionsImpl(
        arbDir: identical(arbDir, const Object())
            ? _value.arbDir
            : (arbDir as String?),
        outputDir: identical(outputDir, const Object())
            ? _value.outputDir
            : (outputDir as String?),
        templateArbFile: identical(templateArbFile, const Object())
            ? _value.templateArbFile
            : (templateArbFile as String?),
        outputLocalizationFile:
            identical(outputLocalizationFile, const Object())
            ? _value.outputLocalizationFile
            : (outputLocalizationFile as String?),
        untranslatedMessagesFile:
            identical(untranslatedMessagesFile, const Object())
            ? _value.untranslatedMessagesFile
            : (untranslatedMessagesFile as String?),
        outputClass: identical(outputClass, const Object())
            ? _value.outputClass
            : (outputClass as String?),
        preferredSupportedLocales:
            identical(preferredSupportedLocales, const Object())
            ? _value.preferredSupportedLocales
            : (preferredSupportedLocales as List<String>?),
        header: identical(header, const Object())
            ? _value.header
            : (header as String?),
        headerFile: identical(headerFile, const Object())
            ? _value.headerFile
            : (headerFile as String?),
        useDeferredLoading: identical(useDeferredLoading, const Object())
            ? _value.useDeferredLoading
            : (useDeferredLoading as bool?),
        genInputsAndOutputsList:
            identical(genInputsAndOutputsList, const Object())
            ? _value.genInputsAndOutputsList
            : (genInputsAndOutputsList as String?),
        syntheticPackage: identical(syntheticPackage, const Object())
            ? _value.syntheticPackage
            : (syntheticPackage as bool?),
        projectDir: identical(projectDir, const Object())
            ? _value.projectDir
            : (projectDir as String?),
        requiredResourceAttributes:
            identical(requiredResourceAttributes, const Object())
            ? _value.requiredResourceAttributes
            : (requiredResourceAttributes as bool?),
        nullableGetter: identical(nullableGetter, const Object())
            ? _value.nullableGetter
            : (nullableGetter as bool?),
        format: identical(format, const Object())
            ? _value.format
            : (format as bool?),
        useEscaping: identical(useEscaping, const Object())
            ? _value.useEscaping
            : (useEscaping as bool?),
        suppressWarnings: identical(suppressWarnings, const Object())
            ? _value.suppressWarnings
            : (suppressWarnings as bool?),
        relaxSyntax: identical(relaxSyntax, const Object())
            ? _value.relaxSyntax
            : (relaxSyntax as bool?),
      ),
    );
  }
}

extension $LocalizationOptionsExtension on LocalizationOptions {
  _LocalizationOptionsCopyWithProxy get copyWith =>
      _LocalizationOptionsCopyWithProxyImpl(this);
}
