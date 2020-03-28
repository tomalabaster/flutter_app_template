import 'package:flutter/material.dart';
import 'package:flutter_app_template/blocs/state_yielding_example_blocs/partial_state_yielding_screen_bloc/partial_state_yielding_screen_bloc.dart';
import 'package:flutter_app_template/blocs/state_yielding_example_blocs/partial_state_yielding_screen_bloc/partial_state_yielding_screen_event.dart';
import 'package:flutter_app_template/blocs/state_yielding_example_blocs/partial_state_yielding_screen_bloc/partial_state_yielding_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PartialStateYieldingScreen extends StatefulWidget {
  @override
  _PartialStateYieldingScreenState createState() =>
      _PartialStateYieldingScreenState();
}

class _PartialStateYieldingScreenState
    extends State<PartialStateYieldingScreen> {
  PartialStateYieldingScreenBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (this._bloc == null) {
      this._bloc = PartialStateYieldingScreenBloc();
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
        body: Column(
          children: [
            BlocBuilder<PartialStateYieldingScreenBloc,
                PartialStateYieldingScreenState>(
              bloc: this._bloc,
              condition: (previous, current) => current.property1 != null,
              builder: (context, state) {
                return Text('Property 1: ${state.property1}');
              },
            ),
            BlocBuilder<PartialStateYieldingScreenBloc,
                PartialStateYieldingScreenState>(
              bloc: this._bloc,
              condition: (previous, current) => current.property2 != null,
              builder: (context, state) {
                return Text('Property 2: ${state.property2}');
              },
            ),
            BlocBuilder<PartialStateYieldingScreenBloc,
                PartialStateYieldingScreenState>(
              bloc: this._bloc,
              condition: (previous, current) => current.property3 != null,
              builder: (context, state) {
                return Text('Property 3: ${state.property3}');
              },
            ),
            RaisedButton(
              child: Text('Increment property 1'),
              onPressed: () => this._bloc.add(
                    PartialStateYieldingScreenEventIncrementProperty1(),
                  ),
            ),
            RaisedButton(
              child: Text('Increment property 2'),
              onPressed: () => this._bloc.add(
                    PartialStateYieldingScreenEventIncrementProperty2(),
                  ),
            ),
            RaisedButton(
              child: Text('Increment property 3'),
              onPressed: () => this._bloc.add(
                    PartialStateYieldingScreenEventIncrementProperty3(),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
