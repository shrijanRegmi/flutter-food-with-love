import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/viewmodels/vm_provider.dart';
import 'package:shopping_app/viewmodels/wishlist_vm.dart';
import 'package:shopping_app/views/widgets/common_widgets/empty_builder.dart';
import '../view_product_screen.dart';

class FavouritesTab extends StatelessWidget {
  const FavouritesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VMProvider<WishlistVm>(
      vm: WishlistVm(context),
      builder: (context, vm, appVm, appUser) {
        final _products = vm.wishlists.map((e) => e.foodProduct!).toList();
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
              child: _products.isEmpty
                  ? EmptyBuilder(
                      title: 'No items in your wishlist',
                      subTitle: 'We believe this place will be crowded soon',
                    )
                  : SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: FoodWithLoveProductsList(
                        products: _products,
                        onBagIt: (product, quantity) =>
                            appVm.addToShoppingCart(context, product, quantity),
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
      },
    );
  }
}
