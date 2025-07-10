import 'package:easywear_models/easywear_models.dart';

class Brand extends Model<Brand> {
  final String name;
  final ImageId logoImageId;

  Brand({
    required super.domainId,
    Id<Brand>? id,
    DateTime? created,
    DateTime? updated,
    bool? isArchived,
    required this.name,
    required this.logoImageId,
  }) : super(
          id: id,
          created: created,
          updated: updated,
          isArchived: isArchived,
        );

  Brand.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        logoImageId = json["logoImageId"],
        super(
          domainId: json["domainId"],
          id: json["id"],
          created: DateTime.parse(json["created"]),
          updated: DateTime.parse(json["updated"]),
          isArchived: json["isArchived"],
        );

  @override
  Brand fromJson(Map<String, dynamic> json) => Brand.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        "name": name,
        "logoImageId": logoImageId,
        ...super.toJson(),
      };
}
