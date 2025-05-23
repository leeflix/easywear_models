import 'dart:convert';

import 'package:easywear_models/util.dart';
import 'package:uuid/uuid.dart';

abstract class Model<T extends Model<T>> {
  String id;
  DateTime created;
  DateTime updated;
  bool isArchived;
  String domainId;

  Model({
    required this.domainId,
    String? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
  })  : id = id ?? Uuid().v4(),
        created = created ?? DateTime.now(),
        updated = updated ?? DateTime.now(),
        isArchived = isArchived ?? false;

  String className();

  Map<String, dynamic> toJson() {
    return {
      "domainId": domainId,
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
