import 'dart:convert';

import 'package:easywear_models/easywear_models.dart';
import 'package:easywear_models/util.dart';
import 'package:uuid/uuid.dart';

enum Models {
  domain,
  user,
  workwear,
  request,
  code,
  department,
  location,
}

Type modelsToType(Models modelType) => switch (modelType) {
      Models.domain => Domain,
      Models.user => User,
      Models.workwear => Workwear,
      Models.request => Request,
      Models.code => Code,
      Models.department => Department,
      Models.location => Location,
    };

Models typeToModels(Type type) => Models.values
    .firstWhere((modelType) => modelsToType(modelType) == type);

String modelsToName(Models modelType) => switch (modelType) {
      Models.domain => "Domain",
      Models.user => "User",
      Models.workwear => "Workwear",
      Models.request => "Request",
      Models.code => "Code",
      Models.department => "Department",
      Models.location => "Location",
    };

abstract class Model<T extends Model<T>> {
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
