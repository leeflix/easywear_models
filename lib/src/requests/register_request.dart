import 'package:easywear_models/easywear_models.dart';

class RegisterRequest {
  final String code;
  final String? companyMail;
  final String? contactMail;
  final String firstName;
  final String lastName;
  final String userName;
  final String password;
  final Language language;

  RegisterRequest({
    required this.code,
    required this.companyMail,
    required this.contactMail,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.password,
    required this.language,
  });
}