import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/test_data.dart';
import 'package:shopping_app/views/screen/home/view_product_screen.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          FoodWithLoveBanner(),
          SizedBox(
            height: 30.0,
          ),
          FoodWithLoveSearchBar(
            searchController: null,
            onPressed: () {},
          ),
          SizedBox(
            height: 20.0,
          ),
          FoodWithLoveLeftRightText(
            leftText: 'Categories',
            rightText: 'View All',
            onPressed: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          FoodWithLoveCategoriesList(
            categories: categories,
          ),
          SizedBox(
            height: 30.0,
          ),
          FoodWithLoveLeftRightText(
            leftText: 'Popular',
            rightText: 'View All',
            onPressed: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          FoodWithLoveProductsList(
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
          SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }
}
