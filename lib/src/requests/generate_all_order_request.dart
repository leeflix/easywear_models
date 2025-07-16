import 'package:easywear_models/easywear_models.dart';

class GenerateAllOrderRequest {
  final FileType fileType;
  final String? userId;
  final RequestStatus? status;
  final Language language;
  final String? customSupplier;

  GenerateAllOrderRequest({
    required this.fileType,
    required this.userId,
    required this.status,
    required this.language,
    required this.customSupplier,
  });

  Map<String, dynamic> toJson() => {
    "fileType": fileType.string,
    "userId": userId,
    "status": status?.string,
    "language": language.string,
    "customSupplier": customSupplier,
  };
}
