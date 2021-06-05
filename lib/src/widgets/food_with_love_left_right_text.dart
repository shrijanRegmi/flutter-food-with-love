import 'package:flutter/material.dart';

class FoodWithLoveLeftRightText extends StatelessWidget {
  final String? leftText;
  final String? rightText;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  const FoodWithLoveLeftRightText({
    Key? key,
    this.leftText,
    this.rightText,
    this.onPressed,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (leftText != null)
            Text(
              '$leftText',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          if (rightText != null)
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                primary: Colors.pink,
              ),
              child: Text('$rightText'),
            ),
        ],
      ),
    );
  }
}
