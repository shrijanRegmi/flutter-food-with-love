import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        FoodWithLoveHeader(title: 'Profile'),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
