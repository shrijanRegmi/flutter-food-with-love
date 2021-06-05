import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';

final categories = <FoodCategory>[
  FoodCategory(
    title: 'Vegetables',
    imgUrl:
        'https://www.seekpng.com/png/full/226-2266892_vector-free-library-cartoon-vegetable-drawing-vegetables-cartoon.png',
  ),
  FoodCategory(
    title: 'Fruits',
    imgUrl:
        'https://www.pikpng.com/pngl/b/124-1240223_fruits-vegetables-artichoke-banana-berries-cabbage-healthy-food.png',
  ),
  FoodCategory(
    title: 'Dairy',
    imgUrl:
        'https://i.pinimg.com/originals/ec/ba/69/ecba69e2b175096976396f350f5aa1a5.png',
  ),
  FoodCategory(
    title: 'Drinks',
    imgUrl:
        'https://iconarchive.com/download/i49130/dapino/beach/summer-cocktails.ico',
  ),
  FoodCategory(
    title: 'Meat',
    imgUrl:
        'https://lh3.googleusercontent.com/proxy/dxOjW4kGBZ6bnCT8R3EBs7UTJuboD5FsWmU9tlPhFsHP_sgP0aLspB-AZQkKl8S1tQq3LRFctR1fN5OY4IgUUWLK4x9x0Gx-TTlvVfXxU3asq9hg8OxGetwCSDyMgmGBT_U',
  ),
  FoodCategory(
    title: 'Chocolates',
    imgUrl:
        'https://i.pinimg.com/originals/4b/e2/ec/4be2ec556162e10d0fcc2aec4f06930a.png',
  ),
];

final foodProducts = <FoodProduct>[
  FoodProduct(
    imgUrl: 'https://agroseeders.com/wp-content/uploads/2019/07/chilli.png',
    title: 'Pepper',
    subTitle: 'Gurugram Mandi Haryana',
    price: 120,
    color: Color(0xfff0aeaf),
  ),
  FoodProduct(
    imgUrl: 'https://oboureg.com/igrifowh/2020/07/red-onion.png',
    title: 'Organic Red Onion',
    subTitle: 'Gurugram Mandi Haryana',
    price: 10,
    color: Color(0xfff6e0b9),
  ),
  FoodProduct(
    imgUrl:
        'https://mucci-production-user-uploads-bucket.s3.amazonaws.com/images/Product-IMG_MiniCucumbers-rev2.original.png',
    title: 'Cucumber',
    subTitle: 'Gurugram Mandi Haryana',
    price: 5,
    color: Color(0xffcedfab),
  ),
  FoodProduct(
    imgUrl:
        'https://www.lipmanfamilyfarms.com/wp-content/uploads/2020/09/Roma-Tomato-hero@2x-1480x1330.png',
    title: 'Tomato',
    subTitle: 'Gurugram Mandi Haryana',
    price: 70,
    color: Color(0xffecbbbf),
  ),
  FoodProduct(
    imgUrl: 'https://agroseeders.com/wp-content/uploads/2019/07/chilli.png',
    title: 'Pepper',
    subTitle: 'Gurugram Mandi Haryana',
    price: 120,
    color: Color(0xfff0aeaf),
  ),
  FoodProduct(
    imgUrl: 'https://oboureg.com/igrifowh/2020/07/red-onion.png',
    title: 'Organic Red Onion',
    subTitle: 'Gurugram Mandi Haryana',
    price: 10,
    color: Color(0xfff6e0b9),
  ),
  FoodProduct(
    imgUrl:
        'https://mucci-production-user-uploads-bucket.s3.amazonaws.com/images/Product-IMG_MiniCucumbers-rev2.original.png',
    title: 'Cucumber',
    subTitle: 'Gurugram Mandi Haryana',
    price: 5,
    color: Color(0xffcedfab),
  ),
  FoodProduct(
    imgUrl:
        'https://www.lipmanfamilyfarms.com/wp-content/uploads/2020/09/Roma-Tomato-hero@2x-1480x1330.png',
    title: 'Tomato',
    subTitle: 'Gurugram Mandi Haryana',
    price: 70,
    color: Color(0xffecbbbf),
  ),
  FoodProduct(
    imgUrl: 'https://agroseeders.com/wp-content/uploads/2019/07/chilli.png',
    title: 'Pepper',
    subTitle: 'Gurugram Mandi Haryana',
    price: 120,
    color: Color(0xfff0aeaf),
  ),
  FoodProduct(
    imgUrl: 'https://oboureg.com/igrifowh/2020/07/red-onion.png',
    title: 'Organic Red Onion',
    subTitle: 'Gurugram Mandi Haryana',
    price: 10,
    color: Color(0xfff6e0b9),
  ),
  FoodProduct(
    imgUrl:
        'https://mucci-production-user-uploads-bucket.s3.amazonaws.com/images/Product-IMG_MiniCucumbers-rev2.original.png',
    title: 'Cucumber',
    subTitle: 'Gurugram Mandi Haryana',
    price: 5,
    color: Color(0xffcedfab),
  ),
  FoodProduct(
    imgUrl:
        'https://www.lipmanfamilyfarms.com/wp-content/uploads/2020/09/Roma-Tomato-hero@2x-1480x1330.png',
    title: 'Tomato',
    subTitle: 'Gurugram Mandi Haryana',
    price: 70,
    color: Color(0xffecbbbf),
  ),
];

final shoppingCarts = <FoodShoppingCart>[
  FoodShoppingCart(
    foodProduct: foodProducts[0],
    totalPrice: foodProducts[0].price,
  ),
  FoodShoppingCart(
    foodProduct: foodProducts[1],
    totalPrice: foodProducts[1].price,
  ),
  FoodShoppingCart(
    foodProduct: foodProducts[2],
    totalPrice: foodProducts[2].price,
  ),
  FoodShoppingCart(
    foodProduct: foodProducts[3],
    totalPrice: foodProducts[3].price,
  ),
];

final options = <FoodWithLoveOption>[
  FoodWithLoveOption(
    leftIcon: Icon(
      Icons.person,
      color: Colors.grey,
    ),
    rightIcon: Icon(
      Icons.keyboard_arrow_right,
    ),
    title: 'Edit Profile',
    onPressed: () {},
  ),
  FoodWithLoveOption(
    leftIcon: Icon(
      Icons.local_shipping,
      color: Colors.grey,
    ),
    rightIcon: Icon(
      Icons.keyboard_arrow_right,
    ),
    title: 'Shipping Address',
    onPressed: () {},
  ),
  FoodWithLoveOption(
    leftIcon: Icon(
      Icons.favorite,
      color: Colors.grey,
    ),
    rightIcon: Icon(
      Icons.keyboard_arrow_right,
    ),
    title: 'Wishlist',
    onPressed: () {},
  ),
  FoodWithLoveOption(
    leftIcon: Icon(
      Icons.menu_book_rounded,
      color: Colors.grey,
    ),
    rightIcon: Icon(
      Icons.keyboard_arrow_right,
    ),
    title: 'Order History',
    onPressed: () {},
  ),
  FoodWithLoveOption(
    leftIcon: Icon(
      Icons.notifications,
      color: Colors.grey,
    ),
    rightIcon: Icon(
      Icons.keyboard_arrow_right,
    ),
    title: 'Notifications',
    onPressed: () {},
  ),
  FoodWithLoveOption(
    leftIcon: Icon(
      Icons.exit_to_app,
      color: Colors.grey,
    ),
    rightIcon: Icon(
      Icons.keyboard_arrow_right,
    ),
    title: 'Log out',
    onPressed: () {},
  ),
];
