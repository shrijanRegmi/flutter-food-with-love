import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:provider/provider.dart';

class ViewAllCategoriesVm extends ChangeNotifier {
  final BuildContext context;
  ViewAllCategoriesVm(this.context);

  List<FoodCategory> get categories => Provider.of<List<FoodCategory>>(context);
}
