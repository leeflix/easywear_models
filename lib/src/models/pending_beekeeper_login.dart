import 'package:easywear_models/easywear_models.dart';

/// Represents a pending Beekeeper SSO login attempt that requires admin approval
class PendingBeekeeperLogin extends Model<PendingBeekeeperLogin> {
  /// Beekeeper user ID (sub from JWT)
  String beekeeperUserId;

  /// User's email from Beekeeper
  String? email;

  /// User's personnel number from Beekeeper (tenantuserid)
  String? personnelNumber;

  /// User's first name from Beekeeper
  String? firstName;

  /// User's last name from Beekeeper
  String? lastName;

  /// First login attempt timestamp
  DateTime firstAttempt;

  /// Last login attempt timestamp
  DateTime lastAttempt;

  /// Number of login attempts
  int attemptCount;

  /// Status: pending, approved, rejected
  String status;

  /// Full Beekeeper user data (JSON)
  Map<String, dynamic> beekeeperUserData;

  /// Created user ID if approved
  Id<User>? approvedUserId;

  /// Admin who approved/rejected
  Id<User>? reviewedByUserId;

  /// Review timestamp
  DateTime? reviewedAt;

  PendingBeekeeperLogin({
    required super.domainId,
    Id<PendingBeekeeperLogin>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.beekeeperUserId,
    required this.email,
    required this.personnelNumber,
    required this.firstName,
    required this.lastName,
    required this.firstAttempt,
    required this.lastAttempt,
    required this.attemptCount,
    required this.status,
    required this.beekeeperUserData,
    this.approvedUserId,
    this.reviewedByUserId,
    this.reviewedAt,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  PendingBeekeeperLogin.fromJson(Map<String, dynamic> json)
      : beekeeperUserId = json["beekeeperUserId"],
        email = json["email"],
        personnelNumber = json["personnelNumber"],
        firstName = json["firstName"],
        lastName = json["lastName"],
        firstAttempt = DateTime.parse(json["firstAttempt"]),
        lastAttempt = DateTime.parse(json["lastAttempt"]),
        attemptCount = json["attemptCount"],
        status = json["status"],
        beekeeperUserData = json["beekeeperUserData"],
        approvedUserId = json["approvedUserId"],
        reviewedByUserId = json["reviewedByUserId"],
        reviewedAt = json["reviewedAt"] != null ? DateTime.parse(json["reviewedAt"]) : null,
        super(
          domainId: json["domainId"],
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
        );

  @override
  Map<String, dynamic> toJson() => {
        "beekeeperUserId": beekeeperUserId,
        "email": email,
        "personnelNumber": personnelNumber,
        "firstName": firstName,
        "lastName": lastName,
        "firstAttempt": firstAttempt.toIso8601String(),
        "lastAttempt": lastAttempt.toIso8601String(),
        "attemptCount": attemptCount,
        "status": status,
        "beekeeperUserData": beekeeperUserData,
        "approvedUserId": approvedUserId,
        "reviewedByUserId": reviewedByUserId,
        "reviewedAt": reviewedAt?.toIso8601String(),
        ...super.toJson(),
      };

  @override
  PendingBeekeeperLogin fromJson(Map<String, dynamic> json) => PendingBeekeeperLogin.fromJson(json);
}
