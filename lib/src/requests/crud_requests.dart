import 'package:easywear_models/easywear_models.dart';

class CreateRecordRequest<T extends Model<T>> {
  final T record;

  CreateRecordRequest({required this.record});
}

class ReadRecordRequest<T extends Model<T>> {
  final Id<T> id;

  ReadRecordRequest({required this.id});
}

class UpdateRecordRequest<T extends Model<T>> {
  final T record;

  UpdateRecordRequest({required this.record});
}

class DeleteRecordRequest<T extends Model<T>> {
  final Id<T> id;

  DeleteRecordRequest({required this.id});
}

class UpdateRecordsRequest<T extends Model<T>> {
  final Set<T> records;

  UpdateRecordsRequest({required this.records});
}
