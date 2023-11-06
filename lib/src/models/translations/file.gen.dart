// AUTO GENERATED - DO NOT MODIFY
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
// coverage:ignore-file

part of 'file.dart';

class _$TranslationFileImpl extends TranslationFile {
  const _$TranslationFileImpl({
    required this.path,
    required this.locale,
    required this.keys,
  }) : super.ctor();

  @override
  final String path;

  @override
  final String locale;

  @override
  final Set<TranslationKey> keys;

  factory _$TranslationFileImpl.fromJson(Map<dynamic, dynamic> json) {
    return _$TranslationFileImpl(
      path: json['path'] as String,
      locale: json['locale'] as String,
      keys: jsonConverterRegistrant
          .find(Set<TranslationKey>)
          .fromJson(json['keys'], json, 'keys') as Set<TranslationKey>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'path': path,
      'locale': locale,
      'keys': jsonConverterRegistrant.find(Set).toJson(keys),
    };
  }

  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is TranslationFile &&
            runtimeType == other.runtimeType &&
            path == other.path &&
            locale == other.locale &&
            keys == other.keys;
  }

  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      path,
      locale,
      keys,
    ]);
  }

  @override
  String toString() {
    String toStringOutput = 'TranslationFile{<optimized out>}';
    assert(() {
      toStringOutput =
          'TranslationFile@<$hexIdentity>{path: $path, locale: $locale, keys: $keys}';
      return true;
    }());
    return toStringOutput;
  }

  @override
  Type get runtimeType => TranslationFile;
}

abstract interface class _TranslationFileCopyWithProxy {
  TranslationFile path(String newValue);

  TranslationFile locale(String newValue);

  TranslationFile keys(Set<TranslationKey> newValue);

  TranslationFile call({
    final String? path,
    final String? locale,
    final Set<TranslationKey>? keys,
  });
}

class _TranslationFileCopyWithProxyImpl
    implements _TranslationFileCopyWithProxy {
  _TranslationFileCopyWithProxyImpl(this._value);

  final TranslationFile _value;

  @pragma('vm:prefer-inline')
  @override
  TranslationFile path(String newValue) => this(path: newValue);

  @pragma('vm:prefer-inline')
  @override
  TranslationFile locale(String newValue) => this(locale: newValue);

  @pragma('vm:prefer-inline')
  @override
  TranslationFile keys(Set<TranslationKey> newValue) => this(keys: newValue);

  @pragma('vm:prefer-inline')
  @override
  TranslationFile call({
    final String? path,
    final String? locale,
    final Set<TranslationKey>? keys,
  }) {
    return _$TranslationFileImpl(
      path: path ?? _value.path,
      locale: locale ?? _value.locale,
      keys: keys ?? _value.keys,
    );
  }
}

sealed class $TranslationFileCopyWithProxyChain<$Result> {
  factory $TranslationFileCopyWithProxyChain(final TranslationFile value,
          final $Result Function(TranslationFile update) chain) =
      _TranslationFileCopyWithProxyChainImpl<$Result>;

  $Result path(String newValue);

  $Result locale(String newValue);

  $Result keys(Set<TranslationKey> newValue);

  $Result call({
    final String? path,
    final String? locale,
    final Set<TranslationKey>? keys,
  });
}

class _TranslationFileCopyWithProxyChainImpl<$Result>
    implements $TranslationFileCopyWithProxyChain<$Result> {
  _TranslationFileCopyWithProxyChainImpl(this._value, this._chain);

  final TranslationFile _value;
  final $Result Function(TranslationFile update) _chain;

  @pragma('vm:prefer-inline')
  @override
  $Result path(String newValue) => this(path: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result locale(String newValue) => this(locale: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result keys(Set<TranslationKey> newValue) => this(keys: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result call({
    final String? path,
    final String? locale,
    final Set<TranslationKey>? keys,
  }) {
    return _chain(_$TranslationFileImpl(
      path: path ?? _value.path,
      locale: locale ?? _value.locale,
      keys: keys ?? _value.keys,
    ));
  }
}

extension $TranslationFileExtension on TranslationFile {
  _TranslationFileCopyWithProxy get copyWith =>
      _TranslationFileCopyWithProxyImpl(this);
}
