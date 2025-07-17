import 'package:easywear_models/easywear_models.dart';

enum CrudEventType {
  createdEvent,
  updatedEvent,
  deletedEvent;

  Type type<T extends Model<T>>() => switch (this) {
        CrudEventType.createdEvent => CreatedEvent<T>,
        CrudEventType.updatedEvent => UpdatedEvent<T>,
        CrudEventType.deletedEvent => DeletedEvent<T>,
      };

  static CrudEventType fromString(String s) => CrudEventType.values.firstWhere((e) => e.string == s);

  static CrudEventType fromType<T extends Model<T>>(Type type) {
    return CrudEventType.values.firstWhere((eventType) => type == eventType.type<T>());
  }
}
