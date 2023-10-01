import 'dart:io';

import 'package:babel/src/utils/converters.dart';
import 'package:path/path.dart';
import 'package:test/test.dart';

void main() {
  final String path = Directory.current.path;
  final String filepath = normalize(join(path, 'file.txt'));
  final File file = File(filepath);

  group('converters', () {
    group('DirectoryJsonConverter', () {
      test('fromJson', () {
        expect(
          const DirectoryJsonConverter()
              .fromJson(path, <String, dynamic>{'directory': path}, 'directory')
              .path,
          path,
        );
      });

      test('toJson', () {
        expect(
          const DirectoryJsonConverter().toJson(Directory.current),
          path,
        );
      });
    });

    group('FileJsonConverter', () {
      test('fromJson', () {
        expect(
          const FileJsonConverter()
              .fromJson(filepath, <String, dynamic>{'file': filepath}, 'file')
              .path,
          file.path,
        );
      });

      test('toJson', () {
        expect(
          const FileJsonConverter().toJson(file),
          filepath,
        );
      });
    });
  });
}
