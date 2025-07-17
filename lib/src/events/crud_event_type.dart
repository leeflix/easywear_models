import 'package:easywear_models/easywear_models.dart';

enum CrudEventType {
  create,
  update,
  delete;

  static CrudEventType fromString(String s) => CrudEventType.values.firstWhere((e) => e.string == s);

}