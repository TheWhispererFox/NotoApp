import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';
import 'package:noto_app/base/bloc/bloc.dart';
import 'package:test/test.dart' as tester;

@isTest
void blocTest<
        TBloc extends Bloc<TState, TStateBuilder>,
        TState extends Built<TState, TStateBuilder>,
        TStateBuilder extends Builder<TState, TStateBuilder>>(
  String message, {
  required Future<TBloc> Function() build,
  required List<Future<bool> Function(TState state)> expect,
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

        // late StreamSubscription<TState> subscription;

        await event?.call(bloc);

        int stateCounter = 0;

        await for (final state in bloc.stateStream.skip(skip)) {
          if (stateCounter < expect.length) {
            tester.expect(
              await expect[stateCounter](state),
              tester.isTrue,
              reason:
                  "$state doesn't match to \"expect\" predicate №$stateCounter",
            );

            stateCounter++;
          }
        }

        // subscription = bloc.stateStream.skip(skip).listen((state) async {
        //   if (stateCounter < expect.length) {
        //     tester.expect(
        //       expect[stateCounter](state),
        //       tester.isTrue,
        //       reason: "$state doesn't match to \"expect\" predicate",
        //     );

        //     stateCounter++;
        //   }
        //   await subscription.cancel();
        // });
      },
      timeout: timeout,
    );
