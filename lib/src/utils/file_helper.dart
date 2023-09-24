import 'dart:io';

import 'package:ansix/ansix.dart';
import 'package:path/path.dart';

class FileHelper {
  static final RegExp dartMatchingPattern = RegExp(r'^[a-zA-Z0-9_]+.dart$');
  static final RegExp arbMatchingPattern = RegExp(r'^[a-zA-Z0-9_]+.arb');

  static const String l10nYaml = 'l10n.yaml';

  static Directory findDirectoryFromPath(final String? path) {
    return path.isNullOrEmpty || path == '.' //
        ? Directory.current
        : path!.startsWith('./')
            ? Directory(join(Directory.current.path, normalize(path.substring(2))))
            : Directory(normalize(path));
  }

  static List<FileSystemEntity> findFiles({
    required final RegExp matchingPattern,
    required final String path,
    final bool? recursive,
  }) {
    return Directory(path)
        .listSync(recursive: recursive ?? true, followLinks: true)
        .whereType<File>()
        .where((File file) => matchingPattern.hasMatch(basename(file.path)))
        .toList(growable: false);
  }

  static List<FileSystemEntity> findArbFiles({
    required final String path,
    final bool? recursive,
  }) {
    return findFiles(
      matchingPattern: arbMatchingPattern,
      path: path,
      recursive: recursive,
    );
  }

  static List<FileSystemEntity> findDartFiles({
    required final String path,
    final bool? recursive,
  }) {
    return findFiles(
      matchingPattern: dartMatchingPattern,
      path: path,
      recursive: recursive,
    );
  }
}
