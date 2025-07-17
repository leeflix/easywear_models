import 'package:easywear_models/easywear_models.dart';

enum CrudEventType {
  createdEvent,
  updatedEvent,
  deletedEvent;

  Type get type => switch (this) {
        CrudEventType.createdEvent => CreatedEvent,
        CrudEventType.updatedEvent => UpdatedEvent,
        CrudEventType.deletedEvent => DeletedEvent,
      };

  static CrudEventType fromString(String s) => CrudEventType.values.firstWhere((e) => e.string == s);

  static CrudEventType fromType(Type type) => CrudEventType.values.firstWhere((eventType) => type == eventType.type);
}
