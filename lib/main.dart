import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasketo/bloc_observer.dart';
import 'package:tasketo/core/di/di.dart';
import 'package:tasketo/core/networking/local_storage/app_local_storage.dart';
import 'package:tasketo/tasketo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalStorageHelper.initStorage();
  checkUserLoggedIn();
  setupDependencyInjection();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

bool isLoggedInUser = false;
checkUserLoggedIn() {
  final id =  AppLocalStorageHelper.getId();
  if (id != 0) {
    isLoggedInUser = true;
  }
}