import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _loaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/splash.json',
              onLoaded: (_) => setState(() => _loaded = true),
            ),
            if (_loaded) FoodWithLoveBanner(),
          ],
        ),
      ),
    );
  }
}
