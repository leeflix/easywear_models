import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:easywear_models/easywear_models.dart';

class SkipLoginToken extends UserToken<SkipLoginToken> {
  final Id<Domain> domainId;

  SkipLoginToken({
    required super.userId,
    required this.domainId,
  });

  SkipLoginToken.fromJson(Map<String, dynamic> json)
      : domainId = Id<Domain>(json["domainId"]),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        "domainId": domainId,
      };

  SkipLoginToken.fromToken({
    required String token,
    required Secret<SkipLoginToken> secret,
  }) : this.fromJson(JWT.verify(token, SecretKey(secret.value)).payload);
}
