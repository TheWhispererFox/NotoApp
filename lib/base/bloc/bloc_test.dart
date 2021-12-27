import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';
import 'package:noto_app/base/bloc/bloc.dart';
import 'package:test/test.dart' as tester;

// TODO: Добавить поддержку очередей стейтов expect iterable

@isTest
void blocTest<
        TBloc extends Bloc<TState, TStateBuilder>,
        TState extends Built<TState, TStateBuilder>,
        TStateBuilder extends Builder<TState, TStateBuilder>>(
  String message, {
  required Future<TBloc> Function() build,
  required bool Function(TState state) expect,
  Future<void> Function(TBloc bloc)? event,
  Duration? wait,
  int skip = 1,
  tester.Timeout? timeout,
}) =>
    tester.test(
      message,
      () async {
        final bloc = await build();

        if (wait != null) await Future<void>.delayed(wait);

        late StreamSubscription<TState> subscription;

        subscription = bloc.stateStream.skip(skip).listen((state) {
          tester.expect(
            expect(state),
            tester.isTrue,
            reason: "$state doesn't match to \"expect\" predicate",
          );

          subscription.cancel();
        });

        await event?.call(bloc);
      },
      timeout: timeout,
    );
