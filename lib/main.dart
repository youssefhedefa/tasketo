import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasketo/bloc_observer.dart';
import 'package:tasketo/core/di/di.dart';
import 'package:tasketo/tasketo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

