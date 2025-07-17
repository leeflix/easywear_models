import 'package:easywear_models/easywear_models.dart';

abstract class CrudEvent<T extends Model<T>> extends Event<CrudEvent<T>> {
  final List<T> records;

  CrudEvent({required this.records}) : assert(records.isNotEmpty, "records should not be empty");

  Map<String, dynamic> toJson() => {
    "op": CrudEventType.fromType(runtimeType).string,
    "type": ModelType.fromType(T).string,
    "records": records.map((record) => record.toJson()).toList(),
  };

  static CrudEvent fromJson2(Map<String, dynamic> json) {
    final CrudEventType op = CrudEventType.fromString(json["op"]);
    final ModelType modelType = ModelType.fromString(json["type"]);
    final List records = (json["records"] as List)
        .map((recordJson) => modelType.fromJson(recordJson))
        .toList();

    switch (op) {
      case CrudEventType.createdEvent:
        return CreatedEvent(records: records);
      case CrudEventType.updatedEvent:
        return UpdatedEvent(records: records);
      case CrudEventType.deletedEvent:
        return DeletedEvent(records: records);
    }
  }

  @override
  CrudEvent<T> fromJson(Map<String, dynamic> json) => CrudEvent.fromJson2(json);
}

class CreatedEvent<T extends Model<T>> extends CrudEvent<T> {
  CreatedEvent({required super.records});
}

class UpdatedEvent<T extends Model<T>> extends CrudEvent<T> {
  UpdatedEvent({required super.records});
}

class DeletedEvent<T extends Model<T>> extends CrudEvent<T> {
  DeletedEvent({required super.records});
}