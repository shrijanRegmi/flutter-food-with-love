import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/wrapper.dart';
import 'package:shopping_app/wrapper_builder.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.pink,
    systemNavigationBarColor: Color(0xff302f35),
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WrapperBuilder(
      builder: (context) {
        return MaterialApp(
          title: "Food with Love",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Nunito',
          ),
          home: Material(
            child: Wrapper(),
          ),
        );
      },
    );
  }
}
