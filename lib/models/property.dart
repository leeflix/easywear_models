import 'dart:convert';

class Property {
  final String name;
  final List<String> options;
  final bool isSize;

  Property({
    required this.name,
    required this.options,
    required this.isSize,
  });

  Property.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        options = json["options"].cast<String>(),
        isSize = json["isSize"];

  Map<String, dynamic> toJson() => {
        "name": name,
        "options": options,
        "isSize": isSize,
      };

  @override
  String toString() => jsonEncode(this);
}
