import 'package:built_collection/built_collection.dart';

extension BuiltListExtension<T> on BuiltList<T> {
  Iterable<R> mapIndexed<R>(R Function(int index, T element) convert) sync* {
    var index = 0;
    for (final element in toList()) {
      yield convert(index++, element);
    }
  }
}
