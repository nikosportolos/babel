import 'package:ansix/ansix.dart';
import 'package:dart_cmder/dart_cmder.dart';

part 'localization_options.dart';

class BabelException implements Exception {}

class UnusedTranslationsFound implements Exception {
  const UnusedTranslationsFound(this.count);

  final int count;

  @override
  String toString() {
    return 'Babel found ${count.toString().bold()} unused translations.';
  }
}
