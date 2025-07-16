import 'package:easywear_models/easywear_models.dart';

class SendProductAdviceRequestedEmailRequest {
  final Id<User> userId;
  final Id<Workwear> workwearId;

  SendProductAdviceRequestedEmailRequest({
    required this.userId,
    required this.workwearId,
  });
}