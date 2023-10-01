// AUTO GENERATED - DO NOT MODIFY
// ignore_for_file: type=lint
// coverage:ignore-file

part of 'project.dart';

class _$ProjectImpl extends Project {
  const _$ProjectImpl({
    required this.root,
    required this.options,
    this.translations = const <TranslationFile>[],
  }) : super.ctor();

  @override
  final Directory root;

  @override
  final LocalizationOptions options;

  @override
  final List<TranslationFile> translations;

  factory _$ProjectImpl.fromJson(Map<dynamic, dynamic> json) {
    return _$ProjectImpl(
      root: const DirectoryJsonConverter().fromJson(json['root'], json, 'root'),
      options: LocalizationOptions.fromJson(json['options']),
      translations: json['translations'] == null
          ? const <TranslationFile>[]
          : <TranslationFile>[
              for (final dynamic i0 in (json['translations'] as List<dynamic>))
                TranslationFile.fromJson(i0),
            ],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'root': const DirectoryJsonConverter().toJson(root),
      'options': options.toJson(),
      'translations': <dynamic>[
        for (final TranslationFile i0 in translations) i0.toJson(),
      ],
    };
  }

  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is Project &&
            runtimeType == other.runtimeType &&
            root == other.root &&
            options == other.options &&
            deepEquality(translations, other.translations);
  }

  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      root,
      options,
      translations,
    ]);
  }

  @override
  String toString() {
    String toStringOutput = 'Project{<optimized out>}';
    assert(() {
      toStringOutput =
          'Project@<$hexIdentity>{root: $root, options: $options, translations: $translations}';
      return true;
    }());
    return toStringOutput;
  }

  @override
  Type get runtimeType => Project;
}

abstract interface class _ProjectCopyWithProxy {
  Project root(Directory newValue);

  $LocalizationOptionsCopyWithProxyChain<Project> get options;

  Project translations(List<TranslationFile> newValue);

  Project call({
    final Directory? root,
    final LocalizationOptions? options,
    final List<TranslationFile>? translations,
  });
}

class _ProjectCopyWithProxyImpl implements _ProjectCopyWithProxy {
  _ProjectCopyWithProxyImpl(this._value);

  final Project _value;

  @pragma('vm:prefer-inline')
  @override
  Project root(Directory newValue) => this(root: newValue);

  @pragma('vm:prefer-inline')
  @override
  $LocalizationOptionsCopyWithProxyChain<Project> get options =>
      $LocalizationOptionsCopyWithProxyChain<Project>(_value.options,
          (LocalizationOptions update) => this(options: update));

  @pragma('vm:prefer-inline')
  @override
  Project translations(List<TranslationFile> newValue) =>
      this(translations: newValue);

  @pragma('vm:prefer-inline')
  @override
  Project call({
    final Directory? root,
    final LocalizationOptions? options,
    final List<TranslationFile>? translations,
  }) {
    return _$ProjectImpl(
      root: root ?? _value.root,
      options: options ?? _value.options,
      translations: translations ?? _value.translations,
    );
  }
}

sealed class $ProjectCopyWithProxyChain<$Result> {
  factory $ProjectCopyWithProxyChain(
          final Project value, final $Result Function(Project update) chain) =
      _ProjectCopyWithProxyChainImpl<$Result>;

  $Result root(Directory newValue);

  $Result options(LocalizationOptions newValue);

  $Result translations(List<TranslationFile> newValue);

  $Result call({
    final Directory? root,
    final LocalizationOptions? options,
    final List<TranslationFile>? translations,
  });
}

class _ProjectCopyWithProxyChainImpl<$Result>
    implements $ProjectCopyWithProxyChain<$Result> {
  _ProjectCopyWithProxyChainImpl(this._value, this._chain);

  final Project _value;
  final $Result Function(Project update) _chain;

  @pragma('vm:prefer-inline')
  @override
  $Result root(Directory newValue) => this(root: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result options(LocalizationOptions newValue) => this(options: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result translations(List<TranslationFile> newValue) =>
      this(translations: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result call({
    final Directory? root,
    final LocalizationOptions? options,
    final List<TranslationFile>? translations,
  }) {
    return _chain(_$ProjectImpl(
      root: root ?? _value.root,
      options: options ?? _value.options,
      translations: translations ?? _value.translations,
    ));
  }
}

extension $ProjectExtension on Project {
  _ProjectCopyWithProxy get copyWith => _ProjectCopyWithProxyImpl(this);
}
