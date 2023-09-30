part of 'exceptions.dart';

abstract class LocalizationOptionsException implements BabelException {
  const LocalizationOptionsException(this.message);

  final String message;

  @override
  String toString() => message;
}

class LocalizationOptionsNotFound extends LocalizationOptionsException {
  const LocalizationOptionsNotFound(this.path) //
      : super('Localization options file not found in $path');

  final String path;
}

class ArbDirNotFound extends LocalizationOptionsException {
  const ArbDirNotFound(this.path) //
      : super("'arbDir' is not defined in $path");

  final String path;
}

class InvalidArbDir extends LocalizationOptionsException {
  const InvalidArbDir(this.path) //
      : super("Invalid 'arbDir' directory set in ${Finder.l10nYaml}: [$path]");

  final String path;
}
