import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
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

  EasyWearAccessToken.fromToken({
    required String token,
    required Secret<EasyWearAccessToken> secret,
  }) : this.fromJson(JWT.verify(token, SecretKey(secret.value)).payload);
}
