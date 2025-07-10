import 'package:easywear_models/easywear_models.dart';

enum Gender {
  women,
  men,
  diverse;

  static Gender fromString(String s) => Gender.values.firstWhere((gender) => gender.string == s);
}
