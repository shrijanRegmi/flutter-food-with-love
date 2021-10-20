import 'package:flutter/material.dart';
import 'package:food_with_love/models/food_product_model.dart';
import 'package:food_with_love/src/widgets/food_with_love_similar_products_item.dart';

class FoodWithLoveSimilarProductsList extends StatelessWidget {
  final List<FoodProduct> products;
  final Function(BuildContext, int)? itemBuilder;
  final Function(FoodProduct)? onPressProduct;
  const FoodWithLoveSimilarProductsList({
    Key? key,
    required this.products,
    this.itemBuilder,
    this.onPressProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final _product = products[index];

          var _widget;

          _widget = GestureDetector(
            onTap: () => onPressProduct!(_product),
            child: itemBuilder != null
                ? itemBuilder!(context, index)
                : FoodWithLoveSimilarProductItem(product: _product),
          );

          if (index == 0)
            return Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: _widget,
            );

          return _widget;
        },
      ),
    );
  }
}
