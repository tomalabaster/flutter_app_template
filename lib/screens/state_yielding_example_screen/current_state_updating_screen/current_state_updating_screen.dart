import 'package:flutter/material.dart';
import 'package:flutter_app_template/blocs/state_yielding_example_blocs/current_state_updating_screen_bloc/current_state_yielding_screen_bloc.dart';
import 'package:flutter_app_template/blocs/state_yielding_example_blocs/current_state_updating_screen_bloc/current_state_yielding_screen_event.dart';
import 'package:flutter_app_template/blocs/state_yielding_example_blocs/current_state_updating_screen_bloc/current_state_yielding_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentStateYieldingScreen extends StatefulWidget {
  @override
  _CurrentStateYieldingScreenState createState() =>
      _CurrentStateYieldingScreenState();
}

class _CurrentStateYieldingScreenState
    extends State<CurrentStateYieldingScreen> {
  CurrentStateYieldingScreenBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (this._bloc == null) {
      this._bloc = CurrentStateYieldingScreenBloc();
    }
  }

  @override
  void dispose() {
    _bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => this._bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Full State Yielding'),
        ),
        body: BlocBuilder(
          bloc: this._bloc,
          builder: (context, state) {
            return Column(
              children: [
                Text('Property 1: ${state.property1}'),
                Text('Property 2: ${state.property2}'),
                Text('Property 3: ${state.property3}'),
                RaisedButton(
                  child: Text('Increment property 1'),
                  onPressed: () => this._bloc.add(
                        CurrentStateYieldingScreenEventIncrementProperty1(),
                      ),
                ),
                RaisedButton(
                  child: Text('Increment property 2'),
                  onPressed: () => this._bloc.add(
                        CurrentStateYieldingScreenEventIncrementProperty2(),
                      ),
                ),
                RaisedButton(
                  child: Text('Increment property 3'),
                  onPressed: () => this._bloc.add(
                        CurrentStateYieldingScreenEventIncrementProperty3(),
                      ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
