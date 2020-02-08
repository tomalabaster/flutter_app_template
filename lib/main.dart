import 'package:flutter/material.dart';
import 'package:flutter_app_template/app.dart';
import 'package:flutter_app_template/data/user_repository/in_memory_object_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final objectRepository = InMemoryObjectRepository();

  runApp(MyApp(
    objectRepository: objectRepository,
  ));
}
