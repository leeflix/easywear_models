import 'package:easywear_models/easywear_models.dart';

class SendRefinementRequestedEmailRequest {
  final Id<User> userId;
  final String image;
  final String comment;
  final String contactEmail;
  final String phoneNumber;

  SendRefinementRequestedEmailRequest({
    required this.userId,
    required this.image,
    required this.comment,
    required this.contactEmail,
    required this.phoneNumber,
  });
}