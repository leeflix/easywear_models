import 'package:easywear_models/easywear_models.dart';

class SendUserVerificationEmailRequest {
  final String companyMail;
  final Language language;

  SendUserVerificationEmailRequest({
    required this.companyMail,
    required this.language,
  });
}