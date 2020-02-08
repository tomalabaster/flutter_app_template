import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<T, V> extends Bloc<T, V> {
  V get buildState;
}
