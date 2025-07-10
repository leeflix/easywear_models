import 'package:easywear_models/easywear_models.dart';

enum RemoteAreaType {
  ground,
  sea,
  air;

  static RemoteAreaType fromString(String s) => RemoteAreaType.values.firstWhere((v) => v.string == s);
}
