import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/viewmodels/app_vm.dart';

class ViewProductVm extends ChangeNotifier {
  final BuildContext context;
  final FoodProduct product;
  ViewProductVm(this.context, this.product);

  bool _iconActive = false;

  bool get iconActive => _iconActive;

  // init function
  void onInit(final FoodWithLoveUser appUser) {
    _initializeValues(appUser);
    final _appVm = Provider.of<AppVm>(context, listen: false);
    final _viewed = _appVm.viewedProducts
            .indexWhere((element) => element.id == product.id) !=
        -1;

    if (!_viewed) {
      FWLProductProvider.viewProduct(product);
      _appVm.addToViewedProducts(product);
    }
  }

  // initialize values
  void _initializeValues(final FoodWithLoveUser appUser) {
    _iconActive = appUser.wishlists?.contains(product.id) ?? false;
  }

  // add to wishlist
  void addToWishList() {
    updateIconActive(true);
    FWLProductProvider.addToWishlist(foodProduct: product);
  }

  // remove from wishlist
  void removeFromWishList() {
    updateIconActive(false);
    FWLProductProvider.removeFromWishlist(foodProduct: product);
  }

  // update value of iconActive
  void updateIconActive(final bool newVal) {
    _iconActive = newVal;
    notifyListeners();
  }
}
