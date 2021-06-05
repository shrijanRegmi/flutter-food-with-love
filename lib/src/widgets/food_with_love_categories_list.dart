import 'package:flutter/material.dart';
import 'package:food_with_love/models/food_category_model.dart';
import 'package:food_with_love/src/widgets/food_with_love_categories_item.dart';

class FoodWithLoveCategoriesList extends StatelessWidget {
  final List<FoodCategory> categories;
  final Widget Function(BuildContext, int)? itemBuilder;

  const FoodWithLoveCategoriesList({
    Key? key,
    required this.categories,
    this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final _category = categories[index];
          final _widget = itemBuilder != null
              ? itemBuilder!(context, index)
              : FoodWithLoveCategoriesItem(category: _category);

          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: _widget,
            );
          }

          return _widget;
        },
      ),
    );
  }
}
