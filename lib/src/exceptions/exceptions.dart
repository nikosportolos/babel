class BabelException implements Exception {}

class ProjectParsingFailed implements BabelException {
  const ProjectParsingFailed(this.message);

  final String message;

  @override
  String toString() => message;
}

class LocalizationOptionsNotFound implements BabelException {
  const LocalizationOptionsNotFound(this.path);

  final String path;

  @override
  String toString() => 'Localization options file not found in $path';
}
