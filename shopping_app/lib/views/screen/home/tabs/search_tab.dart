import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/views/screen/home/view_product_screen.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        FoodWithLoveHeader(title: 'Search'),
        SizedBox(
          height: 20.0,
        ),
        FoodWithLoveSearchBar(),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                FoodWithLoveLeftRightText(
                  leftText: 'Last Searches',
                  rightText: 'Clear All',
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10.0,
                ),
                FoodWithLoveProductsList(
                  products: [],
                  itemBuilder: (context, index) {
                    final _product = [][index];
                    return FoodWithLoveProductItem.outlined(product: _product);
                  },
                  onPressProduct: (product) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ViewProductScreen(
                        product: product,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
