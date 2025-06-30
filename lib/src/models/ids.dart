import 'package:easywear_models/easywear_models.dart';

typedef Id = String;
typedef ModelId<T extends Model<T>> = Id;
typedef UserId = ModelId<User>;
typedef CodeId = ModelId<Code>;
typedef DepartmentId = ModelId<Department>;
typedef DomainId = ModelId<Domain>;
typedef LocationId = ModelId<Location>;
typedef RequestId = ModelId<Request>;
typedef WorkwearId = ModelId<Workwear>;
typedef ArticleId = Id;
typedef ImageId = Id;
typedef StarterKitId = Id;
