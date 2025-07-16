import 'package:easywear_models/easywear_models.dart';

class UpdatedEvent<T extends Model<T>> extends CRUDEvent<T, UpdatedEvent<T>> {
  UpdatedEvent({required super.records});

  UpdatedEvent.fromJson(json, fromJson) : super.fromJson(json, fromJson, "UpdatedEvent");

  @override
  UpdatedEvent<T> fromJson(Map<String, dynamic> json) => UpdatedEvent.fromJson(json, fromJson);
}
