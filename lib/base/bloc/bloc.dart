import 'package:built_rx_bloc/built_rx_bloc.dart';
import 'package:built_value/built_value.dart';
import 'package:noto_app/utils/log.dart';

abstract class Bloc<TState extends Built<TState, TStateBuilder>,
        TStateBuilder extends Builder<TState, TStateBuilder>>
    extends BuiltRxBloc<TState, TStateBuilder> {
  Bloc(TState initialState) : super(initialState) {
    log.d("constructor");
  }

  @override
  void addState(TState state) {
    if (debug) log.d("$stateTag.addState\nstate: $state");

    super.addState(state);
  }

  @override
  void updateState(Function(TStateBuilder b) updates) {
    if (debug) {
      log.d("$stateTag.updateState\npreviousState: $state");
    }

    super.updateState(updates);
  }
}
