import 'package:easywear_models/easywear_models.dart';
import 'package:easywear_models/src/events/crud_event_type.dart';

class CRUDEvent<T extends Model<T>> extends Event<CRUDEvent<T>> {
  CrudEventType op;
  Set<T> records;

  CRUDEvent.create({required this.records}) : op = CrudEventType.create;

  CRUDEvent.update({required this.records}) : op = CrudEventType.update;

  CRUDEvent.delete({required this.records}) : op = CrudEventType.delete;

  Map<String, dynamic> toJson() => {
        "op": op.string,
        "type": Models.fromType(T).string,
        "records": records.map((record) => record.toJson()).toList(),
      };

  CRUDEvent.fromJson(Map<String, dynamic> json)
      : op = CrudEventType.fromString(json["op"]),
        records = Set<T>.from((json["records"] as List).map((recordJson) => Models.fromString(json["type"]).fromJson<T>(recordJson)));

  @override
  CRUDEvent<T> fromJson(Map<String, dynamic> json) => CRUDEvent.fromJson(json);
}
