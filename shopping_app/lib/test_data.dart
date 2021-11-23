import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';

final categories = <FoodCategory>[
  FoodCategory(
    id: "12345",
    title: 'Vegetables',
    imgUrl:
        'https://www.seekpng.com/png/full/226-2266892_vector-free-library-cartoon-vegetable-drawing-vegetables-cartoon.png',
  ),
  FoodCategory(
    id: "12345",
    title: 'Fruits',
    imgUrl:
        'https://www.pikpng.com/pngl/b/124-1240223_fruits-vegetables-artichoke-banana-berries-cabbage-healthy-food.png',
  ),
  FoodCategory(
    id: "12345",
    title: 'Dairy',
    imgUrl:
        'https://i.pinimg.com/originals/ec/ba/69/ecba69e2b175096976396f350f5aa1a5.png',
  ),
  FoodCategory(
    id: "12345",
    title: 'Drinks',
    imgUrl:
        'https://iconarchive.com/download/i49130/dapino/beach/summer-cocktails.ico',
  ),
  FoodCategory(
    id: "12345",
    title: 'Meat',
    imgUrl:
        'https://lh3.googleusercontent.com/proxy/dxOjW4kGBZ6bnCT8R3EBs7UTJuboD5FsWmU9tlPhFsHP_sgP0aLspB-AZQkKl8S1tQq3LRFctR1fN5OY4IgUUWLK4x9x0Gx-TTlvVfXxU3asq9hg8OxGetwCSDyMgmGBT_U',
  ),
  FoodCategory(
    id: "12345",
    title: 'Chocolates',
    imgUrl:
        'https://i.pinimg.com/originals/4b/e2/ec/4be2ec556162e10d0fcc2aec4f06930a.png',
  ),
];

final foodProducts = <FoodProduct>[
  FoodProduct(
    id: '',
    imgUrl: 'https://agroseeders.com/wp-content/uploads/2019/07/chilli.png',
    title: 'Pepper',
    subTitle: 'Gurugram Mandi Haryana',
    description:
        'Rich source of Vitamin C: Red chillies are jam-packed with Vitamin C that helps in supporting the immune system and combat chronic diseases. Prevents heart ailments: There are very powerful antioxidants in red chilli that help in clearing blockages in blood vessels and arteries.',
    price: 120,
    shippingPrice: 20,
    quantity: 1,
    category: categories[0],
    color: Color(0xfff0aeaf),
    popular: true,
    views: 0,
  ),
  FoodProduct(
    id: '',
    imgUrl: 'https://oboureg.com/igrifowh/2020/07/red-onion.png',
    title: 'Organic Red Onion',
    subTitle: 'Gurugram Mandi Haryana',
    description:
        'Red onions (also known as purple onions in some European countries) are cultivars of the onion (Allium cepa), and have purplish-red skin and white flesh tinged with red. ... These onions tend to be medium to large in size and have a sharp flavor and eye-watering qualities.',
    price: 10,
    shippingPrice: 20,
    quantity: 1,
    category: categories[0],
    color: Color(0xfff6e0b9),
    popular: true,
    views: 0,
  ),
  FoodProduct(
    id: "",
    imgUrl:
        'https://mucci-production-user-uploads-bucket.s3.amazonaws.com/images/Product-IMG_MiniCucumbers-rev2.original.png',
    title: 'Cucumber',
    subTitle: 'Gurugram Mandi Haryana',
    description:
        'Cucumbers have a mild, refreshing taste and a high water content. ... The cucumber is a member of the Cucurbitaceae family. Other members of the family include squash and different kinds of melon, including bitter melon. Cucumbers provide various nutrients but are low in calories, fat, cholesterol, and sodium.',
    price: 5,
    shippingPrice: 20,
    quantity: 1,
    category: categories[0],
    color: Color(0xffcedfab),
    popular: true,
    views: 0,
  ),
  FoodProduct(
    id: "",
    imgUrl:
        'https://www.lipmanfamilyfarms.com/wp-content/uploads/2020/09/Roma-Tomato-hero@2x-1480x1330.png',
    title: 'Tomato',
    subTitle: 'Gurugram Mandi Haryana',
    description:
        'The tomato is the edible berry of the plant Solanum lycopersicum, commonly known as a tomato plant. The species originated in western South America and Central America. The Nahuatl word tomatl gave rise to the Spanish word tomate, from which the English word tomato derived',
    price: 70,
    shippingPrice: 20,
    quantity: 1,
    category: categories[0],
    color: Color(0xffecbbbf),
    popular: true,
    views: 0,
  ),
  FoodProduct(
    id: "",
    imgUrl:
        'https://cdn.forestessentialsindia.com/blog/wp-content/uploads/2020/02/potato-Starch-.png',
    title: 'Potato',
    subTitle: 'Gurugram Mandi Haryana',
    description:
        'Potatoes are edible tubers, available worldwide and all year long. They are relatively cheap to grow, rich in nutrients, and they can make a delicious treat.The humble potato has fallen in popularity in recent years, due to the interest in low-carb foods. However, the fiber, vitamins, minerals, and phytochemicals it provides can help ward off disease and benefit human health. Potatoes were first domesticated in the Andes in South America up to 10,000 years ago. Spanish explorers introduced them to Europe in the early 16th century. They are now the biggest vegetable crop in the United States (U.S.), where the average person eats 55 pounds, or 25 kilograms (kg) of potatoes every year. They are an important staple food in many countries around the world.',
    price: 60,
    shippingPrice: 20,
    quantity: 1,
    category: categories[0],
    color: Color(0xffecbbbf),
    popular: true,
    views: 0,
  ),
  FoodProduct(
    id: "",
    imgUrl:
        'https://static.wixstatic.com/media/2cd43b_7461dee11d924b689ca8596010564523~mv2.png/v1/fill/w_320,h_276,q_90/2cd43b_7461dee11d924b689ca8596010564523~mv2.png',
    title: 'Banana',
    subTitle: 'Gurugram Mandi Haryana',
    description:
        'Banana, fruit of the genus Musa, of the family Musaceae, one of the most important fruit crops of the world. The banana is grown in the tropics, and, though it is most widely consumed in those regions, it is valued worldwide for its flavour, nutritional value, and availability throughout the year. Cavendish, or dessert, bananas are most commonly eaten fresh, though they may be fried or mashed and chilled in pies or puddings. They may also be used to flavour muffins, cakes, or breads. Cooking varieties, or plantains, are starchy rather than sweet and are grown extensively as a staple food source in tropical regions; they are cooked when ripe or immature. A ripe fruit contains as much as 22 percent of carbohydrate and is high in dietary fibre, potassium, manganese, and vitamins B6 and C.',
    price: 120,
    shippingPrice: 12,
    quantity: 1,
    category: categories[0],
    color: Color(0xffecbbbf),
    popular: true,
    views: 0,
  ),
  FoodProduct(
    id: "",
    imgUrl: 'https://www.onapples.com/uploads/varieties/3y3v9tyf8h96.png',
    title: 'Apple',
    subTitle: 'Gurugram Mandi Haryana',
    description:
        'Apples are a popular fruit, containing antioxidants, vitamins, dietary fiber, and a range of other nutrients. Due to their varied nutrient content, they may help prevent several health conditions. Apples come in a variety of shapes, colors, and flavors and provide a range of nutrients that can benefit many different aspects of a person’s health. For example, they may help reduce the risk of cancer, obesity, heart disease, diabetes, and several other conditions.',
    price: 60,
    shippingPrice: 20,
    quantity: 1,
    category: categories[0],
    color: Color(0xffecbbbf),
    popular: true,
    views: 0,
  ),
  FoodProduct(
    id: "",
    imgUrl:
        'https://www.howmuchisin.com/produce_converters_app/vegetables_large/egg.png',
    title: 'Egg',
    subTitle: 'Gurugram Mandi Haryana',
    description:
        'Eggs are laid by female animals of many different species, including birds, reptiles, amphibians, a few mammals, and fish, and many of these have been eaten by humans for thousands of years. Bird and reptile eggs consist of a protective eggshell, albumen, and vitellus, contained within various thin membranes.',
    price: 60,
    shippingPrice: 20,
    quantity: 1,
    category: categories[0],
    color: Color(0xffecbbbf),
    popular: true,
    views: 0,
  ),
  FoodProduct(
    id: "",
    imgUrl:
        'https://www.dole.com/-/media/project/dole/produce-images/fruit/pineapple_cut_web.png?h=540&w=720&rev=7b07a669415341b486c4d98d1d0e3fef&hash=617F73388B779ABF9F0F256B22F7FA17',
    title: 'Pineapple',
    subTitle: 'Gurugram Mandi Haryana',
    description:
        'Pineapple, (Ananas comosus), perennial plant of the family Bromeliaceae and its edible fruit. Pineapple is native to tropical and subtropical America and has been introduced elsewhere. The fruit has become a characteristic ingredient in the meat, vegetable, fish, and rice dishes of what is loosely termed Pan-Asian cuisine. The fruit is eaten fresh where available and in canned form worldwide. In the United States and in Europe it is sometimes used as a pastry filling or in baked desserts.',
    price: 60,
    shippingPrice: 20,
    quantity: 1,
    category: categories[0],
    color: Color(0xffecbbbf),
    popular: true,
    views: 0,
  ),
  FoodProduct(
    id: "",
    imgUrl:
        'https://lh3.googleusercontent.com/proxy/v3c_cRVLwwQOzGTr4nVo5cfXJabG7A3X5HQvZivjpbrjNNdM8NFYYqza2LIrIDj6C_YEd5qedkVgsCIi5zkpIQXgGTwADIltIo166Xj4F3xJrFDRToD71pmqfg',
    title: 'Orange',
    subTitle: 'Gurugram Mandi Haryana',
    description:
        'Oranges are a type of low calorie, highly nutritious citrus fruit. As part of a healthful and varied diet, oranges contribute to strong, clear skin and can help lower a person’s risk of many conditions. Oranges are popular due to their natural sweetness, the many different types available, and the diversity of uses. For example, a person can consume them in juices and marmalades, eat them whole, or use zested peel to add a tangy flavor to cakes and desserts. This popular citrus fruit is particularly known for its vitamin C content. However, oranges contain a range of other plant compounds and antioxidants that may reduce inflammation and work against disease.',
    price: 60,
    shippingPrice: 20,
    quantity: 1,
    category: categories[0],
    color: Color(0xffecbbbf),
    popular: true,
    views: 0,
  ),
];

final shoppingCarts = <FoodShoppingCart>[
  FoodShoppingCart(
    id: "12345",
    uid: "abcde",
    foodProduct: foodProducts[0],
  ),
  FoodShoppingCart(
    id: "12345",
    uid: "abcde",
    foodProduct: foodProducts[1],
  ),
  FoodShoppingCart(
    id: "12345",
    uid: "abcde",
    foodProduct: foodProducts[2],
  ),
  FoodShoppingCart(
    id: "12345",
    uid: "abcde",
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
