import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:provider/provider.dart';

class WrapperBuilder extends StatelessWidget {
  final Widget Function(BuildContext) builder;

  const WrapperBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appUser = Provider.of<FoodWithLoveUser?>(context);
    if (_appUser != null)
      return MultiProvider(
        providers: [
          StreamProvider<List<FoodProduct>>.value(
            value: FWLProductProvider.popularProductsList,
            initialData: <FoodProduct>[],
          ),
          StreamProvider<List<FoodWishlist>>.value(
            value: FWLProductProvider.wishlistsList,
            initialData: <FoodWishlist>[],
          ),
          StreamProvider<List<FoodShoppingCart>>.value(
            value: FWLProductProvider.shoppingCartsList,
            initialData: <FoodShoppingCart>[],
          ),
          StreamProvider<List<FoodLastSearch>>.value(
            value: FWLProductProvider.lastSearchesList,
            initialData: <FoodLastSearch>[],
          ),
          StreamProvider<List<FoodNotification>>.value(
            value: FWLNotificationProvider.notificationsList,
            initialData: <FoodNotification>[],
          ),
        ],
        child: builder(context),
      );
    else
      return builder(context);
  }
}
