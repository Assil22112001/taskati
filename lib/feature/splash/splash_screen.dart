import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/theme/app_text_style.dart';
import 'package:taskati/feature/auth/presentation/auth_screen.dart';
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
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => AuthScreen()),
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
