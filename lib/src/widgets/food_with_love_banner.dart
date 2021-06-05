import 'package:flutter/material.dart';

class FoodWithLoveBanner extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const FoodWithLoveBanner({
    Key? key,
    this.title = 'Food with Love',
    this.subTitle = 'Food that is cooked with love and passion',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "$title",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50.0,
              fontFamily: 'Pacifico',
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "$subTitle",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
