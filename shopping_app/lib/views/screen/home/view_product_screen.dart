import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/test_data.dart';
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
    return VMProvider<ViewProductVm>(
      vm: ViewProductVm(context, product),
      onInit: (vm) => vm.onInit(),
      builder: (context, vm, appUser) {
        return Scaffold(
          backgroundColor: product.color,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  _imgBuilder(context),
                  SizedBox(
                    height: 50.0,
                  ),
                  _detailsBuilder(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _imgBuilder(final BuildContext context) {
    return Center(
      child: Column(
        children: [
          CachedNetworkImage(
            width: MediaQuery.of(context).size.width / 2.0,
            height: MediaQuery.of(context).size.width / 2.0,
            imageUrl: '${product.imgUrl}',
          ),
          SizedBox(
            height: 15.0,
          ),
          _shadowBuilder(),
        ],
      ),
    );
  }

  Widget _shadowBuilder() {
    return Container(
      width: 80.0,
      height: 3.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 25.0,
          ),
        ],
      ),
    );
  }

  Widget _detailsBuilder(final BuildContext context) {
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
          _titleAndDescriptionBuilder(),
          FoodWithLoveLeftRightText(
            leftText: 'Similar',
            rightText: 'View All',
            onPressed: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          FoodWithLoveSimilarProductsList(
            products: foodProducts.sublist(0, 10),
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

  Widget _titleAndDescriptionBuilder() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FoodWithLoveText.heading3(
            '${product.title}',
          ),
          FoodWithLoveText.heading4(
            'Rs ${product.price} per kg',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          FoodWithLoveText.body(
            '${product.description}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
