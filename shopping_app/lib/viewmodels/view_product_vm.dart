import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';

class ViewProductVm extends ChangeNotifier {
  final BuildContext context;
  final FoodProduct product;
  ViewProductVm(this.context, this.product);

  // init function
  void onInit() {
    FWLProductProvider.viewProduct(product);
  }
}
