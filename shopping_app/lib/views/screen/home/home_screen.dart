import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/views/screen/home/tabs/explore_tab.dart';
import 'package:shopping_app/views/screen/home/tabs/favourites_tab.dart';
import 'package:shopping_app/views/screen/home/tabs/profile_tab.dart';
import 'package:shopping_app/views/screen/home/tabs/search_tab.dart';
import 'package:shopping_app/views/screen/home/tabs/shopping_cart_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 5,
      vsync: this,
      initialIndex: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FoodWithLoveTabview(
          controller: _controller,
          views: [
            SearchTab(),
            FavouritesTab(),
            ExploreTab(),
            ShoppingCartTab(),
            ProfileTab(),
          ],
        ),
      ),
      bottomNavigationBar: FoodWithLoveTabbar(
        controller: _controller,
        tabs: (activIndex) => [
          FoodWithLoveIconButton(
            icon: Icons.search_outlined,
            bgColor: activIndex == 0 ? Colors.pink : null,
            iconColor: activIndex == 0 ? Colors.white : null,
          ),
          FoodWithLoveIconButton(
            icon: Icons.favorite_border,
            iconColor: activIndex == 1 ? Colors.white : null,
            bgColor: activIndex == 1 ? Colors.pink : null,
          ),
          FoodWithLoveIconButton(
            icon: Icons.home_outlined,
            iconColor: activIndex == 2 ? Colors.white : null,
            bgColor: activIndex == 2 ? Colors.pink : null,
          ),
          FoodWithLoveIconButton(
            icon: Icons.shopping_cart_outlined,
            iconColor: activIndex == 3 ? Colors.white : null,
            bgColor: activIndex == 3 ? Colors.pink : null,
          ),
          FoodWithLoveIconButton(
            icon: Icons.person_outline,
            iconColor: activIndex == 4 ? Colors.white : null,
            bgColor: activIndex == 4 ? Colors.pink : null,
          ),
        ],
      ),
    );
  }
}
