import 'package:flutter/material.dart';
import 'package:food_with_love/enums/food_product_style.dart';
import 'package:food_with_love/models/food_product_model.dart';

class FoodWithLoveProductItem extends StatelessWidget {
  final FoodProduct product;
  final FoodProductStyle style;

  FoodWithLoveProductItem.filled({required this.product})
      : style = FoodProductStyle.filled;
  FoodWithLoveProductItem.outlined({required this.product})
      : style = FoodProductStyle.outlined;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        color: product.color,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
