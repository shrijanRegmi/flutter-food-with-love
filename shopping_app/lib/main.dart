import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/viewmodels/app_vm.dart';
import 'package:shopping_app/wrapper.dart';
import 'package:shopping_app/wrapper_builder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.pink,
    systemNavigationBarColor: Color(0xff302f35),
    statusBarIconBrightness: Brightness.light,
  ));
  await FWLInitializer.initializeFirebase();
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppVm>.value(
          value: AppVm(),
        ),
        StreamProvider<FoodWithLoveUser?>.value(
          value: FWLAuthProvider().userAuthState,
          initialData: null,
        ),
      ],
      child: WrapperBuilder(
        builder: (context) {
          return MaterialApp(
            title: "Food With Love",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Nunito',
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: kcPrimaryColor,
                    secondary: kcPrimaryColor,
                  ),
              inputDecorationTheme: InputDecorationTheme(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: kcPrimaryColor,
                  ),
                ),
              ),
            ),
            home: Material(
              child: Wrapper(),
            ),
          );
        },
      ),
    );
  }
}
