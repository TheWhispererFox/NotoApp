import 'package:built_collection/built_collection.dart';
import 'package:injectable/injectable.dart';
import 'package:noto_app/base/repositories/firestore_path.dart';
import 'package:noto_app/base/repositories/firestore_repository.dart';
import 'package:noto_app/data/models/note.dart';

@injectable
class NoteRepository extends FirestoreRepository<Note> {
  @override
  BuiltList<Note> get data => [
        Note(
          title: 'Quote abobus',
          content:
              '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr.',
        ),
        Note(
          title: 'Quote Today',
          content:
              '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr. \n A Loooooooooooooooooooooooooooooooooooooooooong cat',
        ),
        Note(
          title: 'Quote Today',
          content:
              '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr. \n A very Loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong cat',
        ),
        Note(
          title: 'Quote Today',
          content:
              '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr.',
        ),
        Note(
          title: 'Quote Today',
          content:
              '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr.',
        ),
        Note(
          title: 'Quote Today',
          content:
              '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr.',
        ),
        Note(
          title: 'Quote Today',
          content:
              '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr.',
        ),
        Note(
          title: 'Quote Today',
          content:
              '"The best preparation for tomorrow is doing your best today." \n - H. Jackson Brown, Jr.',
        ),
      ].toBuiltList();

  @override
  FirestorePath get path => FirestorePath(
        folderPath: "/userData",
        collectionName: "notes",
      );

  @override
  Stream<BuiltList<Note>> get stream => Stream.value(data);
}
