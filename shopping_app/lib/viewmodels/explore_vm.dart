import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:provider/provider.dart';

class ExploreVm extends ChangeNotifier {
  final BuildContext context;
  ExploreVm(this.context);

  List<FoodProduct> get popularProducts =>
      Provider.of<List<FoodProduct>>(context);
}
