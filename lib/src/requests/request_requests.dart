import 'package:easywear_models/easywear_models.dart';

class RejectRequestRequest {
  final Id<Request> requestId;

  RejectRequestRequest({
    required this.requestId,
  });
}

class RestoreRequestRequest {
  final Id<Request> requestId;

  RestoreRequestRequest({
    required this.requestId,
  });
}

class CompleteRequestRequest {
  final Id<Request> requestId;

  CompleteRequestRequest({
    required this.requestId,
  });
}

class CancelRequestRequest {
  final Id<Request> requestId;
  final String? reason;

  CancelRequestRequest({
    required this.requestId,
    required this.reason,
  });
}