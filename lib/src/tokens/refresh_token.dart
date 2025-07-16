import 'package:easywear_models/easywear_models.dart';

class RefreshToken extends UserToken<RefreshToken> {
  RefreshToken({required super.userId});

  RefreshToken.fromJson(super.json) : super.fromJson();

  RefreshToken.fromToken({
    required super.token,
    required super.secret,
  }) : super.fromToken();
}
