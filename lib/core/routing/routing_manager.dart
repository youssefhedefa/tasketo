import 'package:flutter/material.dart';
import 'package:tasketo/features/auth/presentation/ui/on_boarding_view.dart';

class AppRoutingManager {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const OnBoardingView(),
        );
      default:
        return null;
    }
  }
}
