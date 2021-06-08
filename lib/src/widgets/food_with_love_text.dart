import 'package:flutter/material.dart';
import 'package:food_with_love/src/shared/styles.dart';

class FoodWithLoveText extends StatelessWidget {
  final String value;
  final TextStyle style;

  const FoodWithLoveText.heading1(this.value) : style = headingText1;
  const FoodWithLoveText.heading2(this.value) : style = headingText2;
  const FoodWithLoveText.heading3(this.value) : style = headingText3;
  const FoodWithLoveText.heading4(this.value) : style = headingText4;
  const FoodWithLoveText.heading5(this.value) : style = headingText5;
  const FoodWithLoveText.heading6(this.value) : style = headingText6;
  const FoodWithLoveText.body(this.value, {this.style = bodyText});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: style,
    );
  }
}
