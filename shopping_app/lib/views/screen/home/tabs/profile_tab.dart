import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/views/screen/home/notifications_screen.dart';
import 'package:shopping_app/views/screen/home/orders_screen.dart';
import 'package:shopping_app/views/screen/home/wishlists_screen.dart';
import 'package:shopping_app/views/widgets/shopping_cart_widgets/checkout_bottomsheet.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({Key? key}) : super(key: key);

  List<FoodWithLoveOption> options(final BuildContext context) {
    return <FoodWithLoveOption>[
      FoodWithLoveOption(
        leftIcon: Icon(
          Icons.local_shipping,
          color: Colors.grey,
        ),
        rightIcon: Icon(
          Icons.keyboard_arrow_right,
        ),
        title: 'Shipping Address',
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            isScrollControlled: true,
            builder: (context) => CheckoutBottomSheetContent(
              showingOnlyAddress: true,
            ),
          );
        },
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WishlistScreen(),
            ),
          );
        },
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderScreen(),
            ),
          );
        },
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotificationScreen(),
            ),
          );
        },
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
        onPressed: () async {
          await FWLAuthProvider.signOut();
        },
      ),
    ];
  }

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
                  options: options(context),
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
