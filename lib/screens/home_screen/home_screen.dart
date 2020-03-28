import 'package:flutter/material.dart';
import 'package:flutter_app_template/screens/state_yielding_example_screen/current_state_updating_screen/current_state_updating_screen.dart';
import 'package:flutter_app_template/screens/state_yielding_example_screen/full_state_yielding_screen/full_state_yielding_screen.dart';
import 'package:flutter_app_template/screens/state_yielding_example_screen/partial_state_yielding_screen/partial_state_yielding_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _counter = PageStorage.of(context).readState(context) ?? 0;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;

      PageStorage.of(context).writeState(context, _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              child: Text('Full State Yielding'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => FullStateYieldingScreen()),
              ),
            ),
            RaisedButton(
              child: Text('Partial State Yielding'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => PartialStateYieldingScreen()),
              ),
            ),
            RaisedButton(
              child: Text('Current State Yielding'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => CurrentStateYieldingScreen()),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
