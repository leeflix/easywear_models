import 'claim.dart';
import 'correction.dart';
import 'model.dart';
import 'order.dart';
import 'request_status.dart';
import 'request_type.dart';

abstract class Request extends Model<Request> {
  String userId;
  RequestStatus status;
  String? adminMessage;
  String? userMessage;

  Request({
    required super.id,
    required super.created,
    required super.updated,
    required super.isArchived,
    required this.userId,
    required this.status,
    required this.adminMessage,
    required this.userMessage,
  });

  static Request fromJson2(Map<String, dynamic> json) =>
      switch (RequestTypeE.fromString(json["type"])) {
        RequestType.order => Order.fromJson(json),
        RequestType.claim => Claim.fromJson(json),
        RequestType.correction => Correction.fromJson(json),
      };

  RequestType get type => switch (this) {
        Claim _ => RequestType.claim,
        Order _ => RequestType.order,
        Correction _ => RequestType.correction,
        _ => throw Error(),
      };
}
