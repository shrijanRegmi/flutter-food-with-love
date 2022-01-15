import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:food_with_love/src/widgets/food_with_love_shopping_cart_item.dart';

class FoodWithLoveShoppingCartList extends StatelessWidget {
  final List<FoodShoppingCart> shoppingCarts;
  final Widget Function(BuildContext, int)? itemBuilder;
  final Function(FoodShoppingCart, int)? onQuantityUpdate;
  final Function(FoodShoppingCart)? onPressShoppingCart;
  final Function(FoodShoppingCart)? onPressRemove;
  const FoodWithLoveShoppingCartList({
    Key? key,
    required this.shoppingCarts,
    this.itemBuilder,
    this.onQuantityUpdate,
    this.onPressShoppingCart,
    this.onPressRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: shoppingCarts.length,
      itemBuilder: (context, index) {
        final _shoppingCart = shoppingCarts[index];

        return GestureDetector(
          onTap: () => onPressShoppingCart?.call(_shoppingCart),
          behavior: HitTestBehavior.opaque,
          child: itemBuilder != null
              ? itemBuilder!(context, index)
              : FoodWithLoveShoppingCartItem(
                  shoppingCart: _shoppingCart,
                  onQuantityUpdate: (int quantity) {
                    onQuantityUpdate?.call(_shoppingCart, quantity);
                  },
                  onPressRemove: onPressRemove,
                ),
        );
      },
    );
  }
}
