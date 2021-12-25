import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noto_app/base/repositories/firestore_path.dart';
import 'package:noto_app/base/repositories/repository.dart';
import 'package:noto_app/base/types/entity.dart';
import 'package:noto_app/data/serializers/serializers.dart';
import 'package:noto_app/utils/extensions/date_extensions.dart';
import 'package:noto_app/utils/log.dart';

abstract class FirestoreRepository<T extends Entity> extends Repository<T> {
  final _firestore = FirebaseFirestore.instance;

  @override
  void add(T model) {
    final doc = collectionRef.doc(model.id);
    final batch = _firestore.batch();

    batch.set(doc, serializers.serialize(model));

    batch.set(
      doc,
      {
        "deletedAt": null,
      },
      SetOptions(merge: true),
    );

    batch.commit();
  }

  @override
  // TODO: implement data
  BuiltList<T> get data => throw UnimplementedError();

  @override
  void delete(
    T model, {
    bool deleteCompleteley = false,
  }) {
    if (deleteCompleteley) {
      collectionRef.doc(model.id).delete();
    } else {
      collectionRef.doc(model.id).set(
            model.rebuild(
              (b) => b..deletedAt = nowUtc(),
            ),
          );
    }
  }

  @override
  void dispose() {}

  @override
  Stream<BuiltList<T>> get stream => _deserialize(
        collectionRef.where("deletedAt", isNull: true).snapshots(),
      );

  @override
  void update(T model) {
    collectionRef.doc(model.id).set(
          serializers.serialize(
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
          (e) {
            try {
              return deserialize<T>(e);
            } catch (e) {
              log.e(e);
            }
          },
        ),
      )
      .map((event) => event.whereType<T>().toBuiltList());
}
