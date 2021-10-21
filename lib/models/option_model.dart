import 'package:flutter/material.dart';

class FoodWithLoveOption {
  final String title;
  final Widget leftIcon;
  final Widget rightIcon;
  final Function() onPressed;

  FoodWithLoveOption({
    required this.title,
    required this.leftIcon,
    required this.rightIcon,
    required this.onPressed,
  });
}
