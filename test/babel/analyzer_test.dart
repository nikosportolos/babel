import 'package:babel/src/analyzer/analyzer.dart';
import 'package:path/path.dart';
import 'package:test/test.dart';

import '../mocks/mocks.dart';

void main() {
  final BabelAnalyzer analyzer = BabelAnalyzer();
  final List<String> filePaths = <String>[
    join(exampleProjectPath, 'lib', 'main.dart'),
    join(exampleProjectPath, 'lib', 'home.dart'),
    join(exampleProjectPath, 'lib', 'button.dart'),
  ];

  group('BabelAnalyzer', () {
    test('getReferences', () async {
      final Set<String> references = await analyzer.getReferences(
        filePaths,
        searchClass: 'S',
      );
      expect(references.length, 3);
    });
  });
}
