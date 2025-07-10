import 'package:easywear_models/easywear_models.dart';

enum ViewMode {
  user,
  admin,
  supplier;

  static ViewMode fromString(String s) =>
      ViewMode.values.firstWhere((v) => v.string == s);
}
