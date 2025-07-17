import 'package:easywear_models/easywear_models.dart';

enum Models {
  domain,
  user,
  workwear,
  request,
  code,
  department,
  location,
  brand;

  Type get type => switch (this) {
        Models.domain => Domain,
        Models.user => User,
        Models.workwear => Workwear,
        Models.request => Request,
        Models.code => Code,
        Models.department => Department,
        Models.location => Location,
        Models.brand => Brand,
      };

  T fromJson<T extends Model<T>>(Map<String, dynamic> json) => switch (this) {
        Models.domain => Domain.fromJson(json),
        Models.user => User.fromJson(json),
        Models.workwear => Workwear.fromJson(json),
        Models.request => Request.fromJson2(json),
        Models.code => Code.fromJson(json),
        Models.department => Department.fromJson(json),
        Models.location => Location.fromJson(json),
        Models.brand => Brand.fromJson(json),
      } as T;

  static Models fromString(String s) => Models.values.firstWhere((e) => e.string == s);

  String get name => string[0].toUpperCase() + string.substring(1).toLowerCase();

  static Models fromType(Type type) => Models.values.firstWhere((modelType) => modelType.type == type);
}
