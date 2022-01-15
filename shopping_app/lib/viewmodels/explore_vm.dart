import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/views/screen/home/view_all_products_screen.dart';

class ExploreVm extends ChangeNotifier {
  final BuildContext context;
  ExploreVm(this.context);

  TextEditingController _searchController = TextEditingController();

  TextEditingController get searchController => _searchController;
  List<FoodProduct> get popularProducts =>
      Provider.of<List<FoodProduct>>(context);

  // search products
  void searchProducts(final FoodWithLoveUser appUser) async {
    if (_searchController.text.trim() != '') {
      FocusScope.of(context).unfocus();
      final _products =
          await FWLProductProvider.search(_searchController.text.trim());
      _searchController.clear();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ViewAllProductScreen(
            title: 'Search Results',
            products: _products,
            noResultsDescription:
                'Edit your search and try again for\nbest results',
            onPressProduct: (product) {
              FWLProductProvider.addToLastSearch(
                foodProduct: product,
                full: (appUser.lastSearches?.length ?? 0) >= 8,
              );
            },
          ),
        ),
      );
    }
  }
}
