import 'package:flutter/material.dart';
import 'package:food_with_love/models/food_product_model.dart';
import 'package:food_with_love/src/widgets/food_with_love_products_item.dart';

class FoodWithLoveProductsList extends StatelessWidget {
  final List<FoodProduct> products;
  final Function(BuildContext, int)? itemBuilder;
  final EdgeInsetsGeometry? padding;
  final Function(FoodProduct)? onPressProduct;
  final Function(FoodProduct, int)? onBagIt;
  const FoodWithLoveProductsList({
    Key? key,
    required this.products,
    this.itemBuilder,
    this.padding,
    this.onPressProduct,
    this.onBagIt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.builder(
        itemCount: products.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (context, index) {
          final _product = products[index];

          return GestureDetector(
            onTap: () => onPressProduct!(_product),
            child: itemBuilder != null
                ? itemBuilder!(context, index)
                : FoodWithLoveProductItem.filled(
                    product: _product,
                    onBagIt: onBagIt,
                  ),
          );
        },
      ),
    );
  }
}
