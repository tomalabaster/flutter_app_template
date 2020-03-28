import 'package:flutter/material.dart';
import 'package:flutter_app_template/blocs/state_yielding_example_blocs/full_state_yielding_screen_bloc/full_state_yielding_screen_bloc.dart';
import 'package:flutter_app_template/blocs/state_yielding_example_blocs/full_state_yielding_screen_bloc/full_state_yielding_screen_event.dart';
import 'package:flutter_app_template/blocs/state_yielding_example_blocs/full_state_yielding_screen_bloc/full_state_yielding_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FullStateYieldingScreen extends StatefulWidget {
  @override
  _FullStateYieldingScreenState createState() =>
      _FullStateYieldingScreenState();
}

class _FullStateYieldingScreenState extends State<FullStateYieldingScreen> {
  FullStateYieldingScreenBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (this._bloc == null) {
      this._bloc = FullStateYieldingScreenBloc();
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
        body: BlocBuilder<FullStateYieldingScreenBloc,
            FullStateYieldingScreenState>(
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
                        FullStateYieldingScreenEventIncrementProperty1(),
                      ),
                ),
                RaisedButton(
                  child: Text('Increment property 2'),
                  onPressed: () => this._bloc.add(
                        FullStateYieldingScreenEventIncrementProperty2(),
                      ),
                ),
                RaisedButton(
                  child: Text('Increment property 3'),
                  onPressed: () => this._bloc.add(
                        FullStateYieldingScreenEventIncrementProperty3(),
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
