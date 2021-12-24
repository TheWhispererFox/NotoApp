import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:noto_app/utils/extensions/extensions.dart';
import 'package:noto_app/utils/log.dart';
import 'package:rxdart/rxdart.dart';

abstract class Bloc<TState extends Built<TState, TStateBuilder>,
    TStateBuilder extends Builder<TState, TStateBuilder>> {
  Bloc(this._initialState, {this.debug = false}) {
    addState(_initialState);

    init();
  }

  final bool debug;
  final stateTag = (TState).toString().toSnakecase();

  final TState _initialState;
  final _stateSubject = BehaviorSubject<TState>();
  final _subscriptions = CompositeSubscription();

  Stream<TState> get stateStream => _stateSubject.stream;

  TState get state => _stateSubject.value;

  CompositeSubscription get subscriptions => _subscriptions;

  TState get initialState => _initialState;

  Future<void> init() {
    return Future.value();
  }

  void dispose() {
    _stateSubject.close();
    _subscriptions.dispose();
  }

  void addState(TState state) {
    if (!_stateSubject.isClosed) {
      _stateSubject.add(state);
    }

    if (debug) log.d("$stateTag : addState", state);
  }

  void updateState(Function(TStateBuilder b) updates) {
    if (debug) {
      log.d(stateTag, "updateState");
      log.d("$stateTag : previousState", state);
    }

    addState(state.rebuild(updates));
    if (debug) {
      log.d("$stateTag : newState", state);
    }
  }

  StreamSubscription addSubscription(StreamSubscription streamSubscription) {
    return _subscriptions.add(streamSubscription);
  }
}
