import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:easywear_models/easywear_models.dart';
import 'package:meta/meta.dart';

class UserToken<T extends UserToken<T>> extends Token<T> {
  final Id<User> userId;

  UserToken({
    required this.userId,
  });

  UserToken.fromJson(Map<String, dynamic> json) : userId = Id<User>(json["userId"]);

  UserToken.fromToken({
    required String token,
    required Secret<T> secret,
  }) : this.fromJson(JWT.verify(token, SecretKey(secret.value)).payload);

  @mustCallSuper
  Map<String, dynamic> toJson() => {
        "userId": userId,
      };

  @override
  @mustCallSuper
  UserToken<T> fromJson(Map<String, dynamic> json) => UserToken<T>.fromJson(json);
}
