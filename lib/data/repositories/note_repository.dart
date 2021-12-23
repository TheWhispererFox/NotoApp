import 'package:built_collection/built_collection.dart';
import 'package:injectable/injectable.dart';
import 'package:noto_app/base/repositories/firestore_path.dart';
import 'package:noto_app/base/repositories/firestore_repository.dart';
import 'package:noto_app/base/repositories/repository.dart';
import 'package:noto_app/data/models/note.dart';

@injectable
class NoteRepository extends Repository<Note> {
  final List<Note> _notes = [
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
  ];

  @override
  BuiltList<Note> get data => _notes.toBuiltList();

  // @override
  // FirestorePath get path => FirestorePath(
  //       folderPath: "/userData",
  //       collectionName: "notes",
  //     );

  @override
  Stream<BuiltList<Note>> get stream => Stream.value(data).asBroadcastStream();

  @override
  void add(Note model) => _notes.add(model);
  @override
  void update(Note model) {
    final previousModel = _notes.firstWhere((it) => it.id == model.id);
    remove(previousModel);
    add(model);
  }

  @override
  void remove(Note model) => _notes.remove(model);
}
