import 'package:easywear_models/easywear_models.dart';

class MinMax extends DataClass<MinMax> {
  int min;
  int max;

  MinMax({
    required this.min,
    required this.max,
  });

  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
      };

  MinMax.fromJson(Map<String, dynamic> json)
      : min = json["min"],
        max = json["max"];

  @override
  MinMax fromJson(Map<String, dynamic> json) => MinMax.fromJson(json);

  bool isValid() => min >= 0 && max >= min;

  bool intersects(MinMax other) => (min <= other.max && max >= other.min);
}
