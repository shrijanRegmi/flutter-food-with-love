import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/viewmodels/shopping_cart_vm.dart';
import 'package:shopping_app/viewmodels/vm_provider.dart';

import '../view_product_screen.dart';

class ShoppingCartTab extends StatelessWidget {
  const ShoppingCartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VMProvider<ShoppingCartVm>(
      vm: ShoppingCartVm(context),
      builder: (context, vm, appVm, appUser) {
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
                  shoppingCarts: vm.shoppingCarts,
                  onQuantityUpdate: vm.updateCartQuantity,
                  onPressRemove: vm.removeFromShoppingCart,
                  onPressShoppingCart: (shoppingCart) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ViewProductScreen(
                        product: shoppingCart.foodProduct!,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FoodWithLoveCheckoutBlock(
              shoppingCarts: vm.shoppingCarts,
            ),
          ],
        );
      },
    );
  }
}
