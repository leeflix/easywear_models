import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:easywear_models/easywear_models.dart';

class AccessToken extends UserToken<AccessToken> {
  final Id<Domain> domainId;

  AccessToken({
    required super.userId,
    required this.domainId,
  });

  AccessToken.fromJson(Map<String, dynamic> json)
      : domainId = Id<Domain>(json["domainId"]),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        "domainId": domainId,
      };

  AccessToken.fromToken({
    required String token,
    required Secret<AccessToken> secret,
  }) : this.fromJson(JWT.verify(token, SecretKey(secret.value)).payload);
}
