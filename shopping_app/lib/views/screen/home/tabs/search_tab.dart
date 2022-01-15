import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/viewmodels/search_vm.dart';
import 'package:shopping_app/viewmodels/vm_provider.dart';
import 'package:shopping_app/views/screen/home/view_product_screen.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VMProvider<SearchVm>(
      vm: SearchVm(context),
      builder: (context, vm, appVm, appUser) {
        final _lastSearches =
            vm.lastSearches.map((e) => e.foodProduct!).toList();
        return Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            FoodWithLoveHeader(title: 'Search'),
            SizedBox(
              height: 20.0,
            ),
            FoodWithLoveSearchBar(
              searchController: vm.searchController,
              onPressed: () => vm.searchProducts(appUser!),
            ),
            SizedBox(
              height: 20.0,
            ),
            if (_lastSearches.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      FoodWithLoveLeftRightText(
                        leftText: 'Last Searches',
                        rightText: 'Clear All',
                        onPressed: () => vm.clearLastSearches(_lastSearches),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      FoodWithLoveProductsList(
                        products: _lastSearches,
                        itemBuilder: (context, index) {
                          final _product = _lastSearches[index];
                          return FoodWithLoveProductItem.outlined(
                            product: _product,
                            onBagIt: (product, quantity) => appVm
                                .addToShoppingCart(context, product, quantity),
                          );
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
      },
    );
  }
}
