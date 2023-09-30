import 'package:babel/cli/commands/commands.dart';
import 'package:babel/cli/commands/list/mixin.dart';
import 'package:dart_cmder/dart_cmder.dart';
import 'package:test/test.dart';

void main() {
  group('ListCommandMixin', () {
    for (final BaseCommand command in <BaseCommand>[
      ListAllCommand(),
      ListMissingCommand(),
      ListUnusedCommand(),
    ]) {
      test(command.runtimeType.toString(), () {
        expect(command.arguments.contains(ListCommandMixin.reportDisplayModeArg), true);
        expect(command.arguments.contains(ListCommandMixin.exportDirectoryArg), true);
      });
    }
  });
}
