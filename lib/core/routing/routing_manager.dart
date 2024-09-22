import 'package:flutter/material.dart';

class AppRoutingManager {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
      default:
        return null;
    }
  }
}
