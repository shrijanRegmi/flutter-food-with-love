import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:food_with_love/src/widgets/food_with_love_order_item.dart';

class FoodWithLoveOrdersList extends StatelessWidget {
  final List<FoodOrder> orders;
  const FoodWithLoveOrdersList({
    Key? key,
    required this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final _order = orders[index];
        return FoodWithLoveOrderItem(
          order: _order,
        );
      },
    );
  }
}
