import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/viewmodels/app_vm.dart';

class ViewProductVm extends ChangeNotifier {
  final BuildContext context;
  final FoodProduct product;
  ViewProductVm(this.context, this.product);

  // init function
  void onInit() {
    final _appVm = Provider.of<AppVm>(context, listen: false);
    final _viewed = _appVm.viewedProducts
            .indexWhere((element) => element.id == product.id) !=
        -1;

    if (!_viewed) {
      FWLProductProvider.viewProduct(product);
      _appVm.addToViewedProducts(product);
    }
  }
}
