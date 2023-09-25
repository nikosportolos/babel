import 'package:data_class_plugin/data_class_plugin.dart';

part 'report.gen.dart';

@DataClass()
abstract class Report {
  const Report.ctor();

  List<Record> get records;

  /// Default constructor
  const factory Report({
    required List<Record> records,
  }) = _$ReportImpl;

  /// Creates an instance of [Report] from [json]
  factory Report.fromJson(Map<dynamic, dynamic> json) = _$ReportImpl.fromJson;

  /// Converts [Report] to a [Map] json
  Map<String, dynamic> toJson();
}
