import 'package:flutter/material.dart';

extension GenericExtension<T> on T {
  MaterialStateProperty<T> get materialStateProperty =>
      MaterialStateProperty.all(this);
}

extension Pipe<T> on T {
  R pipe<R>(R Function(T) transform) => transform(this);
}
