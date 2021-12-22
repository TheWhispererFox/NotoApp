import 'package:built_collection/built_collection.dart';
import 'package:injectable/injectable.dart';
import 'package:noto_app/base/repositories/firestore_path.dart';
import 'package:noto_app/base/repositories/firestore_repository.dart';
import 'package:noto_app/data/models/note.dart';

@injectable
class NoteRepository extends FirestoreRepository<Note> {
  @override
  // TODO: implement data
  BuiltList<Note> get data => throw UnimplementedError();

  @override
  // TODO: implement path
  FirestorePath get path => throw UnimplementedError();

  @override
  // TODO: implement stream
  Stream<BuiltList<Note>> get stream => throw UnimplementedError();
}
