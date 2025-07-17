import 'package:easywear_models/easywear_models.dart';

abstract class CrudEvent<T extends Model<T>> extends Event<CrudEvent<T>> {
  final List<T> records;

  CrudEvent({required this.records}) : assert(records.isNotEmpty, "records should not be empty");

  Map<String, dynamic> toJson() => {
        "op": CrudEventType.fromType<T>(runtimeType).string,
        "t": ModelType.fromType(T).string,
        "records": records.map((record) => record.toJson()).toList(),
      };

  static CrudEvent fromJson2(Map<String, dynamic> json) {
    final CrudEventType op = CrudEventType.fromString(json["op"]);
    final ModelType modelType = ModelType.fromString(json["t"]);
    final List records = (json["records"] as List).map((recordJson) => modelType.fromJson(recordJson)).toList();

    CrudEvent<T> _createEvent<T extends Model<T>>(List<dynamic> recordsToCast) {
      final List<T> typedRecords = recordsToCast.cast<T>();
      switch (op) {
        case CrudEventType.createdEvent:
          return CreatedEvent<T>(records: typedRecords);
        case CrudEventType.updatedEvent:
          return UpdatedEvent<T>(records: typedRecords);
        case CrudEventType.deletedEvent:
          return DeletedEvent<T>(records: typedRecords);
      }
    }

    switch (modelType) {
      case ModelType.domain:
        return _createEvent<Domain>(records);
      case ModelType.user:
        return _createEvent<User>(records);
      case ModelType.workwear:
        return _createEvent<Workwear>(records);
      case ModelType.request:
        return _createEvent<Request>(records);
      case ModelType.code:
        return _createEvent<Code>(records);
      case ModelType.department:
        return _createEvent<Department>(records);
      case ModelType.location:
        return _createEvent<Location>(records);
      case ModelType.brand:
        return _createEvent<Brand>(records);
    }
  }

  @override
  CrudEvent<T> fromJson(Map<String, dynamic> json) => CrudEvent.fromJson2(json) as CreatedEvent<T>;
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

main() {
  var event = CreatedEvent(records: [
    Location(
      domainId: Id(""),
      name: "",
      departmentIds: {},
      shop: {},
      inventory: Inventory.empty(),
    ),
  ]);

  var json = event.toJson();
  print(json);
  print(Event.fromJson2(json));
}
