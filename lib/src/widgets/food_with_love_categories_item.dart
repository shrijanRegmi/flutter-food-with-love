import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_with_love/models/food_category_model.dart';
import 'package:food_with_love/src/shared/app_colors.dart';

class FoodWithLoveCategoriesItem extends StatelessWidget {
  final FoodCategory category;
  const FoodWithLoveCategoriesItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: 100.0,
              decoration: BoxDecoration(
                color: kcExtraLightGreenColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: CachedNetworkImage(
                  height: 50.0,
                  width: 50.0,
                  imageUrl: '${category.imgUrl}',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '${category.title}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          )
        ],
      ),
    );
  }
}
