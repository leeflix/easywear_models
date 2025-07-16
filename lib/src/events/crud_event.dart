import 'package:easywear_models/easywear_models.dart';

abstract class CRUDEvent<T extends Model<T>, U extends Event<U>> extends Event<U> {
  Set<T> records;

  CRUDEvent({required this.records});

  Map<String, dynamic> toJson() => {
        "type": "${T}s${runtimeType.toString().split("<").first}",
        "${T.toString().toLowerCase()}s": records.map((record) => record.toJson()).toList(),
      };

  CRUDEvent.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic> json) fromJson, String crudEventType)
      : assert(json["type"] == "${T}s$crudEventType"),
        records = json["${T.toString().toLowerCase()}s"].map<T>(fromJson).toList();
}
