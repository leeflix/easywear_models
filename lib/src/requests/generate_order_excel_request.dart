import 'package:easywear_models/easywear_models.dart';

class GenerateOrderExcelRequest {
  final FileType fileType;
  final Id<Request> orderId;
  final Language language;

  GenerateOrderExcelRequest({
    required this.fileType,
    required this.orderId,
    required this.language,
  });
}