import 'package:easywear_models/easywear_models.dart';

class FileRequest {
  final TransferMethod transferMethod;
  final String? email;
  final Language language;
  final EasyWearFile file;
  final String? reason;
  final String? phone;
  final String? firstName;
  final String? lastName;
  final String? companyName;

  FileRequest({
    required this.transferMethod,
    required this.email,
    required this.language,
    required this.file,
    required this.reason,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.companyName,
  });
}

enum TransferMethod {
  download,
  email,
}

extension TransferMethodE on TransferMethod {
  static TransferMethod fromString(String fileType) => TransferMethod.values.firstWhere((e) => e.string == fileType);

  String get string => toString().split(".").last;
}