import 'package:easywear_models/easywear_models.dart';

class Credentials extends DataClass<Credentials> {
  final String userNameOrCompanyMail;
  final String password;

  Credentials({
    required this.userNameOrCompanyMail,
    required this.password,
  });

  Credentials.fromJson(Map<String, dynamic> json)
      : userNameOrCompanyMail = json["userNameOrCompanyMail"],
        password = json["password"];

  @override
  Map<String, dynamic> toJson() => {
        "userNameOrCompanyMail": userNameOrCompanyMail,
        "password": password,
      };

  @override
  Credentials fromJson(Map<String, dynamic> json) => Credentials.fromJson(json);
}
