import 'package:easywear_models/easywear_models.dart';

class RemoteAreaInfo extends DataClass<RemoteAreaInfo> {
  RemoteAreaType type;
  bool isRemoteArea;

  RemoteAreaInfo({
    required this.type,
    required this.isRemoteArea,
  });

  Map<String, dynamic> toJson() => {
        "type": type.string,
        "isRemoteArea": isRemoteArea,
      };

  RemoteAreaInfo.fromJson(Map<String, dynamic> json)
      : type = RemoteAreaType.fromString(json["type"]),
        isRemoteArea = json["isRemoteArea"];

  @override
  RemoteAreaInfo fromJson(Map<String, dynamic> json) =>
      RemoteAreaInfo.fromJson(json);
}
