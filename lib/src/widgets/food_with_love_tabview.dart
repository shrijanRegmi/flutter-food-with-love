import 'package:flutter/material.dart';

class FoodWithLoveTabview extends StatelessWidget {
  final TabController controller;
  final List<Widget> views;
  const FoodWithLoveTabview({
    Key? key,
    required this.controller,
    required this.views,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: controller,
      children: views,
    );
  }
}
