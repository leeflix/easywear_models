import 'package:easywear_models/easywear_models.dart';

class CountUsersWithFirstAndLastNameRequest {
  final Id<Domain> domainId;
  final String firstName;
  final String lastName;

  CountUsersWithFirstAndLastNameRequest({
    required this.domainId,
    required this.firstName,
    required this.lastName,
  });
}
