import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:provider/provider.dart';

class ShoppingCartVm extends ChangeNotifier {
  final BuildContext context;
  ShoppingCartVm(this.context);

  List<FoodShoppingCart> get shoppingCarts =>
      Provider.of<List<FoodShoppingCart>>(context);
}
