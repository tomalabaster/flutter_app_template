import 'package:flutter_app_template/blocs/base_bloc.dart';
import 'package:flutter_app_template/blocs/state_yielding_example_blocs/full_state_yielding_screen_bloc/full_state_yielding_screen_event.dart';
import 'package:flutter_app_template/blocs/state_yielding_example_blocs/full_state_yielding_screen_bloc/full_state_yielding_screen_state.dart';

class FullStateYieldingScreenBloc extends BaseBloc<FullStateYieldingScreenEvent,
    FullStateYieldingScreenState> {
  int _property1;
  int _property2;
  int _property3;

  @override
  FullStateYieldingScreenState get initialState {
    this._property1 = 0;
    this._property2 = 0;
    this._property3 = 0;

    return this.fullState;
  }

  @override
  Stream<FullStateYieldingScreenState> mapEventToState(
      FullStateYieldingScreenEvent event) async* {
    if (event is FullStateYieldingScreenEventIncrementProperty1) {
      this._property1++;
      yield this.fullState;
    }

    if (event is FullStateYieldingScreenEventIncrementProperty2) {
      this._property2++;
      yield this.fullState;
    }

    if (event is FullStateYieldingScreenEventIncrementProperty3) {
      this._property3++;
      yield this.fullState;
    }
  }

  @override
  FullStateYieldingScreenState get fullState => FullStateYieldingScreenState(
      property1: this._property1,
      property2: this._property2,
      property3: this._property3);
}
