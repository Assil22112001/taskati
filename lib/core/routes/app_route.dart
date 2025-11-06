import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskati/core/routes/routes.dart';
import 'package:taskati/feature/auth/presentation/auth_screen.dart';
import 'package:taskati/feature/auth/presentation/cubit/cubit/auth_cubit_cubit.dart';
import 'package:taskati/feature/home/presentation/home_screen.dart';
import 'package:taskati/feature/splash/splash_screen.dart';

class AppRoute {
  static Route<dynamic>?  Function(RouteSettings setting) {
    switch (setting.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case Routes.authScreen:
        return MaterialPageRoute(builder: (_) => 
        
        BlocProvider(
          create: (context) => AuthCubitCubit(),
          child: AuthScreen(),
        ));
            case Routes.homeScreen: 
            return MaterialPageRoute(builder: (_) => HomeScreen());
    }
    return null;



  }
}
