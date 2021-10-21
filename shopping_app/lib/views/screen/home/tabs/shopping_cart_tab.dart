import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/test_data.dart';

class ShoppingCartTab extends StatelessWidget {
  const ShoppingCartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        FoodWithLoveHeader(title: 'Shopping Cart'),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: FoodWithLoveShoppingCartList(
              shoppingCarts: shoppingCarts,
              onQuantityUpdate: (shoppingCart, quantity) {
                print('${shoppingCart.foodProduct?.title}');
                print('$quantity');
              },
            ),
          ),
        ),
        FoodWithLoveCheckoutBlock(shoppingCarts),
      ],
    );
  }
}
