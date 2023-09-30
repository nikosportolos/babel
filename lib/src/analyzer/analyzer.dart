import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart'
    show SomeResolvedUnitResult, ResolvedUnitResult;
import 'package:analyzer/dart/ast/ast.dart' show CompilationUnit;
import 'package:babel/src/analyzer/visitor.dart';
import 'package:trace/trace.dart';

class BabelAnalyzer {
  Future<Set<String>> getReferences(
    final List<String> filesPaths, {
    final String? searchClass,
  }) async {
    final AnalysisContextCollection contextCollection = AnalysisContextCollection(
      includedPaths: filesPaths,
    );

    final Set<String> references = <String>{};

    // For each resolved file visit the ast and find references of L10N getters
    for (final String filePath in filesPaths) {
      references.addAll(
        await getReferencesForPath(
          filePath,
          contextCollection: contextCollection,
          searchClass: searchClass,
        ),
      );
    }

    return references;
  }

  Future<Set<String>> getReferencesForPath(
    final String filePath, {
    required final AnalysisContextCollection contextCollection,
    final String? searchClass,
  }) async {
    try {
      final AnalysisContext ctx = contextCollection.contextFor(filePath);
      final CompilationUnit unit = await ctx.currentSession
          .getResolvedUnit(filePath)
          .then((SomeResolvedUnitResult result) => (result as ResolvedUnitResult).unit);

      final L10NReferencesVisitor l10nReferencesVisitor = L10NReferencesVisitor(searchClass);
      unit.accept(l10nReferencesVisitor);

      return l10nReferencesVisitor.l10nUsedKeys;
    } catch (e, st) {
      Trace.error('Failed to analyze file "$filePath"', e, st);
      return <String>{};
    }
  }
}
