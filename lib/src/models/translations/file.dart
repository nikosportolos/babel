import 'package:babel/src/models/translations/key.dart';
import 'package:data_class_plugin/data_class_plugin.dart';

part 'file.gen.dart';

@DataClass()
abstract class TranslationFile {
  const TranslationFile.ctor();

  /// Default constructor
  const factory TranslationFile({
    required String path,
    required String locale,
    required Set<TranslationKey> keys,
  }) = _$TranslationFileImpl;

  String get path;

  String get locale;

  Set<TranslationKey> get keys;

  /// Creates an instance of [TranslationFile] from [json]
  factory TranslationFile.fromJson(Map<dynamic, dynamic> json) = _$TranslationFileImpl.fromJson;

  /// Converts [TranslationFile] to a [Map] json
  Map<String, dynamic> toJson();
}
