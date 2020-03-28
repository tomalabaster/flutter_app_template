import 'package:flutter_app_template/blocs/base_bloc.dart';
import 'package:flutter_app_template/blocs/master_screen_bloc/master_screen_event.dart';
import 'package:flutter_app_template/blocs/master_screen_bloc/master_screen_state.dart';

class MasterScreenBloc extends BaseBloc<MasterScreenEvent, MasterScreenState> {
  int _currentTabIndex;

  @override
  MasterScreenState get initialState {
    this._currentTabIndex = 0;

    return this.fullState;
  }

  @override
  Stream<MasterScreenState> mapEventToState(MasterScreenEvent event) async* {
    if (event is MasterScreenEventSwitchTab) {
      this._currentTabIndex = event.tabIndex;

      yield this.fullState;
    }
  }

  @override
  MasterScreenState get fullState =>
      MasterScreenState(currentTabIndex: this._currentTabIndex);
}
