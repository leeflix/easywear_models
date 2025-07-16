import 'package:easywear_models/easywear_models.dart';

class VerifyDomainToken extends UserToken<VerifyDomainToken> {
  Id<Domain> domainId;

  VerifyDomainToken({
    required super.userId,
    required this.domainId,
  });

  VerifyDomainToken.fromJson(Map<String, dynamic> json)
      : domainId = Id<Domain>(json["domainId"]),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        "domainId": domainId,
      };
}
