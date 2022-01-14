import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';

class FoodWithLoveCheckoutBlock extends StatelessWidget {
  final List<FoodShoppingCart> shoppingCarts;

  const FoodWithLoveCheckoutBlock({
    Key? key,
    required this.shoppingCarts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _priceBuilder(),
          FoodWithLoveButton.filled(
            value: 'Checkout',
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 10.0,
            ),
            onPressed: _getTotalPrice() == 0 ? null : () {},
          )
        ],
      ),
    );
  }

  Widget _priceBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Nunito',
              fontSize: 12.0,
            ),
            children: [
              TextSpan(text: 'Shipping: '),
              TextSpan(
                text: 'Rs ${_getShippingPrice()}',
                style: TextStyle(
                  color: kcPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Nunito',
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(text: 'Total: '),
              TextSpan(
                text: 'Rs ${_getTotalPrice()}',
                style: TextStyle(
                  color: kcPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  int _getShippingPrice() {
    int _shipping = 0;
    shoppingCarts.forEach((cart) {
      _shipping += (cart.foodProduct?.shippingPrice ?? 0);
    });
    return _shipping;
  }

  int _getTotalPrice() {
    int _total = 0;
    shoppingCarts.forEach((cart) {
      _total += ((cart.foodProduct?.price ?? 0) * (cart.quantity ?? 1));
    });
    return _total;
  }
}
