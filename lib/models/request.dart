import 'claim.dart';
import 'correction.dart';
import 'model.dart';
import 'order.dart';
import 'request_status.dart';
import 'request_type.dart';

abstract class Request extends Model<Request> {
  DateTime created;
  String userId;
  RequestStatus status;
  String? adminMessage;
  String? userMessage;

  Request({
    required super.id,
    required this.created,
    required this.userId,
    required this.status,
    required this.adminMessage,
    required this.userMessage,
  });

  static Request fromJson2(Map<String, dynamic> json) {
    var requestType = RequestTypeE.fromString(json["type"]);
    switch (requestType) {
      case RequestType.order:
        return Order.fromJson(json);
      case RequestType.claim:
        return Claim.fromJson(json);
      case RequestType.correction:
        return Correction.fromJson(json);
    }
  }

  RequestType get type => switch (this) {
    Order _ => RequestType.order,
    Claim _ => RequestType.claim,
    Correction _ => RequestType.correction,
    _ => throw Error(),
  };
}
