import 'package:easywear_models/easywear_models.dart';

class VerifyUserToken extends UserToken<VerifyUserToken> {
  VerifyUserToken({required super.userId});

  VerifyUserToken.fromJson(super.json) : super.fromJson();

  VerifyUserToken.fromToken({
    required super.token,
    required super.secret,
  }) : super.fromToken();
}
