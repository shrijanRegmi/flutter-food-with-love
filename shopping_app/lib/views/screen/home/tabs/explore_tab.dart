import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/test_data.dart';
import 'package:shopping_app/viewmodels/explore_vm.dart';
import 'package:shopping_app/viewmodels/vm_provider.dart';
import 'package:shopping_app/views/screen/home/view_product_screen.dart';

// ignore: must_be_immutable
class ExploreTab extends StatelessWidget {
  ExploreTab({Key? key}) : super(key: key);

  var _popularProducts = <FoodProduct>[];
  @override
  Widget build(BuildContext context) {
    return VMProvider<ExploreVm>(
      vm: ExploreVm(context),
      builder: (context, vm, appUser) {
        // don't receive popular products list realtime so that when the
        // product views gets updated then the list doesn't update
        if (_popularProducts.isEmpty) _popularProducts = vm.popularProducts;

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
                products: _popularProducts,
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
      },
    );
  }
}
