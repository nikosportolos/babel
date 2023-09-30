import 'dart:async';

import 'package:babel/src/babel.dart';
import 'package:babel/src/exceptions/exceptions.dart';
import 'package:babel/src/reports/mode.dart';
import 'package:test/test.dart';
import 'package:trace/trace.dart';

import '../mocks/mocks.dart';

void main() {
  final StringBuffer buffer = StringBuffer();
  final StreamSubscription<LogEntry> subscription =
      Trace.stream.listen((LogEntry entry) => buffer.writeln(entry.message));

  tearDown(() => buffer.clear());

  tearDownAll(() async {
    await subscription.cancel();
    await Trace.dispose();
  });

  group('Babel', () {
    test('', () {
      expect(
        () => Babel.fromPath('.'),
        throwsA(isA<LocalizationOptionsNotFound>()),
      );
    });

    test('', () async {
      final Babel babel = Babel.fromPath(exampleProjectPath);
      await babel.printReport(
        displayMode: ReportDisplayMode.grid,
        reportMode: ReportMode.all,
      );

      await Future<void>.delayed(const Duration(seconds: 5));
      print(buffer.toString());
    });
  });
}
