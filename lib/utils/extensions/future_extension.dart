import 'package:flutter/cupertino.dart';
import 'package:noto_app/utils/log.dart';
import 'package:noto_app/utils/type_defenitions.dart';

extension FutureExtension<T> on Future<T> {
  FutureBuilder<T> builder({
    required OnDataWidgetBuilder<T> onData,
    WidgetBuilder? onNoData,
    OnErrorWidgetBuilder? onError,
    WidgetBuilder? onLoading,
    T? initialData,
  }) {
    return FutureBuilder(
      future: this,
      initialData: initialData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // ignore: null_check_on_nullable_type_parameter
          return onData(context, snapshot.data!);
        } else if (snapshot.hasData == false &&
            snapshot.connectionState != ConnectionState.done) {
          if (onLoading != null) {
            return onLoading(context);
          } else {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
        } else if (snapshot.hasError) {
          if (onError != null) {
            return onError(context, snapshot.error);
          } else {
            final tag = "FutureExtension<${T.toString()}>.builder";
            log.e(tag, snapshot.error);

            return ErrorWidget("$tag: ${snapshot.error!}\n$StackTrace.current");
          }
        } else {
          if (onNoData != null) {
            return onNoData(context);
          } else {
            return Container();
          }
        }
      },
    );
  }

  FutureBuilder<T> builderNoLoading({
    required Widget Function(BuildContext context, T data) onData,
    WidgetBuilder? onNoData,
    Widget Function(BuildContext context, dynamic error)? onError,
    Widget Function(BuildContext context)? onLoading,
    T? initialData,
  }) {
    return builder(
      initialData: initialData,
      onData: onData,
      onNoData: onNoData,
      onError: onError,
      onLoading: (context) {
        if (onLoading != null) {
          return onLoading(context);
        } else {
          return Container();
        }
      },
    );
  }
}
