import 'package:easywear_models/easywear_models.dart';

class EasyWearAccessToken extends UserToken<EasyWearAccessToken> {
  final Id<Domain> domainId;

  EasyWearAccessToken({
    required super.userId,
    required this.domainId,
  });

  EasyWearAccessToken.fromJson(Map<String, dynamic> json)
      : domainId = Id<Domain>(json["domainId"]),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        "domainId": domainId,
      };

  @override
  EasyWearAccessToken fromJson(Map<String, dynamic> json) => EasyWearAccessToken.fromJson(json);
}
