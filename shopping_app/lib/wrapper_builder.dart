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
            value: FWLProductProvider().popularProductsList,
            initialData: <FoodProduct>[],
          ),
        ],
        child: builder(context),
      );
    else
      return builder(context);
  }
}
