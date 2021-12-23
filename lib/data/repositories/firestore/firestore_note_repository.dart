import 'package:injectable/injectable.dart';
import 'package:noto_app/base/repositories/firestore_path.dart';
import 'package:noto_app/base/repositories/firestore_repository.dart';
import 'package:noto_app/data/models/note.dart';
import 'package:noto_app/data/serializers/serializers.dart';

@injectable
class FirestoreNoteRepository extends FirestoreRepository<Note> {
  @override
  FirestorePath get path => FirestorePath(
        folderPath: "/userData",
        collectionName: "notes",
      );
}
