import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/viewmodels/view_product_vm.dart';
import 'package:shopping_app/viewmodels/vm_provider.dart';

class ViewProductScreen extends StatelessWidget {
  final FoodProduct product;
  const ViewProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appUser = Provider.of<FoodWithLoveUser>(context);

    return VMProvider<ViewProductVm>(
      vm: ViewProductVm(context, product),
      onInit: (vm) => vm.onInit(_appUser),
      builder: (context, vm, appVm, appUser) {
        return Scaffold(
          backgroundColor: product.color,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  FoodWithLoveCarousel(
                    imgUrls: [
                      product.imgUrl,
                      product.imgUrl,
                      product.imgUrl,
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _detailsBuilder(context, vm),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _detailsBuilder(final BuildContext context, final ViewProductVm vm) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          _titleAndDescriptionBuilder(vm),
          FoodWithLoveLeftRightText(
            leftText: 'Similar',
            rightText: 'View All',
            onPressed: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          FoodWithLoveSimilarProductsList(
            products: [],
            onPressProduct: (product) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewProductScreen(
                  product: product,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }

  Widget _favouriteBuilder(final ViewProductVm vm) {
    return IconButton(
      onPressed: () {
        if (!vm.iconActive) {
          vm.addToWishList();
        } else {
          vm.removeFromWishList();
        }
      },
      icon: Icon(
        vm.iconActive ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
        size: 30.0,
      ),
    );
  }

  Widget _titleAndDescriptionBuilder(final ViewProductVm vm) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodWithLoveText.heading1(
                    '${product.title}',
                  ),
                  FoodWithLoveText.heading5(
                    'Rs ${product.price} per kg',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              _favouriteBuilder(vm),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          FoodWithLoveText.body(
            '${product.description}',
            expandTextLength: 400,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
