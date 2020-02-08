import 'package:flutter/material.dart';
import 'package:flutter_app_template/blocs/master_screen_bloc/master_screen_bloc.dart';
import 'package:flutter_app_template/blocs/master_screen_bloc/master_screen_event.dart';
import 'package:flutter_app_template/blocs/master_screen_bloc/master_screen_state.dart';
import 'package:flutter_app_template/screens/home_screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MasterScreen extends StatefulWidget {
  @override
  _MasterScreenState createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  final List<Widget> _tabScreens = [
    HomeScreen(title: 'Home'),
    HomeScreen(title: 'Messages'),
  ];

  MasterScreenBloc _bloc;

  @override
  void initState() {
    super.initState();

    this._bloc = MasterScreenBloc();
  }

  @override
  void dispose() {
    _bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MasterScreenBloc>(
      create: (context) => this._bloc,
      child: BlocBuilder<MasterScreenBloc, MasterScreenState>(
        bloc: this._bloc,
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentTabIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text('Home')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.message), title: Text('Messages')),
              ],
              onTap: (index) =>
                  this._bloc.add(MasterScreenEventSwitchTab(tabIndex: index)),
            ),
            body: Container(
              key: PageStorageKey('${state.currentTabIndex}'),
              child: this._tabScreens[state.currentTabIndex],
            ),
          );
        },
      ),
    );
  }
}
