Map<String, dynamic> removeUnderscoreFromId(Map<String, dynamic> doc) {
  doc["id"] = doc["_id"];
  doc.remove("_id");
  return doc;
}

Map<String, dynamic> addUnderscoreToId(Map<String, dynamic> json) {
  json["_id"] = json["id"];
  json.remove("id");
  return json;
}

int compareAlphanumeric(String a, String b) {
  final regExp = RegExp(r'(\d+)|(\D+)'); // Match numbers or non-numbers
  final aMatches = regExp.allMatches(a).map((m) => m.group(0)!).toList();
  final bMatches = regExp.allMatches(b).map((m) => m.group(0)!).toList();

  for (int i = 0; i < aMatches.length && i < bMatches.length; i++) {
    final aPart = aMatches[i];
    final bPart = bMatches[i];

    // Try to parse numbers
    final aNum = int.tryParse(aPart);
    final bNum = int.tryParse(bPart);

    if (aNum != null && bNum != null) {
      // Compare numerically
      if (aNum != bNum) return aNum - bNum;
    } else {
      // Compare as strings
      final cmp = aPart.compareTo(bPart);
      if (cmp != 0) return cmp;
    }
  }

  return a.length - b.length;
}

extension EnumExtension<T> on Enum {
  String get string => toString().split('.').last;
}
