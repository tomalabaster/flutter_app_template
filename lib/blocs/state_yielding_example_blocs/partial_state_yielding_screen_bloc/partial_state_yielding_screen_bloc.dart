import 'package:flutter_app_template/blocs/base_bloc.dart';
import 'package:flutter_app_template/blocs/state_yielding_example_blocs/partial_state_yielding_screen_bloc/partial_state_yielding_screen_event.dart';
import 'package:flutter_app_template/blocs/state_yielding_example_blocs/partial_state_yielding_screen_bloc/partial_state_yielding_screen_state.dart';

class PartialStateYieldingScreenBloc extends BaseBloc<
    PartialStateYieldingScreenEvent, PartialStateYieldingScreenState> {
  int _property1;
  int _property2;
  int _property3;

  @override
  PartialStateYieldingScreenState get initialState {
    this._property1 = 0;
    this._property2 = 0;
    this._property3 = 0;

    return this.fullState;
  }

  @override
  Stream<PartialStateYieldingScreenState> mapEventToState(
      PartialStateYieldingScreenEvent event) async* {
    if (event is PartialStateYieldingScreenEventIncrementProperty1) {
      this._property1++;
      yield PartialStateYieldingScreenState(property1: this._property1);
    }

    if (event is PartialStateYieldingScreenEventIncrementProperty2) {
      this._property2++;
      yield PartialStateYieldingScreenState(property2: this._property2);
    }

    if (event is PartialStateYieldingScreenEventIncrementProperty3) {
      this._property3++;
      yield PartialStateYieldingScreenState(property3: this._property3);
    }
  }

  @override
  PartialStateYieldingScreenState get fullState =>
      PartialStateYieldingScreenState(
          property1: this._property1,
          property2: this._property2,
          property3: this._property3);
}
