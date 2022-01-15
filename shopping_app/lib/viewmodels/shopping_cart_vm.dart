import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:provider/provider.dart';

class ShoppingCartVm extends ChangeNotifier {
  final BuildContext context;
  ShoppingCartVm(this.context);

  List<FoodShoppingCart> get shoppingCarts =>
      Provider.of<List<FoodShoppingCart>>(context);

  // remove item from shopping cart
  void removeFromShoppingCart(final FoodShoppingCart shoppingCart) {
    FWLProductProvider.removeFromCart(foodProduct: shoppingCart.foodProduct!);
  }

  // update cart quantity
  void updateCartQuantity(
    final FoodShoppingCart shoppingCart,
    final int quantity,
  ) {
    FWLProductProvider.updateCartQuantity(
      foodShoppingCart: shoppingCart,
      quantity: quantity,
    );
  }
}
