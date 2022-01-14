import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/viewmodels/vm_provider.dart';
import 'package:shopping_app/viewmodels/wishlist_vm.dart';
import '../view_product_screen.dart';

class FavouritesTab extends StatelessWidget {
  const FavouritesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VMProvider<WishlistVm>(
      vm: WishlistVm(context),
      builder: (context, vm, appVm, appUser) {
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
                  products: vm.wishlists.map((e) => e.foodProduct!).toList(),
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
