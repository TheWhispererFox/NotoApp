import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:noto_app/base/bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/test.dart' as tester;
import 'package:test/test.dart';

@isTest
void blocTest<
        TBloc extends Bloc<TState, TStateBuilder>,
        TState extends Built<TState, TStateBuilder>,
        TStateBuilder extends Builder<TState, TStateBuilder>>(
  String message, {
  required Future<TBloc> Function() build,
  required List<bool Function(TState state)> statePredicates,
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

        final stateStream = bloc.stateStream.skip(skip);

        stateStream
            .zipWith<bool Function(TState state), Tuple2<TState, Matcher>>(
          Stream.fromIterable(statePredicates),
          (s, p) => Tuple2(s, tester.predicate(p)),
        )
            .listen((t) {
          tester.expect(t.value1, t.value2);
        });

        await event?.call(bloc);
      },
      timeout: timeout,
    );
