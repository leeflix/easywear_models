import 'package:easywear_models/easywear_models.dart';

class SkipLoginToken extends UserToken<SkipLoginToken> {
  final Id<Domain> domainId;

  SkipLoginToken({
    required super.userId,
    required this.domainId,
  });

  SkipLoginToken.fromJson(Map<String, dynamic> json)
      : domainId = Id<Domain>(json["domainId"]),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        "domainId": domainId,
      };

  @override
  SkipLoginToken fromJson(Map<String, dynamic> json) => SkipLoginToken.fromJson(json);
}
