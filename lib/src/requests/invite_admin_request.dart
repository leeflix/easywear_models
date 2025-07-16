import 'package:easywear_models/easywear_models.dart';

class InviteAdminRequest {
  final Id<Domain> domainId;
  final String companyMail;

  InviteAdminRequest({
    required this.domainId,
    required this.companyMail,
  });
}