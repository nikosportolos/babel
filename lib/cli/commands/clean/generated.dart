import 'dart:io';

import 'package:babel/babel.dart';
import 'package:dart_cmder/dart_cmder.dart';
import 'package:path/path.dart';
import 'package:trace/trace.dart';

class CleanGeneratedFilesCommand extends BaseCommand {
  @override
  String get name => 'generated-files';

  @override
  String get description => 'Deletes all generated localization files.';

  @override
  Future<void> execute() async {
    final Babel babel = Babel.fromPath(path);

    Trace.info('\nClearing generated localization files');

    final String flutterGenPath = join(babel.project.root.path, '.dart_tool', 'flutter_gen');
    final Directory flutterGenDirectory = Directory(flutterGenPath);
    if (flutterGenDirectory.existsSync()) {
      flutterGenDirectory.deleteSync(recursive: true);
      Trace.printListItem('Deleted $flutterGenPath', level: 1);
    }

    final String generatedPath = join(babel.project.root.path, 'lib', 'generated');
    final Directory generatedDirectory = Directory(generatedPath);
    if (generatedDirectory.existsSync()) {
      generatedDirectory.deleteSync(recursive: true);
      Trace.printListItem('Deleted $generatedPath', level: 1);
    }
  }
}
