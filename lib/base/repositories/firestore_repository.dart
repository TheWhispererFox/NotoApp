import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noto_app/base/repositories/firestore_path.dart';
import 'package:noto_app/base/repositories/repository.dart';
import 'package:noto_app/base/types/entity.dart';
import 'package:noto_app/data/serializers/serializers.dart';

abstract class FirestoreRepository<T extends Entity> extends Repository<T> {
  final _firestore = FirebaseFirestore.instance;

  FirestorePath get path;
  CollectionReference get collectionRef => _firestore.collection(path.fullPath);

  @override
  void dispose() {}

  @override
  void add(T model) {
    collectionRef.doc(model.id).set(serializers.serialize(model));
  }

  @override
  void update(T model) {
    collectionRef.doc(model.id).set(serializers.serialize(model));
  }

  @override
  void remove(T model) {
    collectionRef.doc(model.id).delete();
  }

  @override
  Stream<BuiltList<T>> get stream => collectionRef
      .snapshots()
      .map((it) => it.docs)
      .map((it) => it.map((e) => e.data()))
      .map((it) => it.map((e) => deserialize<T>(e)))
      .map((event) => event.whereType<T>().toBuiltList());

  @override
  // TODO: implement data
  BuiltList<T> get data => throw UnimplementedError();
}
