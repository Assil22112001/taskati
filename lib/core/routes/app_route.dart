import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskati/core/routes/routes.dart';
import 'package:taskati/feature/auth/presentation/auth_screen.dart';
import 'package:taskati/feature/splash/splash_screen.dart';

class AppRoute {
  static Route<dynamic>?  Function(RouteSettings setting) {
    switch (setting.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case Routes.authScreen:
        return MaterialPageRoute(builder: (_) => AuthScreen());
    }
    return null;
  }
}
