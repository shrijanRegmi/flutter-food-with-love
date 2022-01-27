import 'package:flutter/material.dart';
import 'package:food_with_love/enums/button_style.dart' as button_style;
import 'package:food_with_love/src/shared/app_colors.dart';

class FoodWithLoveButton extends StatelessWidget {
  final String? value;
  final Color color;
  final TextStyle? textStyle;
  final Color borderColor;
  final Widget? icon;
  final double borderRadius;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final button_style.ButtonStyle buttonStyle;
  final bool loading;

  const FoodWithLoveButton.filled({
    this.value,
    this.icon,
    this.color = kcPrimaryColor,
    this.textStyle,
    this.borderRadius = 2.0,
    this.onPressed,
    this.padding,
    this.loading = false,
  })  : buttonStyle = button_style.ButtonStyle.filled,
        borderColor = Colors.black;

  const FoodWithLoveButton.bordered({
    this.value,
    this.icon,
    this.textStyle,
    this.borderColor = kcPrimaryColor,
    this.borderRadius = 2.0,
    this.onPressed,
    this.padding,
    this.loading = false,
  })  : buttonStyle = button_style.ButtonStyle.bordered,
        color = kcPrimaryColor;

  @override
  Widget build(BuildContext context) {
    if (buttonStyle == button_style.ButtonStyle.filled)
      return MaterialButton(
        color: color,
        padding: padding ?? const EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        disabledColor: kcLightGreyColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon ?? Container(),
            if (icon != null && value != null)
              SizedBox(
                width: 10.0,
              ),
            if (value != null)
              Text(
                '$value',
                style: textStyle ??
                    TextStyle(
                      color: Colors.white,
                    ),
              ),
            if (loading)
              SizedBox(
                width: 20.0,
              ),
            if (loading)
              Container(
                width: 25.0,
                height: 25.0,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
          ],
        ),
        onPressed: onPressed,
      );
    else
      return MaterialButton(
        padding: padding ?? const EdgeInsets.all(20.0),
        splashColor: borderColor.withOpacity(0.1),
        highlightColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            color: borderColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon ?? Container(),
            if (icon != null && value != null)
              SizedBox(
                width: 10.0,
              ),
            if (value != null)
              Text(
                '$value',
                style: textStyle ??
                    TextStyle(
                      color: onPressed == null ? Colors.grey : Colors.white,
                    ),
              ),
          ],
        ),
        onPressed: onPressed,
      );
  }
}
