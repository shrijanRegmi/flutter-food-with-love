import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';

class AppVm extends ChangeNotifier {
  List<FoodProduct> _popularProducts = [];
  List<FoodProduct> _viewedProducts = [];

  List<FoodProduct> get popularProducts => _popularProducts;
  List<FoodProduct> get viewedProducts => _viewedProducts;

  // update value of popularProducts
  updatePopularProducts(final List<FoodProduct> newVal) {
    if (_popularProducts.isEmpty) _popularProducts = newVal;
  }

  // add value to viewedProducts
  void addToViewedProducts(final FoodProduct newVal) {
    _viewedProducts.add(newVal);
  }

  // add product to shopping cart
  void addToShoppingCart(
    final BuildContext context,
    final FoodProduct product,
    final int quantity,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            CachedNetworkImage(
              imageUrl: product.imgUrl ?? '',
              width: 30.0,
              height: 30.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "Added $quantity ${quantity == 1 ? 'kg' : 'kgs'} ${(product.title?.length ?? 0) > 10 ? '${product.title?.substring(0, 10)}...' : product.title} to your shopping cart",
            ),
          ],
        ),
        backgroundColor: Colors.green,
      ),
    );
    FWLProductProvider.addToCart(
      foodProduct: product,
      quantity: quantity,
    );
  }
}
