import 'package:easywear_models/easywear_models.dart';

class GenerateCostReportRequest {
  final FileType fileType;
  final Set<Id<Workwear>>? workwearIds;
  final Set<Id<Department>>? departmentIds;
  final DateTime? from;
  final DateTime? to;
  final Set<RequestType>? requestTypes;
  final bool? userPays;
  final Language language;

  GenerateCostReportRequest({
    required this.language,
    required this.fileType,
    required this.requestTypes,
    required this.workwearIds,
    required this.departmentIds,
    required this.from,
    required this.to,
    required this.userPays,
  });
}