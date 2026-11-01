import 'package:analyzer/dart/ast/ast.dart'
    show MethodInvocation, PrefixedIdentifier, PropertyAccess;
import 'package:analyzer/dart/ast/visitor.dart' show GeneralizingAstVisitor;
import 'package:analyzer/dart/element/element.dart' show ClassElement;
import 'package:meta/meta.dart';

/// Custom [AstVisitor] that parses a [CompilationUnit]
/// and searches for references of the generated localization classes.
///
/// Kudos to [Pantelis Tsakoulis](https://github.com/spideythewebhead) for his contribution 🙏🏻
class L10NReferencesVisitor extends GeneralizingAstVisitor<void> {
  L10NReferencesVisitor(String? searchClass)
    : searchClass = searchClass ?? 'AppLocalizations';

  final String searchClass;

  final Set<String> l10nUsedKeys = <String>{};

  @override
  void visitPrefixedIdentifier(PrefixedIdentifier node) {
    if (node.prefix.staticType?.element case final ClassElement $class
        when $class.name == searchClass) {
      tryToMarkName($class, node.identifier.name);
    }
    return super.visitPrefixedIdentifier(node);
  }

  @override
  void visitPropertyAccess(PropertyAccess node) {
    if (node.realTarget.staticType?.element case final ClassElement $class
        when $class.name == searchClass) {
      tryToMarkName($class, node.propertyName.name);
    }
    return super.visitPropertyAccess(node);
  }

  @override
  void visitMethodInvocation(MethodInvocation node) {
    if (node.realTarget?.staticType?.element case final ClassElement $class
        when $class.name == searchClass) {
      tryToMarkName($class, node.methodName.name);
    }
    return super.visitMethodInvocation(node);
  }

  @visibleForTesting
  void tryToMarkName(
    ClassElement $class,
    String memberName,
  ) {
    // Plain translations are generated as getters, while translations with
    // placeholders are generated as methods.
    if ($class.getGetter(memberName) != null ||
        $class.getMethod(memberName) != null) {
      l10nUsedKeys.add(memberName);
    }
  }
}
