import 'package:flutter/material.dart';
import 'package:food_with_love/src/shared/styles.dart';

class FoodWithLoveText extends StatelessWidget {
  final String value;
  final TextStyle defaultStyle;
  final TextStyle? style;

  const FoodWithLoveText.heading1(this.value, {this.style})
      : defaultStyle = headingText1;
  const FoodWithLoveText.heading2(this.value, {this.style})
      : defaultStyle = headingText2;
  const FoodWithLoveText.heading3(this.value, {this.style})
      : defaultStyle = headingText3;
  const FoodWithLoveText.heading4(this.value, {this.style})
      : defaultStyle = headingText4;
  const FoodWithLoveText.heading5(this.value, {this.style})
      : defaultStyle = headingText5;
  const FoodWithLoveText.heading6(this.value, {this.style})
      : defaultStyle = headingText6;
  const FoodWithLoveText.body(this.value, {this.style})
      : defaultStyle = bodyText;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: defaultStyle.merge(style),
    );
  }
}