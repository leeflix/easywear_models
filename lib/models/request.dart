import 'claim.dart';
import 'correction.dart';
import 'model.dart';
import 'order.dart';
import 'request_status.dart';
import 'request_type.dart';

abstract base class Request extends Model<Request> {
  String userId;
  RequestStatus status;
  String? adminMessage;
  String? userMessage;

  Request({
    String? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.userId,
    required this.status,
    required this.adminMessage,
    required this.userMessage,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

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
