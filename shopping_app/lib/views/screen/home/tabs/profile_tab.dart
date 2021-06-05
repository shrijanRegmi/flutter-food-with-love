import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/test_data.dart';

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
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                _userDetailsBuilder(context),
                SizedBox(
                  height: 30.0,
                ),
                FoodWithLoveOptionsList(
                  options: options,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _userDetailsBuilder(final BuildContext context) {
    return Column(
      children: [
        FoodWithLoveAvatar.bordered(
          size: MediaQuery.of(context).size.width / 2,
          photoUrl:
              'https://images.unsplash.com/photo-1557862921-37829c790f19?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWFufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
          border: Border.all(
            color: Colors.white,
            width: 10.0,
          ),
          shadow: BoxShadow(
            color: Colors.black12,
            blurRadius: 15.0,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Shrijan Regmi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 5.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Active Status',
              style: TextStyle(
                fontSize: 12.0,
              ),
            )
          ],
        ),
      ],
    );
  }
}
