import 'package:flutter/material.dart';

typedef OnDataWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T data,
);

typedef OnErrorWidgetBuilder = Widget Function(
  BuildContext context,
  Object? error,
);
