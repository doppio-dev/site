import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:doppio_dev_site/home/index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(UnHomeState()) {
    on<LoadHomeEvent>(_onLoadHomeEvent);
    on<UnHomeEvent>(_onUnHomeEvent);
  }

  Future<void> _onLoadHomeEvent(LoadHomeEvent event, Emitter<HomeState> emit) async {
    try {
      await for (final state in event.applyAsync(currentState: state, bloc: this)) {
        emit(state);
      }
    } catch (e, stackTrace) {
      developer.log('$e', name: 'LoadHomeEvent', error: e, stackTrace: stackTrace);
      emit(state);
    }
  }

  Future<void> _onUnHomeEvent(UnHomeEvent event, Emitter<HomeState> emit) async {
    try {
      await for (final state in event.applyAsync(currentState: state, bloc: this)) {
        emit(state);
      }
    } catch (e, stackTrace) {
      developer.log('$e', name: 'UnHomeEvent', error: e, stackTrace: stackTrace);
      emit(state);
    }
  }
}
