import 'dart:convert';

import 'package:easywear_models/easywear_models.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

abstract class Model<T extends Model<T>> extends DataClass<T> {
  Id<T> id;
  DateTime created;
  DateTime updated;
  bool isArchived;
  Id<Domain> domainId;

  Model({
    required this.domainId,
    Id<T>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
  })  : id = id ?? Id<T>(Uuid().v4()),
        created = created ?? DateTime.now(),
        updated = updated ?? DateTime.now(),
        isArchived = isArchived ?? false;

  @mustCallSuper
  @mustBeOverridden
  Map<String, dynamic> toJson() => {
        "domainId": domainId,
        "id": id,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "isArchived": isArchived,
      };

  T fromMongoDoc(Map<String, dynamic> doc) =>
      fromJson(removeUnderscoreFromId(doc));

  Map<String, dynamic> toMongoDoc() => addUnderscoreToId(toJson());

  Models get models => Models.fromType(T); // runTimeType

  String get modelName => models.name;
}

abstract class DataClass<T extends DataClass<T>> {
  Map<String, dynamic> toJson();

  T fromJson(Map<String, dynamic> json);

  T deepCopy<T extends DataClass<T>>() =>
      fromJson(jsonDecode(jsonEncode(this))) as T;

  @override
  String toString() => JsonEncoder.withIndent("  ").convert(toJson());
}
