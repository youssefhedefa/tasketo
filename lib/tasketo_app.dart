import 'package:flutter/material.dart';
import 'package:tasketo/core/routing/routing_constances.dart';
import 'package:tasketo/core/routing/routing_manager.dart';
import 'package:tasketo/main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasketo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ).copyWith(
        textTheme: ThemeData().textTheme.apply(
          fontFamily: 'Poppins',
        ),
      ),
      onGenerateRoute: AppRoutingManager().onGenerateRoute,
      initialRoute: isLoggedInUser ? AppRoutingConstances.home : AppRoutingConstances.onboarding,
    );
  }
}
