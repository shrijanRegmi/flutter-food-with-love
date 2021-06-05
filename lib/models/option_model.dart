import 'package:flutter/material.dart';

class FoodWithLoveOption {
  final String? title;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Function()? onPressed;

  FoodWithLoveOption({
    this.title,
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
  });
}
