import 'package:data_class_plugin/data_class_plugin.dart';

part 'record.gen.dart';

@DataClass()
abstract class ReportRecord {
  const ReportRecord.ctor();

  /// Default constructor
  const factory ReportRecord({
    bool? isUsed,
    bool? isMissing,
    required String locale,
    required String key,
    String? value,
  }) = _$ReportRecordImpl;

  String get locale;

  String get key;

  String? get value;

  bool? get isUsed;

  bool? get isMissing;

  /// Creates an instance of [ReportRecord] from [json]
  factory ReportRecord.fromJson(Map<dynamic, dynamic> json) = _$ReportRecordImpl.fromJson;

  /// Converts [ReportRecord] to a [Map] json
  Map<String, dynamic> toJson();
}
