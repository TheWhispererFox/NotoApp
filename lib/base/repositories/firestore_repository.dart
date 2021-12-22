import 'package:noto_app/base/repositories/firestore_path.dart';
import 'package:noto_app/base/repositories/repository.dart';

abstract class FirestoreRepository<T> extends Repository<T> {
  FirestorePath get path;
}
