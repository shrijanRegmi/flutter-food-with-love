import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';

import '../../../../test_data.dart';
import '../view_product_screen.dart';

class FavouritesTab extends StatelessWidget {
  const FavouritesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        FoodWithLoveHeader(title: 'My Wishlist'),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: FoodWithLoveProductsList(
              products: foodProducts,
              onPressProduct: (product) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ViewProductScreen(
                    product: product,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
