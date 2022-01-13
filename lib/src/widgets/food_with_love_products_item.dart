import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_with_love/enums/food_product_style.dart';
import 'package:food_with_love/models/food_product_model.dart';
import 'package:food_with_love/src/shared/app_colors.dart';
import 'package:food_with_love/src/widgets/food_with_love_button.dart';

class FoodWithLoveProductItem extends StatefulWidget {
  final FoodProduct product;
  final FoodProductStyle style;

  FoodWithLoveProductItem.filled({required this.product})
      : style = FoodProductStyle.filled;
  FoodWithLoveProductItem.outlined({required this.product})
      : style = FoodProductStyle.outlined;

  @override
  _FoodWithLoveProductItemState createState() =>
      _FoodWithLoveProductItemState();
}

class _FoodWithLoveProductItemState extends State<FoodWithLoveProductItem> {
  bool _isAdding = false;
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    var _widget;
    switch (widget.style) {
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

  Widget _addBuilder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                Icons.close,
              ),
              color: Colors.brown,
              onPressed: () => setState(() => _isAdding = false),
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.add_circle,
          ),
          iconSize: 30.0,
          color: Colors.brown,
          onPressed: () => setState(() => ++_count),
        ),
        Text(
          "$_count",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.brown,
            fontSize: 16.0,
          ),
        ),
        IconButton(
          icon: Icon(Icons.remove_circle),
          color: Colors.brown,
          iconSize: 30.0,
          onPressed: () => setState(() => _count != 1 ? --_count : _count),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FoodWithLoveButton.filled(
              value: 'Bag It',
              borderRadius: 50.0,
              icon: Icon(
                Icons.shopping_bag,
                color: Colors.white,
              ),
              textStyle: TextStyle(
                color: Colors.white,
              ),
              color: Colors.brown,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  Widget _filledBuilder() {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        color: widget.product.color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: _isAdding
          ? _addBuilder()
          : Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      _imgBuilder(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _titleAndSubTitleBuilder(),
                      SizedBox(
                        height: 5.0,
                      ),
                      _priceBuilder(),
                    ],
                  ),
                ),
                _addBtnBuilder(),
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
      padding: EdgeInsets.all(_isAdding ? 0.0 : 20.0),
      child: _isAdding
          ? _addBuilder()
          : Column(
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
        GestureDetector(
          onTap: () => setState(() => _isAdding = true),
          child: Container(
            padding: const EdgeInsets.all(15.0),
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
        ),
      ],
    );
  }

  Widget _imgBuilder() {
    return Center(
      child: Column(
        children: [
          CachedNetworkImage(
            width: 110.0,
            height: 110.0,
            imageUrl: '${widget.product.imgUrl}',
          ),
        ],
      ),
    );
  }

  Widget _imgBuilderOutlined() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: widget.product.color,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: CachedNetworkImage(
              width: 100.0,
              height: 100.0,
              imageUrl: '${widget.product.imgUrl}',
            ),
          ),
        ),
      ],
    );
  }

  Widget _titleAndSubTitleBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.product.title}',
        ),
        Text(
          '${widget.product.subTitle}',
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
          '${widget.product.title}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${widget.product.subTitle}',
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
          'Rs ${widget.product.price}',
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
              'Rs ${widget.product.price}',
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
          onTap: () => setState(() => _isAdding = true),
        ),
      ],
    );
  }
}
