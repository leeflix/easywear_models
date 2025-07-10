import 'package:easywear_models/easywear_models.dart';

enum Models {
  domain,
  user,
  workwear,
  request,
  code,
  department,
  location;

  Type get type => switch (this) {
        Models.domain => Domain,
        Models.user => User,
        Models.workwear => Workwear,
        Models.request => Request,
        Models.code => Code,
        Models.department => Department,
        Models.location => Location,
      };

  String get name =>
      string[0].toUpperCase() + string.substring(1).toLowerCase();

  static Models fromType(Type type) =>
      Models.values.firstWhere((modelType) => modelType.type == type);
}
