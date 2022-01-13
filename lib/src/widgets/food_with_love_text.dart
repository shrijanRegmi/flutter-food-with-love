import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:food_with_love/src/shared/styles.dart';

class FoodWithLoveText extends StatefulWidget {
  final String value;
  final TextStyle defaultStyle;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? expandTextLength;

  const FoodWithLoveText.heading1(
    this.value, {
    this.style,
    this.textAlign = TextAlign.start,
    this.expandTextLength,
  }) : defaultStyle = headingText1;

  const FoodWithLoveText.heading2(
    this.value, {
    this.style,
    this.textAlign = TextAlign.start,
    this.expandTextLength,
  }) : defaultStyle = headingText2;

  const FoodWithLoveText.heading3(
    this.value, {
    this.style,
    this.textAlign = TextAlign.start,
    this.expandTextLength,
  }) : defaultStyle = headingText3;

  const FoodWithLoveText.heading4(
    this.value, {
    this.style,
    this.textAlign = TextAlign.start,
    this.expandTextLength,
  }) : defaultStyle = headingText4;

  const FoodWithLoveText.heading5(
    this.value, {
    this.style,
    this.textAlign = TextAlign.start,
    this.expandTextLength,
  }) : defaultStyle = headingText5;

  const FoodWithLoveText.heading6(
    this.value, {
    this.style,
    this.textAlign = TextAlign.start,
    this.expandTextLength,
  }) : defaultStyle = headingText6;

  const FoodWithLoveText.body(
    this.value, {
    this.style,
    this.textAlign = TextAlign.start,
    this.expandTextLength,
  }) : defaultStyle = bodyText;

  @override
  State<FoodWithLoveText> createState() => _FoodWithLoveTextState();
}

class _FoodWithLoveTextState extends State<FoodWithLoveText> {
  bool _showingAllText = false;

  @override
  Widget build(BuildContext context) {
    final _value = widget.expandTextLength != null && !_showingAllText
        ? '${widget.value.substring(0, widget.expandTextLength)}...'
        : widget.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _value,
          style: widget.defaultStyle.merge(widget.style),
          textAlign: widget.textAlign,
        ),
        if (widget.expandTextLength != null)
          SizedBox(
            height: 5.0,
          ),
        if (widget.expandTextLength != null)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => setState(() => _showingAllText = !_showingAllText),
            child: Text(
              _showingAllText ? 'Read Less' : 'Read More',
              style: widget.defaultStyle.merge(widget.style?.copyWith(
                color: kcPrimaryColor,
              )),
            ),
          ),
      ],
    );
  }
}
