import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_with_love/enums/food_product_style.dart';
import 'package:food_with_love/models/food_product_model.dart';
import 'package:food_with_love/src/shared/app_colors.dart';

class FoodWithLoveProductItem extends StatelessWidget {
  final FoodProduct product;
  final FoodProductStyle style;

  FoodWithLoveProductItem.filled({required this.product})
      : style = FoodProductStyle.filled;
  FoodWithLoveProductItem.outlined({required this.product})
      : style = FoodProductStyle.outlined;

  @override
  Widget build(BuildContext context) {
    var _widget;
    switch (style) {
      case FoodProductStyle.filled:
        _widget = _filledBuilder();
        break;
      case FoodProductStyle.outlined:
        _widget = _outlinedBuilder();
        break;
      default:
        _widget = Container();
    }

    return _widget;
  }

  Widget _filledBuilder() {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        color: product.color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _addBtnBuilder(),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _imgBuilder(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _titleAndSubTitleBuilder(),
                  _priceBuilder(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _outlinedBuilder() {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: kcExtraLightGreenColor,
        ),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _imgBuilderOutlined(),
          SizedBox(
            height: 10.0,
          ),
          _titleAndSubTitleBuilderOutlined(),
          _priceBuilderOutlined(),
        ],
      ),
    );
  }

  Widget _addBtnBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),
          child: Icon(
            Icons.add,
            color: Colors.brown[400],
          ),
        ),
      ],
    );
  }

  Widget _imgBuilder() {
    return Center(
      child: Column(
        children: [
          CachedNetworkImage(
            width: 80.0,
            height: 80.0,
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

  Widget _imgBuilderOutlined() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: product.color,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: CachedNetworkImage(
              width: 75.0,
              height: 75.0,
              imageUrl: '${product.imgUrl}',
            ),
          ),
        ),
      ],
    );
  }

  Widget _shadowBuilder() {
    return Container(
      width: 50.0,
      height: 3.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 18.0,
          ),
        ],
      ),
    );
  }

  Widget _titleAndSubTitleBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${product.title}',
        ),
        Text(
          '${product.subTitle}',
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.brown,
          ),
        ),
      ],
    );
  }

  Widget _titleAndSubTitleBuilderOutlined() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${product.title}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${product.subTitle}',
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _priceBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rs ${product.price}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'per kg',
          style: TextStyle(
            fontSize: 10.0,
          ),
        ),
      ],
    );
  }

  Widget _priceBuilderOutlined() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rs ${product.price}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              'per kg',
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ],
        ),
        GestureDetector(
          child: Icon(
            Icons.add_circle,
            color: kcLightGreenColor,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
