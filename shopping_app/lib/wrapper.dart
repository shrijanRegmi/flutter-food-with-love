import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/views/screen/auth/login_screen.dart';
import 'package:shopping_app/views/screen/home/home_screen.dart';
import 'package:shopping_app/views/screen/splash_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(milliseconds: 3000),
      () => setState(() => _isLoading = false),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _appUser = Provider.of<FoodWithLoveUser?>(context);

    if (_isLoading) return SplashScreen();

    return _appUser == null ? LoginScreen() : HomeScreen();
  }
}
