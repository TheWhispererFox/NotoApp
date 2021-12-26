import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';
import 'package:noto_app/base/bloc/bloc.dart';
import 'package:test/test.dart' as tester;

@isTest
void blocStateTest<
        TBloc extends Bloc<TState, TStateBuilder>,
        TState extends Built<TState, TStateBuilder>,
        TStateBuilder extends Builder<TState, TStateBuilder>>(
  String message, {
  required Future<TBloc> Function() build,
  required bool Function(TState state) expect,
  Future<void> Function(TBloc bloc)? event,
  Duration? wait,
  int skip = 1,
}) =>
    tester.test(message, () async {
      final bloc = await build();
      final state = await bloc.stateStream.skip(skip).last;

      tester.expect(true, expect(state));

      if (wait != null) await Future<void>.delayed(wait);

      await event?.call(bloc);
    });
