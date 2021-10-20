import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_with_love/models/food_product_model.dart';

class FoodWithLoveSimilarProductItem extends StatelessWidget {
  final FoodProduct product;
  const FoodWithLoveSimilarProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: CachedNetworkImage(
                width: 75.0,
                height: 75.0,
                imageUrl: '${product.imgUrl}',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
