import 'package:flutter/material.dart';
import 'package:taskati/core/routes/app_route.dart';
import 'package:taskati/core/routes/routes.dart';

class Taskati extends StatelessWidget {
  const Taskati({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute.Function,
      initialRoute: Routes.splashScreen,
    );
  }
}
