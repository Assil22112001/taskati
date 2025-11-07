import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskati/core/routes/app_route.dart';
import 'package:taskati/core/routes/routes.dart';
import 'package:taskati/core/theme/cubit/cubit/theme_cubit.dart';

class Taskati extends StatelessWidget {
  const Taskati({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: context.read<ThemeCubit>().appTheme,
            onGenerateRoute: AppRoute.Function,
            initialRoute: Routes.splashScreen,
          );
        },
      ),
    );
  }
}
