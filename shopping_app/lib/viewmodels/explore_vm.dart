import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:provider/provider.dart';

class ExploreVm extends ChangeNotifier {
  final BuildContext context;
  ExploreVm(this.context);

  List<FoodProduct> get popularProducts =>
      Provider.of<List<FoodProduct>>(context);

  // add product to shopping cart
  void addToShoppingCart(
    final FoodProduct product,
    final int quantity,
  ) {
    final _shoppingCart = FoodShoppingCart(
      foodProductId: product.id,
      foodProduct: product,
      quantity: quantity,
    );

    FWLProductProvider.addToCart(_shoppingCart);
  }
}
