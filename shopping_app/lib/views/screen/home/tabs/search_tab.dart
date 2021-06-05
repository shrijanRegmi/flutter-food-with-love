import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        FoodWithLoveHeader(title: 'Search'),
        SizedBox(
          height: 20.0,
        ),
        FoodWithLoveSearchBar(),
        SizedBox(
          height: 50.0,
        ),
        FoodWithLoveLeftRightText(
          leftText: 'Last Searches',
          rightText: 'Clear All',
          onPressed: () {},
        ),
      ],
    );
  }
}
