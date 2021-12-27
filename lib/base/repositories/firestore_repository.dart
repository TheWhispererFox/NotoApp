import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noto_app/base/repositories/firestore_path.dart';
import 'package:noto_app/base/repositories/repository.dart';
import 'package:noto_app/base/types/entity.dart';
import 'package:noto_app/data/serializers/serializers.dart';
import 'package:noto_app/utils/extensions/date_extensions.dart';

abstract class FirestoreRepository<T extends Entity> extends Repository<T> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<String> add(T model) {
    final doc = collectionRef.doc(model.id);
    final batch = _firestore.batch();

    batch.set(doc, serialize(model));

    batch.set(
      doc,
      {
        "deletedAt": null,
      },
      SetOptions(merge: true),
    );

    return batch.commit().then((_) => doc.id);
  }

  @override
  Future<void> addOrUpdate(T model) async {
    final doc = await collectionRef.where("id", isEqualTo: model.id).get();

    if (doc.size == 0) {
      add(model);
    } else {
      update(model);
    }
  }

  @override
  Future<BuiltList<T>> get data => stream.last;

  @override
  Future<void> delete(
    T model, {
    bool deleteCompleteley = false,
  }) {
    if (deleteCompleteley) {
      return collectionRef.doc(model.id).delete();
    } else {
      return collectionRef.doc(model.id).set(
            serialize(
              model.rebuild(
                (b) => b..deletedAt = nowUtc(),
              ),
            ),
            SetOptions(merge: true),
          );
    }
  }

  @override
  void dispose() {}

  @override
  Future<T?> get(String id) =>
      collectionRef.doc(id).get().then((value) => deserialize<T>(value.data()));

  @override
  Stream<T?> getStream(String id) => collectionRef
      .doc(id)
      .snapshots()
      .map((event) => deserialize<T>(event.data()));

  @override
  Stream<BuiltList<T>> get stream => _deserialize(
        collectionRef.where("deletedAt", isNull: true).snapshots(),
      );

  @override
  Future<void> update(T model) {
    return collectionRef.doc(model.id).set(
          serialize(
            model.rebuild(
              (b) => b..updatedAt = nowUtc(),
            ),
          ),
          SetOptions(merge: true),
        );
  }

  FirestorePath get path;

  CollectionReference get collectionRef => _firestore.collection(path.fullPath);

  Stream<BuiltList<T>> get streamDeleted => _deserialize(
        collectionRef.where("deletedAt", isNull: false).snapshots(),
      );

  Stream<BuiltList<T>> _deserialize(Stream<QuerySnapshot<Object?>> data) => data
      .map((it) => it.docs)
      .map((it) => it.map((e) => e.data()))
      .map(
        (it) => it.map(
          (e) => deserialize<T>(e),
        ),
      )
      .map((event) => event.whereType<T>().toBuiltList());
}
