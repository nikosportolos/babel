import 'package:ansix/ansix.dart';
import 'package:babel/src/models/models.dart';
import 'package:babel/src/utils/utils.dart';
import 'package:dart_cmder/dart_cmder.dart';
import 'package:path/path.dart';
import 'package:trace/trace.dart';

class Babel {
  Babel._({required this.project});

  final Project project;

  /// Creates a new instance of [Project] from the given [path].
  factory Babel.fromPath(
    final String? path,
  ) {
    return Babel._(
      project: Loader.loadProjectFromPath(path),
    );
  }

  void printInfo() {
    Trace.printListItem('Localization options file found in ${join(project.root.path, Finder.l10nYaml)}');
    Trace.printListItem(
        'Found ${project.translations.length.toString().bold()} arb files in ${project.options.arbDir!}:');
    for (final TranslationFile f in project.translations) {
      Trace.printListItem(basename(f.path), level: 1);
    }
  }
}
