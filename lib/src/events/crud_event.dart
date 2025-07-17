import 'package:easywear_models/easywear_models.dart';

abstract class CrudEvent<T extends Model<T>> extends Event<CrudEvent<T>> {
  final Set<T> records;

  CrudEvent({required this.records}) : assert(records.isNotEmpty, "records should not be empty");

  Map<String, dynamic> toJson() => {
        "op": "",
        "type": "",
        "records": records.map((record) => record.toJson()).toList(),
      };

  static CrudEvent<T> fromJson2<T extends Model<T>>(Map<String, dynamic> json) {
    final CrudEventType op = CrudEventType.fromString(json["op"]);
    final ModelType modelTypeString = ModelType.fromString(json["type"]);
    final Set<T> records = (json["records"] as List).map((recordJson) => modelTypeString.fromJson<T>(recordJson)).toSet();

    switch (op) {
      case CrudEventType.create:
        return CreatedEvent<T>(records: records);
      case CrudEventType.update:
        return UpdatedEvent<T>(records: records);
      case CrudEventType.delete:
        return DeletedEvent<T>(records: records);
    }
  }

  @override
  CrudEvent<T> fromJson(Map<String, dynamic> json) => CrudEvent.fromJson2<T>(json);
}

class CreatedEvent<T extends Model<T>> extends CrudEvent<T> {
  CreatedEvent({required super.records});

  @override
  CrudEventType get op => CrudEventType.create;
}

class UpdatedEvent<T extends Model<T>> extends CrudEvent<T> {
  UpdatedEvent({required super.records});

  @override
  CrudEventType get op => CrudEventType.update;
}

class DeletedEvent<T extends Model<T>> extends CrudEvent<T> {
  DeletedEvent({required super.records});

  @override
  CrudEventType get op => CrudEventType.delete;
}
