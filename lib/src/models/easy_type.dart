import 'package:easywear_models/easywear_models.dart';

enum EasyType {
  wear,
  it;

  static EasyType fromString(String s) => EasyType.values.firstWhere((v) => v.string == s);
}
