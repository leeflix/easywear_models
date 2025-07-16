import 'package:easywear_models/easywear_models.dart';

class RegisterDomainRequest {
  final String companyMail;
  final Language? language;
  final String? firstName;
  final String? lastName;
  final String? password;
  final String? companyName;
  final String? phoneNumber;

  RegisterDomainRequest({
    required this.language,
    required this.companyMail,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.companyName,
    required this.phoneNumber,
  });
}