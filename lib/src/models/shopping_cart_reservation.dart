import 'package:easywear_models/easywear_models.dart';

/// Status of a shopping cart reservation
enum ReservationStatus {
  active,
  completed,
  expired,
  canceled,
}

extension ReservationStatusExt on ReservationStatus {
  String get string => toString().split(".").last;

  static ReservationStatus fromString(String s) =>
      ReservationStatus.values.firstWhere((e) => e.string == s);

  String uiText(Language currentLanguage) {
    switch (this) {
      case ReservationStatus.active:
        return switch (currentLanguage) {
          Language.de => "Aktiv",
          Language.en => "Active",
          _ => "Active",
        };
      case ReservationStatus.completed:
        return switch (currentLanguage) {
          Language.de => "Abgeschlossen",
          Language.en => "Completed",
          _ => "Completed",
        };
      case ReservationStatus.expired:
        return switch (currentLanguage) {
          Language.de => "Abgelaufen",
          Language.en => "Expired",
          _ => "Expired",
        };
      case ReservationStatus.canceled:
        return switch (currentLanguage) {
          Language.de => "Storniert",
          Language.en => "Canceled",
          _ => "Canceled",
        };
    }
  }
}

/// Represents a temporary reservation of requests in a shopping cart
class ShoppingCartReservation extends Model<ShoppingCartReservation> {
  Id<User> adminId;
  String cartId;
  Set<Id<Request>> requestIds;
  DateTime expiresAt;
  ReservationStatus status;

  ShoppingCartReservation({
    required super.domainId,
    Id<ShoppingCartReservation>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.adminId,
    required this.cartId,
    required this.requestIds,
    required this.expiresAt,
    required this.status,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  @override
  Map<String, dynamic> toJson() => {
        "adminId": adminId,
        "cartId": cartId,
        "requestIds": requestIds.toList(),
        "expiresAt": expiresAt.toIso8601String(),
        "status": status.string,
        ...super.toJson(),
      };

  ShoppingCartReservation.fromJson(Map<String, dynamic> json)
      : adminId = json["adminId"],
        cartId = json["cartId"],
        requestIds = Set<Id<Request>>.from(json["requestIds"]),
        expiresAt = DateTime.parse(json["expiresAt"]),
        status = ReservationStatusExt.fromString(json["status"]),
        super(
          domainId: json["domainId"],
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
        );

  @override
  ShoppingCartReservation fromJson(Map<String, dynamic> json) =>
      ShoppingCartReservation.fromJson(json);

  /// Check if this reservation is still active
  bool get isActive {
    return status == ReservationStatus.active &&
        DateTime.now().isBefore(expiresAt);
  }

  /// Check if this reservation has expired
  bool get isExpired {
    return status == ReservationStatus.active &&
        DateTime.now().isAfter(expiresAt);
  }
}
