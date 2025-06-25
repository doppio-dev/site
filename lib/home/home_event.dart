import 'dart:async';
import 'dart:developer' as developer;

import 'package:doppio_dev_site/home/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent {
  Stream<HomeState> applyAsync({HomeState currentState, HomeBloc bloc});
}

class UnHomeEvent extends HomeEvent {
  @override
  Stream<HomeState> applyAsync({HomeState? currentState, HomeBloc? bloc}) async* {
    yield UnHomeState();
  }
}

class LoadHomeEvent extends HomeEvent {
  @override
  Stream<HomeState> applyAsync({HomeState? currentState, HomeBloc? bloc}) async* {
    try {
      yield UnHomeState();
      yield InHomeState('Hello world');
    } catch (e, stackTrace) {
      developer.log('$e', name: 'LoadHomeEvent', error: e, stackTrace: stackTrace);
      yield ErrorHomeState(e.toString());
    }
  }
}
