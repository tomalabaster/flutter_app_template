import 'dart:async';

import 'package:flutter_app_template/blocs/app_bloc/app_event.dart';
import 'package:flutter_app_template/blocs/app_bloc/app_state.dart';
import 'package:flutter_app_template/blocs/base_bloc.dart';

class AppBloc extends BaseBloc<AppEvent, AppState> {
  @override
  AppState get initialState {
    return this.buildState;
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {}

  @override
  AppState get buildState => AppState();
}
