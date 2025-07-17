import 'package:easywear_models/easywear_models.dart';

abstract class Event<E extends DataClass<E>> extends DataClass<E> {
  static Event fromJson2(Map<String, dynamic> json) {
    switch (json["type"]) {
      case InitEvent.id:
        return InitEvent.fromJson(json);
      default:
        return CrudEvent.fromJson2(json);
    }
  }
}
