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
    description:
        'Rich source of Vitamin C: Red chillies are jam-packed with Vitamin C that helps in supporting the immune system and combat chronic diseases. Prevents heart ailments: There are very powerful antioxidants in red chilli that help in clearing blockages in blood vessels and arteries.',
    price: 120,
    color: Color(0xfff0aeaf),
  ),
  FoodProduct(
    imgUrl: 'https://oboureg.com/igrifowh/2020/07/red-onion.png',
    title: 'Organic Red Onion',
    subTitle: 'Gurugram Mandi Haryana',
    description:
        'Red onions (also known as purple onions in some European countries) are cultivars of the onion (Allium cepa), and have purplish-red skin and white flesh tinged with red. ... These onions tend to be medium to large in size and have a sharp flavor and eye-watering qualities.',
    price: 10,
    color: Color(0xfff6e0b9),
  ),
  FoodProduct(
    imgUrl:
        'https://mucci-production-user-uploads-bucket.s3.amazonaws.com/images/Product-IMG_MiniCucumbers-rev2.original.png',
    title: 'Cucumber',
    subTitle: 'Gurugram Mandi Haryana',
    description:
        'Cucumbers have a mild, refreshing taste and a high water content. ... The cucumber is a member of the Cucurbitaceae family. Other members of the family include squash and different kinds of melon, including bitter melon. Cucumbers provide various nutrients but are low in calories, fat, cholesterol, and sodium.',
    price: 5,
    color: Color(0xffcedfab),
  ),
  FoodProduct(
    imgUrl:
        'https://www.lipmanfamilyfarms.com/wp-content/uploads/2020/09/Roma-Tomato-hero@2x-1480x1330.png',
    title: 'Tomato',
    subTitle: 'Gurugram Mandi Haryana',
    description:
        'The tomato is the edible berry of the plant Solanum lycopersicum, commonly known as a tomato plant. The species originated in western South America and Central America. The Nahuatl word tomatl gave rise to the Spanish word tomate, from which the English word tomato derived',
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
  ),
  FoodShoppingCart(
    foodProduct: foodProducts[1],
  ),
  FoodShoppingCart(
    foodProduct: foodProducts[2],
  ),
  FoodShoppingCart(
    foodProduct: foodProducts[3],
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
