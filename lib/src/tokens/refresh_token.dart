import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:easywear_models/easywear_models.dart';

class RefreshToken extends UserToken<RefreshToken> {
  final Id<Domain> domainId;

  RefreshToken({
    required super.userId,
    required this.domainId,
  });

  RefreshToken.fromJson(Map<String, dynamic> json)
      : domainId = Id<Domain>(json["domainId"]),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        "domainId": domainId,
      };

  RefreshToken.fromToken({
    required String token,
    required Secret<RefreshToken> secret,
  }) : this.fromJson(JWT.verify(token, SecretKey(secret.value)).payload);
}
