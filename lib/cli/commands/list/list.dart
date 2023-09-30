// coverage:ignore-file

import 'package:babel/cli/commands/list/all.dart';
import 'package:babel/cli/commands/list/missing.dart';
import 'package:babel/cli/commands/list/unused.dart';
import 'package:dart_cmder/dart_cmder.dart';

export 'all.dart';
export 'missing.dart';
export 'unused.dart';

class ListCommand extends BaseCommand {
  @override
  final String name = 'list';

  @override
  final String description = 'List project translations';

  ListCommand()
      : super(
          subCommands: <BaseCommand>[
            ListAllCommand(),
            ListMissingCommand(),
            ListUnusedCommand(),
          ],
        );

  @override
  Future<void> execute() async {}
}
