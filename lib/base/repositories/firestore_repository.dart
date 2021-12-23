import 'package:noto_app/base/repositories/firestore_path.dart';
import 'package:noto_app/base/repositories/repository.dart';
import 'package:noto_app/base/types/entity.dart';

abstract class FirestoreRepository<T extends Entity> extends Repository<T> {
  FirestorePath get path;
}
