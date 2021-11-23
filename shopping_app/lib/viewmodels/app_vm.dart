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
}
