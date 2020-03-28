import 'package:flutter_app_template/blocs/base_bloc.dart';
import 'package:flutter_app_template/blocs/state_yielding_example_blocs/current_state_updating_screen_bloc/current_state_yielding_screen_event.dart';
import 'package:flutter_app_template/blocs/state_yielding_example_blocs/current_state_updating_screen_bloc/current_state_yielding_screen_state.dart';

class CurrentStateYieldingScreenBloc extends BaseBloc<
    CurrentStateYieldingScreenEvent, CurrentStateYieldingScreenState> {
  @override
  CurrentStateYieldingScreenState get initialState =>
      CurrentStateYieldingScreenState(property1: 0, property2: 0, property3: 0);

  @override
  Stream<CurrentStateYieldingScreenState> mapEventToState(
      CurrentStateYieldingScreenEvent event) async* {
    if (event is CurrentStateYieldingScreenEventIncrementProperty1) {
      this.state.property1++;
      yield this.state;
    }

    if (event is CurrentStateYieldingScreenEventIncrementProperty2) {
      this.state.property2++;
      yield this.state;
    }

    if (event is CurrentStateYieldingScreenEventIncrementProperty3) {
      this.state.property3++;
      yield this.state;
    }
  }

  @override
  CurrentStateYieldingScreenState get fullState => null;
}
