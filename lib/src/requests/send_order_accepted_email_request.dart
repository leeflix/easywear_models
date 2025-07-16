import 'package:easywear_models/easywear_models.dart';

class SendOrderAcceptedEmailRequest {
  final Id<Request> orderId;

  SendOrderAcceptedEmailRequest({
    required this.orderId,
  });
}