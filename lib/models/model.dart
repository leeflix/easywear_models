import 'dart:convert';

import '../util.dart';

abstract class Model<T extends Model<T>> {
  String id;
  DateTime created;
  DateTime updated;
  bool isArchived;

  Model({
    required this.id,
    required this.created,
    required this.updated,
    required this.isArchived,
  });

  String className();

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "created": created.toIso8601String(),
      "updated": updated.toIso8601String(),
      "isArchived": isArchived,
    };
  }

  T fromMongoDoc(Map<String, dynamic> doc) =>
      fromJson(removeUnderscoreFromId(doc));

  Map<String, dynamic> toMongoDoc() => addUnderscoreToId(toJson());

  T deepCopy() => fromJson(jsonDecode(jsonEncode(this)));

  @override
  String toString() => jsonEncode(this);

  T fromJson(Map<String, dynamic> json);
}
