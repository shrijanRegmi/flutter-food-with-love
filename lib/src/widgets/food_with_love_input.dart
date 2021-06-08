import 'package:flutter/material.dart';
import 'package:food_with_love/src/shared/app_colors.dart';

class FoodWithLoveInput extends StatelessWidget {
  final String? hintText;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final bool password;
  final TextEditingController? controller;
  final Color? primaryColor;

  const FoodWithLoveInput({
    Key? key,
    this.hintText = '',
    this.leftIcon,
    this.rightIcon,
    this.password = false,
    this.controller,
    this.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor ?? kcLightGreyColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kcPrimaryColor,
              width: 1.0,
            ),
          ),
        ),
      ),
      child: TextFormField(
        obscureText: password,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: primaryColor ?? Colors.grey,
          ),
          prefixIcon: leftIcon,
          suffixIcon: rightIcon,
        ),
      ),
    );
  }
}
