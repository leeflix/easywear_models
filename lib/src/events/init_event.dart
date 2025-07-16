import 'package:easywear_models/easywear_models.dart';

class InitEvent extends Event<InitEvent> {
  String accessToken;

  InitEvent({
    required this.accessToken,
  });

  Map<String, dynamic> toJson() => {
        "type": "InitEvent",
        "accessToken": accessToken,
      };

  InitEvent.fromJson(Map<String, dynamic> json) : accessToken = json["accessToken"];

  @override
  InitEvent fromJson(Map<String, dynamic> json) => InitEvent.fromJson(json);
}
