import 'package:easywear_models/easywear_models.dart';

class DeletedEvent<T extends Model<T>> extends CRUDEvent<T, DeletedEvent<T>> {
  DeletedEvent({required super.records});

  DeletedEvent.fromJson(json, fromJson) : super.fromJson(json, fromJson, "DeletedEvent");

  @override
  DeletedEvent<T> fromJson(Map<String, dynamic> json) => DeletedEvent.fromJson(json, fromJson);
}
