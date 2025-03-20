import 'dart:convert';

import '../util.dart';

abstract class Model<T extends Model<T>> {
  String id;

  Model({required this.id});

  Map<String, dynamic> toJson();

  T fromMongoDoc(Map<String, dynamic> doc) =>
      fromJson(removeUnderscoreFromId(doc));

  Map<String, dynamic> toMongoDoc() => addUnderscoreToId(toJson());

  T deepCopy() => fromJson(jsonDecode(jsonEncode(this)));

  @override
  String toString() => jsonEncode(this);

  T fromJson(Map<String, dynamic> json);
}
