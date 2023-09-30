import 'package:data_class_plugin/data_class_plugin.dart';

part 'attributes.gen.dart';

@DataClass()
abstract class TranslationKeyAttributes {
  const TranslationKeyAttributes.ctor();

  /// Default constructor
  const factory TranslationKeyAttributes({
    String? description,
    Map<String, String> placeholders,
  }) = _$TranslationKeyAttributesImpl;

  String? get description;

  @DefaultValue(<String, String>{})
  Map<String, String> get placeholders;

  static const TranslationKeyAttributes empty = TranslationKeyAttributes();

  /// Creates an instance of [TranslationKeyAttributes] from [json]
  factory TranslationKeyAttributes.fromJson(Map<dynamic, dynamic> json) = _$TranslationKeyAttributesImpl.fromJson;

  /// Converts [TranslationKeyAttributes] to a [Map] json
  Map<String, dynamic> toJson();
}
