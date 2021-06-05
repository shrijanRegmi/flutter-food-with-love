import 'package:flutter/material.dart';

class FoodWithLoveHeader extends StatelessWidget {
  final String title;
  final double fontSize;
  const FoodWithLoveHeader({
    Key? key,
    required this.title,
    this.fontSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '$title',
        style: TextStyle(
          letterSpacing: 2.0,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
