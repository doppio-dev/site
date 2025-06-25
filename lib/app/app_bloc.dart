import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:doppio_dev_site/app/index.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  static final _appBlocSingleton = AppBloc._internal();
  factory AppBloc() {
    return _appBlocSingleton;
  }
  AppBloc._internal() : super(UnAppState()) {
    on<LoadAppEvent>(_onLoadAppEvent);
    on<ChangeThemeAppEvent>(_onChangeThemeAppEvent);
    on<ChangeLocaleAppEvent>(_onChangeLocaleAppEvent);
    on<UnAppEvent>(_onUnAppEvent);
  }

  @override
  Future<void> close() async {
    // dispose objects
    await _appBlocSingleton.close();
    await super.close();
  }

  Future<void> _onLoadAppEvent(LoadAppEvent event, Emitter<AppState> emit) async {
    try {
      await for (final state in event.applyAsync(currentState: state, bloc: this)) {
        emit(state);
      }
    } catch (e, stackTrace) {
      developer.log('$e', name: 'LoadAppEvent', error: e, stackTrace: stackTrace);
      emit(state);
    }
  }

  Future<void> _onChangeThemeAppEvent(ChangeThemeAppEvent event, Emitter<AppState> emit) async {
    try {
      await for (final state in event.applyAsync(currentState: state, bloc: this)) {
        emit(state);
      }
    } catch (e, stackTrace) {
      developer.log('$e', name: 'ChangeThemeAppEvent', error: e, stackTrace: stackTrace);
      emit(state);
    }
  }

  Future<void> _onChangeLocaleAppEvent(ChangeLocaleAppEvent event, Emitter<AppState> emit) async {
    try {
      await for (final state in event.applyAsync(currentState: state, bloc: this)) {
        emit(state);
      }
    } catch (e, stackTrace) {
      developer.log('$e', name: 'ChangeLocaleAppEvent', error: e, stackTrace: stackTrace);
      emit(state);
    }
  }

  Future<void> _onUnAppEvent(UnAppEvent event, Emitter<AppState> emit) async {
    try {
      await for (final state in event.applyAsync(currentState: state, bloc: this)) {
        emit(state);
      }
    } catch (e, stackTrace) {
      developer.log('$e', name: 'UnAppEvent', error: e, stackTrace: stackTrace);
      emit(state);
    }
  }
}
