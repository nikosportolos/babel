// AUTO GENERATED - DO NOT MODIFY
// ignore_for_file: type=lint
// coverage:ignore-file

part of 'key.dart';

class _$TranslationKeyImpl extends TranslationKey {
  const _$TranslationKeyImpl({
    required this.key,
    required this.value,
    required this.attributes,
  }) : super.ctor();

  @override
  final String key;

  @override
  final String value;

  @override
  final TranslationKeyAttributes attributes;

  factory _$TranslationKeyImpl.fromJson(Map<dynamic, dynamic> json) {
    return _$TranslationKeyImpl(
      key: json['key'] as String,
      value: json['value'] as String,
      attributes: TranslationKeyAttributes.fromJson(json['attributes']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'key': key,
      'value': value,
      'attributes': attributes.toJson(),
    };
  }

  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is TranslationKey &&
            runtimeType == other.runtimeType &&
            key == other.key &&
            value == other.value &&
            attributes == other.attributes;
  }

  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      key,
      value,
      attributes,
    ]);
  }

  @override
  String toString() {
    String toStringOutput = 'TranslationKey{<optimized out>}';
    assert(() {
      toStringOutput =
          'TranslationKey@<$hexIdentity>{key: $key, value: $value, attributes: $attributes}';
      return true;
    }());
    return toStringOutput;
  }

  @override
  Type get runtimeType => TranslationKey;
}

abstract interface class _TranslationKeyCopyWithProxy {
  TranslationKey key(String newValue);

  TranslationKey value(String newValue);

  $TranslationKeyAttributesCopyWithProxyChain<TranslationKey> get attributes;

  TranslationKey call({
    final String? key,
    final String? value,
    final TranslationKeyAttributes? attributes,
  });
}

class _TranslationKeyCopyWithProxyImpl implements _TranslationKeyCopyWithProxy {
  _TranslationKeyCopyWithProxyImpl(this._value);

  final TranslationKey _value;

  @pragma('vm:prefer-inline')
  @override
  TranslationKey key(String newValue) => this(key: newValue);

  @pragma('vm:prefer-inline')
  @override
  TranslationKey value(String newValue) => this(value: newValue);

  @pragma('vm:prefer-inline')
  @override
  $TranslationKeyAttributesCopyWithProxyChain<TranslationKey> get attributes =>
      $TranslationKeyAttributesCopyWithProxyChain<TranslationKey>(
          _value.attributes, (TranslationKeyAttributes update) => this(attributes: update));

  @pragma('vm:prefer-inline')
  @override
  TranslationKey call({
    final String? key,
    final String? value,
    final TranslationKeyAttributes? attributes,
  }) {
    return _$TranslationKeyImpl(
      key: key ?? _value.key,
      value: value ?? _value.value,
      attributes: attributes ?? _value.attributes,
    );
  }
}

sealed class $TranslationKeyCopyWithProxyChain<$Result> {
  factory $TranslationKeyCopyWithProxyChain(
          final TranslationKey value, final $Result Function(TranslationKey update) chain) =
      _TranslationKeyCopyWithProxyChainImpl<$Result>;

  $Result key(String newValue);

  $Result value(String newValue);

  $Result attributes(TranslationKeyAttributes newValue);

  $Result call({
    final String? key,
    final String? value,
    final TranslationKeyAttributes? attributes,
  });
}

class _TranslationKeyCopyWithProxyChainImpl<$Result>
    implements $TranslationKeyCopyWithProxyChain<$Result> {
  _TranslationKeyCopyWithProxyChainImpl(this._value, this._chain);

  final TranslationKey _value;
  final $Result Function(TranslationKey update) _chain;

  @pragma('vm:prefer-inline')
  @override
  $Result key(String newValue) => this(key: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result value(String newValue) => this(value: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result attributes(TranslationKeyAttributes newValue) => this(attributes: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result call({
    final String? key,
    final String? value,
    final TranslationKeyAttributes? attributes,
  }) {
    return _chain(_$TranslationKeyImpl(
      key: key ?? _value.key,
      value: value ?? _value.value,
      attributes: attributes ?? _value.attributes,
    ));
  }
}

extension $TranslationKeyExtension on TranslationKey {
  _TranslationKeyCopyWithProxy get copyWith => _TranslationKeyCopyWithProxyImpl(this);
}
