import 'package:flutter/material.dart';
import 'package:food_with_love/src/shared/app_colors.dart';

class FoodWithLoveTabbar extends StatefulWidget {
  final TabController controller;
  final List<Widget> Function(int) tabs;
  final Color? bgColor;
  const FoodWithLoveTabbar({
    Key? key,
    required this.controller,
    required this.tabs,
    this.bgColor,
  }) : super(key: key);

  @override
  _FoodWithLoveTabbarState createState() => _FoodWithLoveTabbarState();
}

class _FoodWithLoveTabbarState extends State<FoodWithLoveTabbar> {
  late int _activeIndex;

  @override
  void initState() {
    super.initState();
    _activeIndex = widget.controller.index;
  }

  void _onPressedTab(final int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bgColor ?? kcMediumBlackColor,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: TabBar(
        indicatorColor: Colors.transparent,
        controller: widget.controller,
        tabs: widget.tabs(_activeIndex),
        onTap: _onPressedTab,
      ),
    );
  }
}
