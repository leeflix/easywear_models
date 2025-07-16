import 'package:easywear_models/easywear_models.dart';

class CreatedEvent<T extends Model<T>> extends CRUDEvent<T, CreatedEvent<T>> {
  CreatedEvent({required super.records});

  CreatedEvent.fromJson(json, fromJson) : super.fromJson(json, fromJson, "CreatedEvent");

  @override
  CreatedEvent<T> fromJson(Map<String, dynamic> json) => CreatedEvent.fromJson(json, fromJson);
}
