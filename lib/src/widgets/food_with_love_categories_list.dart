import 'package:flutter/material.dart';
import 'package:food_with_love/models/food_category_model.dart';
import 'package:food_with_love/src/widgets/food_with_love_categories_item.dart';

class FoodWithLoveCategoriesList extends StatelessWidget {
  final List<FoodCategory> categories;
  final Widget Function(BuildContext, int)? itemBuilder;
  final Function(FoodCategory)? onPressedCategory;
  final Axis direction;

  const FoodWithLoveCategoriesList.horizontal({
    Key? key,
    required this.categories,
    this.itemBuilder,
    this.onPressedCategory,
  }) : direction = Axis.horizontal;

  const FoodWithLoveCategoriesList.vertical({
    Key? key,
    required this.categories,
    this.itemBuilder,
    this.onPressedCategory,
  }) : direction = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    return direction == Axis.horizontal
        ? _horizontalBuilder()
        : _verticalBuilder();
  }

  Widget _horizontalBuilder() {
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

  Widget _verticalBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
        itemCount: categories.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          final _category = categories[index];

          return GestureDetector(
            onTap: () => onPressedCategory?.call(_category),
            child: itemBuilder != null
                ? itemBuilder!(context, index)
                : FoodWithLoveCategoriesItem(
                    category: _category,
                    fromGridView: true,
                  ),
          );
        },
      ),
    );
  }
}
