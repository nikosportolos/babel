// AUTO GENERATED - DO NOT MODIFY
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
// coverage:ignore-file

part of 'record.dart';

class _$ReportRecordImpl extends ReportRecord {
  const _$ReportRecordImpl({
    required this.locale,
    required this.key,
    this.value,
    this.isUsed,
    this.isMissing,
  }) : super.ctor();

  @override
  final String locale;

  @override
  final String key;

  @override
  final String? value;

  @override
  final bool? isUsed;

  @override
  final bool? isMissing;

  factory _$ReportRecordImpl.fromJson(Map<dynamic, dynamic> json) {
    return _$ReportRecordImpl(
      locale: json['locale'] as String,
      key: json['key'] as String,
      value: json['value'] as String?,
      isUsed: json['is-used'] as bool?,
      isMissing: json['is-missing'] as bool?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'locale': locale,
      'key': key,
      'value': value,
      'is-used': isUsed,
      'is-missing': isMissing,
    };
  }

  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is ReportRecord &&
            runtimeType == other.runtimeType &&
            locale == other.locale &&
            key == other.key &&
            value == other.value &&
            isUsed == other.isUsed &&
            isMissing == other.isMissing;
  }

  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      locale,
      key,
      value,
      isUsed,
      isMissing,
    ]);
  }

  @override
  String toString() {
    String toStringOutput = 'ReportRecord{<optimized out>}';
    assert(() {
      toStringOutput =
          'ReportRecord@<$hexIdentity>{locale: $locale, key: $key, value: $value, isUsed: $isUsed, isMissing: $isMissing}';
      return true;
    }());
    return toStringOutput;
  }

  @override
  Type get runtimeType => ReportRecord;
}

abstract interface class _ReportRecordCopyWithProxy {
  ReportRecord locale(String newValue);

  ReportRecord key(String newValue);

  ReportRecord value(String? newValue);

  ReportRecord isUsed(bool? newValue);

  ReportRecord isMissing(bool? newValue);

  ReportRecord call({
    final String? locale,
    final String? key,
    final String? value,
    final bool? isUsed,
    final bool? isMissing,
  });
}

class _ReportRecordCopyWithProxyImpl implements _ReportRecordCopyWithProxy {
  _ReportRecordCopyWithProxyImpl(this._value);

  final ReportRecord _value;

  @pragma('vm:prefer-inline')
  @override
  ReportRecord locale(String newValue) => this(locale: newValue);

  @pragma('vm:prefer-inline')
  @override
  ReportRecord key(String newValue) => this(key: newValue);

  @pragma('vm:prefer-inline')
  @override
  ReportRecord value(String? newValue) => this(value: newValue);

  @pragma('vm:prefer-inline')
  @override
  ReportRecord isUsed(bool? newValue) => this(isUsed: newValue);

  @pragma('vm:prefer-inline')
  @override
  ReportRecord isMissing(bool? newValue) => this(isMissing: newValue);

  @pragma('vm:prefer-inline')
  @override
  ReportRecord call({
    final String? locale,
    final String? key,
    final Object? value = const Object(),
    final Object? isUsed = const Object(),
    final Object? isMissing = const Object(),
  }) {
    return _$ReportRecordImpl(
      locale: locale ?? _value.locale,
      key: key ?? _value.key,
      value:
          identical(value, const Object()) ? _value.value : (value as String?),
      isUsed:
          identical(isUsed, const Object()) ? _value.isUsed : (isUsed as bool?),
      isMissing: identical(isMissing, const Object())
          ? _value.isMissing
          : (isMissing as bool?),
    );
  }
}

sealed class $ReportRecordCopyWithProxyChain<$Result> {
  factory $ReportRecordCopyWithProxyChain(final ReportRecord value,
          final $Result Function(ReportRecord update) chain) =
      _ReportRecordCopyWithProxyChainImpl<$Result>;

  $Result locale(String newValue);

  $Result key(String newValue);

  $Result value(String? newValue);

  $Result isUsed(bool? newValue);

  $Result isMissing(bool? newValue);

  $Result call({
    final String? locale,
    final String? key,
    final String? value,
    final bool? isUsed,
    final bool? isMissing,
  });
}

class _ReportRecordCopyWithProxyChainImpl<$Result>
    implements $ReportRecordCopyWithProxyChain<$Result> {
  _ReportRecordCopyWithProxyChainImpl(this._value, this._chain);

  final ReportRecord _value;
  final $Result Function(ReportRecord update) _chain;

  @pragma('vm:prefer-inline')
  @override
  $Result locale(String newValue) => this(locale: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result key(String newValue) => this(key: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result value(String? newValue) => this(value: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result isUsed(bool? newValue) => this(isUsed: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result isMissing(bool? newValue) => this(isMissing: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result call({
    final String? locale,
    final String? key,
    final Object? value = const Object(),
    final Object? isUsed = const Object(),
    final Object? isMissing = const Object(),
  }) {
    return _chain(_$ReportRecordImpl(
      locale: locale ?? _value.locale,
      key: key ?? _value.key,
      value:
          identical(value, const Object()) ? _value.value : (value as String?),
      isUsed:
          identical(isUsed, const Object()) ? _value.isUsed : (isUsed as bool?),
      isMissing: identical(isMissing, const Object())
          ? _value.isMissing
          : (isMissing as bool?),
    ));
  }
}

extension $ReportRecordExtension on ReportRecord {
  _ReportRecordCopyWithProxy get copyWith =>
      _ReportRecordCopyWithProxyImpl(this);
}
