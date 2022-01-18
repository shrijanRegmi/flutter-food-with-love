import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:provider/provider.dart';

class OrderVm extends ChangeNotifier {
  final BuildContext context;
  OrderVm(this.context);

  List<FoodOrder> get orders => Provider.of<List<FoodOrder>>(context);
}
