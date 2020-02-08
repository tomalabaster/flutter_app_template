import 'package:flutter_app_template/blocs/base_bloc.dart';
import 'package:flutter_app_template/blocs/master_screen_bloc/master_screen_event.dart';
import 'package:flutter_app_template/blocs/master_screen_bloc/master_screen_state.dart';

class MasterScreenBloc extends BaseBloc<MasterScreenEvent, MasterScreenState> {
  int _currentTabIndex;
  int _currentSubTabIndex;

  @override
  MasterScreenState get initialState {
    this._currentTabIndex = 0;
    this._currentSubTabIndex = 0;

    return this.buildState;
  }

  @override
  Stream<MasterScreenState> mapEventToState(MasterScreenEvent event) async* {
    if (event is MasterScreenEventSwitchTab) {
      this._currentTabIndex = event.tabIndex;
      this._currentSubTabIndex = event.subTabIndex ?? this._currentSubTabIndex;

      yield this.buildState;
    }
  }

  @override
  MasterScreenState get buildState => MasterScreenState(
      currentTabIndex: this._currentTabIndex,
      currentSubTabIndex: this._currentSubTabIndex);
}
