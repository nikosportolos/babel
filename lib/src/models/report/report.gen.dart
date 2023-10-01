// AUTO GENERATED - DO NOT MODIFY
// ignore_for_file: type=lint
// coverage:ignore-file

part of 'report.dart';

class _$ReportImpl extends Report {
  const _$ReportImpl({
    required this.records,
  }) : super.ctor();

  @override
  final List<Record> records;

  factory _$ReportImpl.fromJson(Map<dynamic, dynamic> json) {
    return _$ReportImpl(
      records: <Record>[
        for (final dynamic i0 in (json['records'] as List<dynamic>))
          jsonConverterRegistrant.find(Record).fromJson(i0, json, 'records')
              as Record,
      ],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'records': <dynamic>[
        for (final Record i0 in records)
          jsonConverterRegistrant.find(Record).toJson(i0),
      ],
    };
  }

  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is Report &&
            runtimeType == other.runtimeType &&
            deepEquality(records, other.records);
  }

  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      records,
    ]);
  }

  @override
  String toString() {
    String toStringOutput = 'Report{<optimized out>}';
    assert(() {
      toStringOutput = 'Report@<$hexIdentity>{records: $records}';
      return true;
    }());
    return toStringOutput;
  }

  @override
  Type get runtimeType => Report;
}

abstract interface class _ReportCopyWithProxy {
  Report records(List<Record> newValue);

  Report call({
    final List<Record>? records,
  });
}

class _ReportCopyWithProxyImpl implements _ReportCopyWithProxy {
  _ReportCopyWithProxyImpl(this._value);

  final Report _value;

  @pragma('vm:prefer-inline')
  @override
  Report records(List<Record> newValue) => this(records: newValue);

  @pragma('vm:prefer-inline')
  @override
  Report call({
    final List<Record>? records,
  }) {
    return _$ReportImpl(
      records: records ?? _value.records,
    );
  }
}

sealed class $ReportCopyWithProxyChain<$Result> {
  factory $ReportCopyWithProxyChain(
          final Report value, final $Result Function(Report update) chain) =
      _ReportCopyWithProxyChainImpl<$Result>;

  $Result records(List<Record> newValue);

  $Result call({
    final List<Record>? records,
  });
}

class _ReportCopyWithProxyChainImpl<$Result>
    implements $ReportCopyWithProxyChain<$Result> {
  _ReportCopyWithProxyChainImpl(this._value, this._chain);

  final Report _value;
  final $Result Function(Report update) _chain;

  @pragma('vm:prefer-inline')
  @override
  $Result records(List<Record> newValue) => this(records: newValue);

  @pragma('vm:prefer-inline')
  @override
  $Result call({
    final List<Record>? records,
  }) {
    return _chain(_$ReportImpl(
      records: records ?? _value.records,
    ));
  }
}

extension $ReportExtension on Report {
  _ReportCopyWithProxy get copyWith => _ReportCopyWithProxyImpl(this);
}
