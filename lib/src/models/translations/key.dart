import 'package:babel/src/models/translations/attributes.dart';
import 'package:data_class_plugin/data_class_plugin.dart';

part 'key.gen.dart';

@DataClass()
abstract class TranslationKey {
  const TranslationKey.ctor();

  /// Default constructor
  const factory TranslationKey({
    required String key,
    required String value,
    required TranslationKeyAttributes attributes,
  }) = _$TranslationKeyImpl;

  String get key;

  String get value;

  TranslationKeyAttributes get attributes;

  bool get hasAttributes => attributes.description != null || attributes.placeholders.isNotEmpty;

  /// Creates an instance of [TranslationKey] from [json]
  factory TranslationKey.fromJson(Map<dynamic, dynamic> json) = _$TranslationKeyImpl.fromJson;

  /// Converts [TranslationKey] to a [Map] json
  Map<String, dynamic> toJson();
}
