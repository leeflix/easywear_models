import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:easywear_models/easywear_models.dart';

class UnsubscribeNewsletterToken extends Token<UnsubscribeNewsletterToken> {
  final String email;

  UnsubscribeNewsletterToken({
    required this.email,
  });

  UnsubscribeNewsletterToken.fromJson(Map<String, dynamic> json) : email = json["email"];

  Map<String, dynamic> toJson() => {
        "email": email,
      };

  @override
  Token<Token> fromJson(Map<String, dynamic> json) => UnsubscribeNewsletterToken.fromJson(json);

  UnsubscribeNewsletterToken.fromToken({
    required String token,
    required Secret<UnsubscribeNewsletterToken> secret,
  }) : this.fromJson(JWT.verify(token, SecretKey(secret.value)).payload);
}
