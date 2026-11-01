part of 'exceptions.dart';

sealed class LocalizationOptionsException implements BabelException {
  const LocalizationOptionsException(this.message);

  final String message;

  @override
  String toString() => message;
}

final class LocalizationOptionsNotFound extends LocalizationOptionsException {
  const LocalizationOptionsNotFound(
    this.path,
  ) : super('Localization options file not found in $path');

  final String path;
}

final class ArbDirNotFound extends LocalizationOptionsException {
  const ArbDirNotFound(
    this.path,
  ) : super("'arbDir' is not defined in $path");

  final String path;
}

final class InvalidArbDir extends LocalizationOptionsException {
  const InvalidArbDir(
    this.path,
  ) : super("Invalid 'arbDir' directory set in ${Finder.l10nYaml}: [$path]");

  final String path;
}
