import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/routes/routes.dart';
import 'package:taskati/core/theme/app_text_style.dart';
import 'package:taskati/feature/home/data/repo/home_repo.dart';
import 'package:taskati/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToNextScreen();
    super.initState();
  }

  navigateToNextScreen() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
        context,HomeRepo.getUserData()!=null?Routes.homeScreen:
        Routes.authScreen,
        (e) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(Assets.images.splashLogo),
            Text("Taskati", style: AppTextStyle.font30N),
            SizedBox(height: 20),
            Text("It's Time To Get Organized", style: AppTextStyle.font16A),
          ],
        ),
      ),
    );
  }
}
