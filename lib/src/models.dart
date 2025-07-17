import 'package:easywear_models/easywear_models.dart';

enum ModelType {
  domain,
  user,
  workwear,
  request,
  code,
  department,
  location,
  brand;

  Type get type => switch (this) {
        ModelType.domain => Domain,
        ModelType.user => User,
        ModelType.workwear => Workwear,
        ModelType.request => Request,
        ModelType.code => Code,
        ModelType.department => Department,
        ModelType.location => Location,
        ModelType.brand => Brand,
      };

  T fromJson<T extends Model<T>>(Map<String, dynamic> json) => switch (this) {
        ModelType.domain => Domain.fromJson(json) as T,
        ModelType.user => User.fromJson(json) as T,
        ModelType.workwear => Workwear.fromJson(json) as T,
        ModelType.request => Request.fromJson2(json) as T,
        ModelType.code => Code.fromJson(json) as T,
        ModelType.department => Department.fromJson(json) as T,
        ModelType.location => Location.fromJson(json) as T,
        ModelType.brand => Brand.fromJson(json) as T,
      };

  static ModelType fromString(String s) => ModelType.values.firstWhere((e) => e.string == s);

  String get className => string[0].toUpperCase() + string.substring(1).toLowerCase();

  String get urlPathName => "${string}s";

  String get collectionName => "${string}s";

  static ModelType fromType(Type type) => ModelType.values.firstWhere((modelType) => modelType.type == type);
}
