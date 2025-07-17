import 'package:easywear_models/easywear_models.dart';

final Map<Category, dynamic> categoryHierarchy = {
  Category.persoenlicheSchutzausruestung: {
    // Hauptkategorie: PSA
    Category.kopfschutz: {
      Category.masken: {}, // Atemschutzmasken
      Category.kopfbedeckungen: {
        // Allgemeine Kopfbedeckungen
        Category.barettmuetzen: {},
        Category.kochmuetzen: {},
        Category.bandanas: {},
        Category.fleischermuetzen: {},
        Category.basecaps: {},
      },
    },
    Category.augenschutz: {},
    Category.gehoerschutz: {},
  },
  Category.arbeitskleidung: {
    // Hauptkategorie: Arbeitskleidung
    Category.oberbekleidung: {
      // Oberteile
      Category.hemden: {
        Category.langaermligeHemden: {},
        Category.kurzaermeligeHemden: {},
      },
      Category.blusen: {
        Category.langaermligeBlusen: {},
        Category.kurzaermeligeBlusen: {},
      },
      Category.shirts: {
        Category.poloshirts: {},
        Category.tShirts: {},
        Category.langaermligeShirts: {},
      },
      Category.jacken: {
        Category.kochjacken: {},
        Category.softshelljacken: {},
        Category.fleecejacken: {},
        Category.hybridjacken: {},
      },
      Category.westen: {
        Category.kellnerwesten: {},
        Category.softshellwesten: {},
      },
      Category.kasacks: {},
    },
    Category.unterbekleidung: {
      // Unterteile
      Category.hosen: {},
      Category.roecke: {},
    },
    Category.berufsbekleidungSpezial: {
      // Spezialisierte Bekleidung
      Category.schuerzen: {
        Category.bistroschuerzen: {},
        Category.latzschuerzen: {},
        Category.vorbinder: {},
      },
      Category.einwegbekleidung: {},
    },
    Category.schuhe: {
      Category.berufsschuhe: {},
      Category.sicherheitsschuhe: {},
    },
  },
  Category.accessoires: {
    // Hauptkategorie: Accessoires
    Category.halstuecher: {},
    Category.hosentraeger: {},
    Category.aermelbaender: {},
    Category.handschuhe: {},
    Category.fliegen: {},
    Category.krawatten: {},
    Category.friseurumhaenge: {},
    Category.geschirrtuecher: {},
    Category.kassierhalfter: {},
    Category.kugelknopf: {},
    Category.knopfleisten: {},
    Category.geldboersen: {},
    Category.passiertuecher: {},
  },
};

extension CategorySetExtension on Set<Category> {
  /// Expands the set of categories to include all their descendants based on the full hierarchy.
  Set<Category> expandWithDescendants() => _expandCategoriesWithDescendants(this, categoryHierarchy);
}

extension StringSetExtension on Set<String> {
  Set<String> expandWithDescendants() => map(Category.fromString).toSet().expandWithDescendants().map((category) => category.string).toSet();
}

dynamic _findChildrenOfCategory(Category targetCategory, Map<Category, dynamic> currentHierarchy) {
  // Check if the targetCategory is a key in the current map
  if (currentHierarchy.containsKey(targetCategory)) {
    return currentHierarchy[targetCategory];
  }

  // If not, recursively search in the nested maps
  for (final entry in currentHierarchy.entries) {
    final dynamic value = entry.value;
    if (value is Map<Category, dynamic>) {
      final found = _findChildrenOfCategory(targetCategory, value);
      if (found != null) {
        return found;
      }
    }
  }
  return null; // Category not found in this branch
}

/// Recursively adds all descendants of a given category from a specific branch of the hierarchy to a set.
void _addDescendantsRecursive(
  dynamic childrenData, // This can be a Map or a Set
  Set<Category> resultSet,
) {
  if (childrenData == null) {
    return; // No children to add
  }

  if (childrenData is Map<Category, dynamic>) {
    for (final Category childCategory in childrenData.keys) {
      resultSet.add(childCategory);
      _addDescendantsRecursive(childrenData[childCategory], resultSet); // Recurse into children's children
    }
  } else if (childrenData is Set<Category>) {
    for (final Category childCategory in childrenData) {
      resultSet.add(childCategory);
      // No further recursion needed for these as they are leaf categories in a set
    }
  } else if (childrenData is Category) {
    // This case handles direct leaf categories not nested in a map/set, if any.
    // Based on your hierarchy, direct enum values are generally within a Set or as keys of a Map.
    // But adding for robustness.
    resultSet.add(childrenData);
  }
}

/// Expands a set of categories to include all their descendants, regardless of their level in the hierarchy.
Set<Category> _expandCategoriesWithDescendants(
  Set<Category> initialCategories,
  Map<Category, dynamic> fullHierarchy,
) {
  final Set<Category> expandedSet = {...initialCategories}; // Create a mutable copy

  for (final Category categoryToExpand in initialCategories) {
    // Add the category itself to the expanded set, if it wasn't already there
    expandedSet.add(categoryToExpand);

    // Find the direct children data for this category in the full hierarchy
    final dynamic childrenData = _findChildrenOfCategory(categoryToExpand, fullHierarchy);

    // Now, recursively add all descendants based on the found children data
    _addDescendantsRecursive(childrenData, expandedSet);
  }

  return expandedSet;
}
