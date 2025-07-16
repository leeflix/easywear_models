import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:easywear_models/easywear_models.dart';

abstract class Token<T extends Token<T>> extends DataClass<Token> {
  String sign({required Secret<T> secret}) => JWT(toJson()).sign(SecretKey(secret.value));
}
