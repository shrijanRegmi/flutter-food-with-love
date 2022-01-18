import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';

class TextInput extends StatelessWidget {
  final String? hintText;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final bool password;
  final TextEditingController? controller;
  final Color? primaryColor;
  final TextInputType? type;
  final TextCapitalization? capitalization;

  const TextInput({
    Key? key,
    this.hintText = '',
    this.leftIcon,
    this.rightIcon,
    this.password = false,
    this.controller,
    this.primaryColor,
    this.type,
    this.capitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          if (leftIcon != null) leftIcon!,
          if (leftIcon != null)
            SizedBox(
              width: 10.0,
            ),
          Expanded(
            child: TextFormField(
              obscureText: password,
              controller: controller,
              keyboardType: type,
              textCapitalization: capitalization ?? TextCapitalization.none,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: kcDarkGreyColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          if (rightIcon != null)
            SizedBox(
              width: 10.0,
            ),
          if (rightIcon != null) rightIcon!,
        ],
      ),
    );
  }
}
