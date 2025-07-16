import 'package:easywear_models/easywear_models.dart';

class GenerateOrderListRequest {
  final FileType fileType;
  final String? userId;
  final RequestStatus? status;
  final Language language;
  final String? customSupplier;

  GenerateOrderListRequest({
    required this.fileType,
    required this.userId,
    required this.status,
    required this.language,
    required this.customSupplier,
  });
}