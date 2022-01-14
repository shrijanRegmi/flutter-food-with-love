import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:provider/provider.dart';

class WishlistVm extends ChangeNotifier {
  final BuildContext context;
  WishlistVm(this.context);

  List<FoodWishlist> get wishlists => Provider.of<List<FoodWishlist>>(context);
}
