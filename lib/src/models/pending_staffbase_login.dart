import 'package:easywear_models/easywear_models.dart';

/// Represents a pending Staffbase SSO login attempt that requires admin approval
class PendingStaffbaseLogin extends Model<PendingStaffbaseLogin> {
  /// Staffbase user ID (sub from JWT)
  String staffbaseUserId;

  /// User's email from Staffbase
  String? email;

  /// User's personnel number from Staffbase
  String? personnelNumber;

  /// User's first name from Staffbase
  String? firstName;

  /// User's last name from Staffbase
  String? lastName;

  /// First login attempt timestamp
  DateTime firstAttempt;

  /// Last login attempt timestamp
  DateTime lastAttempt;

  /// Number of login attempts
  int attemptCount;

  /// Status: pending, approved, rejected
  String status;

  /// Full Staffbase user data (JSON)
  Map<String, dynamic> staffbaseUserData;

  /// Created user ID if approved
  Id<User>? approvedUserId;

  /// Admin who approved/rejected
  Id<User>? reviewedByUserId;

  /// Review timestamp
  DateTime? reviewedAt;

  PendingStaffbaseLogin({
    required super.domainId,
    Id<PendingStaffbaseLogin>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.staffbaseUserId,
    required this.email,
    required this.personnelNumber,
    required this.firstName,
    required this.lastName,
    required this.firstAttempt,
    required this.lastAttempt,
    required this.attemptCount,
    required this.status,
    required this.staffbaseUserData,
    this.approvedUserId,
    this.reviewedByUserId,
    this.reviewedAt,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  PendingStaffbaseLogin.fromJson(Map<String, dynamic> json)
      : staffbaseUserId = json["staffbaseUserId"],
        email = json["email"],
        personnelNumber = json["personnelNumber"],
        firstName = json["firstName"],
        lastName = json["lastName"],
        firstAttempt = DateTime.parse(json["firstAttempt"]),
        lastAttempt = DateTime.parse(json["lastAttempt"]),
        attemptCount = json["attemptCount"],
        status = json["status"],
        staffbaseUserData = json["staffbaseUserData"],
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
        "staffbaseUserId": staffbaseUserId,
        "email": email,
        "personnelNumber": personnelNumber,
        "firstName": firstName,
        "lastName": lastName,
        "firstAttempt": firstAttempt.toIso8601String(),
        "lastAttempt": lastAttempt.toIso8601String(),
        "attemptCount": attemptCount,
        "status": status,
        "staffbaseUserData": staffbaseUserData,
        "approvedUserId": approvedUserId,
        "reviewedByUserId": reviewedByUserId,
        "reviewedAt": reviewedAt?.toIso8601String(),
        ...super.toJson(),
      };

  @override
  PendingStaffbaseLogin fromJson(Map<String, dynamic> json) => PendingStaffbaseLogin.fromJson(json);
}
