import 'package:easywear_models/easywear_models.dart';

class InitEvent extends Event<InitEvent> {
  static const String id = "InitEvent";
  String accessToken;

  InitEvent({
    required this.accessToken,
  });

  Map<String, dynamic> toJson() => {
        "type": id,
        "accessToken": accessToken,
      };

  InitEvent.fromJson(Map<String, dynamic> json)
      : assert(json["type"] == id),
        accessToken = json["accessToken"];

  @override
  InitEvent fromJson(Map<String, dynamic> json) => InitEvent.fromJson(json);
}
