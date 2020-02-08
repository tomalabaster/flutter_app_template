import 'package:flutter/material.dart';
import 'package:flutter_app_template/blocs/app_bloc/app_bloc.dart';
import 'package:flutter_app_template/data/irepository.dart';
import 'package:flutter_app_template/screens/master/master_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final IRepository<Object> objectRepository;

  const MyApp({Key key, this.objectRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppBloc>(
        create: (context) => AppBloc(),
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<IRepository<Object>>(
              create: (context) => this.objectRepository,
            ),
          ],
          child: MasterScreen(),
        ),
      ),
    );
  }
}
