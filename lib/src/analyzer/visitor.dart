import 'package:analyzer/dart/ast/ast.dart' show PrefixedIdentifier, PropertyAccess;
import 'package:analyzer/dart/ast/visitor.dart' show GeneralizingAstVisitor;
import 'package:analyzer/dart/element/element.dart' show ClassElement, PropertyAccessorElement;

/// Custom [AstVisitor] that parses a [CompilationUnit]
/// and searches for references of the generated localization classes.
///
/// Thanks to [Pantelis Tsakoulis](https://github.com/spideythewebhead).
class L10NReferencesVisitor extends GeneralizingAstVisitor<void> {
  static const List<String> kSearchClasses = <String>['S', 'AppLocalizations'];

  final Set<String> l10nUsedKeys = <String>{};

  @override
  void visitPrefixedIdentifier(PrefixedIdentifier node) {
    if (node.prefix.staticType?.element case final ClassElement $class when kSearchClasses.contains($class.name)) {
      _tryToMarkName($class, node.identifier.name);
    }
    return super.visitPrefixedIdentifier(node);
  }

  @override
  void visitPropertyAccess(PropertyAccess node) {
    if (node.realTarget.staticType?.element case final ClassElement $class when kSearchClasses.contains($class.name)) {
      _tryToMarkName($class, node.propertyName.name);
    }
    return super.visitPropertyAccess(node);
  }

  void _tryToMarkName(ClassElement $class, String fieldName) {
    // Check if class has such a getter
    final int hasGetter = $class.accessors.indexWhere((PropertyAccessorElement accessor) {
      return accessor.isGetter && accessor.name == fieldName;
    });

    if (hasGetter != -1) {
      l10nUsedKeys.add(fieldName);
    }
  }
}
