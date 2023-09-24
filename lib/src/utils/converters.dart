import 'dart:io';

import 'package:data_class_plugin/data_class_plugin.dart';

class DirectoryJsonConverter implements JsonConverter<Directory, String> {
  const DirectoryJsonConverter();

  @override
  Directory fromJson(String value, Map<dynamic, dynamic> json, String keyName) {
    return Directory(value);
  }

  @override
  String toJson(Directory value) {
    return value.path;
  }
}

class FileJsonConverter implements JsonConverter<File, String> {
  const FileJsonConverter();

  @override
  File fromJson(String value, Map<dynamic, dynamic> json, String keyName) {
    return File(value);
  }

  @override
  String toJson(File value) {
    return value.path;
  }
}
