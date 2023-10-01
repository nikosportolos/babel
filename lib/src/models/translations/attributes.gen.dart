// AUTO GENERATED - DO NOT MODIFY
// ignore_for_file: type=lint
// coverage:ignore-file

part of 'attributes.dart';

class _$TranslationKeyAttributesImpl extends TranslationKeyAttributes {
  const _$TranslationKeyAttributesImpl({
    this.description,
    this.placeholders = const <String, String>{},
  }) : super.ctor();

  @override
  final String? description;

  @override
  final Map<String, String> placeholders;

  factory _$TranslationKeyAttributesImpl.fromJson(Map<dynamic, dynamic> json) {
    return _$TranslationKeyAttributesImpl(
      description: json['description'] as String?,
      placeholders: json['placeholders'] == null
          ? const <String, String>{}
          : <String, String>{
              for (final MapEntry<dynamic, dynamic> e0
                  in (json['placeholders'] as Map<dynamic, dynamic>).entries)
                e0.key as String: e0.value as String,
            },
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'description': description,
      'placeholders': placeholders,
    };
  }

  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is TranslationKeyAttributes &&
            runtimeType == other.runtimeType &&
            description == other.description &&
            deepEquality(placeholders, other.placeholders);
  }

  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      description,
      placeholders,
    ]);
  }

  @override
  String toString() {
    String toStringOutput = 'TranslationKeyAttributes{<optimized out>}';
    assert(() {
      toStringOutput =
          'TranslationKeyAttributes@<$hexIdentity>{description: $description, placeholders: $placeholders}';
      return true;
    }());
    return toStringOutput;
  }

  @override
  Type get runtimeType => TranslationKeyAttributes;
}

abstract interface class _TranslationKeyAttributesCopyWithProxy {
  TranslationKeyAttributes description(String? newValue);

  TranslationKeyAttributes placeholders(Map<String, String> newValue);

  TranslationKeyAttributes call({
    final String? description,
    final Map<String, String>? placeholders,
  });
}

class _TranslationKeyAttributesCopyWithProxyImpl
    implements _TranslationKeyAttributesCopyWithProxy {
  _TranslationKeyAttributesCopyWithProxyImpl(this._value);

  final TranslationKeyAttributes _value;

  @pragma('vm:prefer-inline')
  @override
  TranslationKeyAttributes description(String? newValue) =>
      this(description: newValue);

  @pragma('vm:prefer-inline')
  @override
  TranslationKeyAttributes placeholders(Map<String, String> newValue) =>
      this(placeholders: newValue);

  @pragma('vm:prefer-inline')
  @override
  TranslationKeyAttributes call({
    final Object? description = const Object(),
    final Map<String, String>? placeholders,
  }) {
    return _$TranslationKeyAttributesImpl(
      description: identical(description, const Object())
          ? _value.description
          : (description as String?),
      placeholders: placeholders ?? _value.placeholders,
    );
  }
}

sealed class $TranslationKeyAttributesCopyWithProxyChain<$Result> {
  factory $TranslationKeyAttributesCopyWithProxyChain(
          final TranslationKeyAttributes value,
          final $Result Function(TranslationKeyAttributes update) chain) =
      _TranslationKeyAttributesCopyWithProxyChainImpl<$Result>;

  $Result description(String? newValue);

  $Result placeholders(Map<String, String> newValue);

  $Result call({
    final String? description,
    final Map<String, String>? placeholders,
  });
}

class _TranslationKeyAttributesCopyWithProxyChainImpl<$Result>
    implements $TranslationKeyAttributesCopyWithProxyChain<$Result> {
  _TranslationKeyAttributesCopyWithProxyChainImpl(this._value, this._chain);

  final TranslationKeyAttributes _value;
  final $Result Function(TranslationKeyAttributes update) _chain;

  @pragma('vm:prefer-inline')
  @override
  $Result description(String? newValue) => this(description: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result placeholders(Map<String, String> newValue) =>
      this(placeholders: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result call({
    final Object? description = const Object(),
    final Map<String, String>? placeholders,
  }) {
    return _chain(_$TranslationKeyAttributesImpl(
      description: identical(description, const Object())
          ? _value.description
          : (description as String?),
      placeholders: placeholders ?? _value.placeholders,
    ));
  }
}

extension $TranslationKeyAttributesExtension on TranslationKeyAttributes {
  _TranslationKeyAttributesCopyWithProxy get copyWith =>
      _TranslationKeyAttributesCopyWithProxyImpl(this);
}
