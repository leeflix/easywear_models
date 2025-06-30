import 'package:easywear_models/easywear_models.dart';

// typedef Id = String;
// typedef ModelId<T extends Model<T>> = Id;
// typedef UserId = ModelId<User>;
// typedef CodeId = ModelId<Code>;
// typedef DepartmentId = ModelId<Department>;
// typedef DomainId = ModelId<Domain>;
// // typedef LocationId = ModelId<Location>;
// typedef RequestId = ModelId<Request>;
// typedef WorkwearId = ModelId<Workwear>;
// typedef ArticleId = Id;
// typedef ImageId = Id;
// typedef StarterKitId = Id;

extension type Id(String value) {}
extension type ModelId<T extends Model<T>>(String value) implements Id {}
extension type RequestId(String value) implements ModelId<Request> {}

// extension type OrderId(String value) implements ModelId<Request> {}
// extension type ClaimId(String value) implements ModelId<Request> {}
// extension type CorrectionId(String value) implements ModelId<Request> {}

extension type UserId(String value) implements ModelId<User> {}
extension type CodeId(String value) implements ModelId<Code> {}
extension type DepartmentId(String value) implements ModelId<Department> {}
extension type DomainId(String value) implements ModelId<Domain> {}
extension type LocationId(String value) implements ModelId<Location> {}

extension type WorkwearId(String value) implements ModelId<Workwear> {}
extension type ArticleId(String value) implements Id {}
extension type ImageId(String value) implements Id {}
extension type StarterKitId(String value) implements Id {}
