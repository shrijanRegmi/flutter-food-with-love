import 'package:flutter/material.dart';
import 'package:food_with_love/models/option_model.dart';

class FoodWithLoveOptionsItem extends StatelessWidget {
  final FoodWithLoveOption option;
  const FoodWithLoveOptionsItem({
    Key? key,
    required this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      leading: option.leftIcon,
      trailing: option.rightIcon,
      title: Text(
        '${option.title}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: option.onPressed,
    );
  }
}
