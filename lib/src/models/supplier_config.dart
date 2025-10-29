import 'dart:convert';

import 'package:easywear_models/easywear_models.dart';

class SupplierConfig {
  Set<Id<Domain>> customerDomainIds;
  Map<Id<Domain>, Set<Id<Workwear>>> domainIdToWorkwearIds;
  String? returnPolicyUrl;
  String? supportEmail;
  String? supportPhone;
  String? returnUrl;
  String? agbUrl;

  /// Email addresses that should receive all supplier notifications.
  /// This includes: orders, product advice requests, refinement requests, and support emails.
  /// If null or empty, falls back to supportEmail for backwards compatibility.
  Set<String>? notificationEmails;

  SupplierConfig({
    required this.customerDomainIds,
    required this.domainIdToWorkwearIds,
    required this.returnPolicyUrl,
    required this.supportEmail,
    required this.supportPhone,
    required this.returnUrl,
    required this.agbUrl,
    this.notificationEmails,
  });

  Map<String, dynamic> toJson() => {
        "customerDomainIds": customerDomainIds.toList(),
        "domainIdToWorkwearIds": domainIdToWorkwearIds.map((key, value) => MapEntry(key, value.toList())),
        "returnPolicyUrl": returnPolicyUrl,
        "supportEmail": supportEmail,
        "supportPhone": supportPhone,
        "returnUrl": returnUrl,
        "agbUrl": agbUrl,
        "notificationEmails": notificationEmails?.toList(),
      };

  SupplierConfig.fromJson(Map<String, dynamic> json)
      : customerDomainIds = Set<Id<Domain>>.from(json["customerDomainIds"]),
        domainIdToWorkwearIds = (json["domainIdToWorkwearIds"] as Map).map(
          (key, value) => MapEntry(key, Set<Id<Workwear>>.from(value)),
        ),
        returnPolicyUrl = json["returnPolicyUrl"],
        supportEmail = json["supportEmail"],
        supportPhone = json["supportPhone"],
        returnUrl = json["returnUrl"],
        agbUrl = json["agbUrl"],
        // Support both new field name and old field name for backwards compatibility
        notificationEmails = json["notificationEmails"] != null
            ? Set<String>.from(json["notificationEmails"])
            : (json["orderNotificationEmails"] != null
                ? Set<String>.from(json["orderNotificationEmails"])
                : null);

  @override
  String toString() => jsonEncode(this);
}
