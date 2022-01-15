import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:food_with_love/src/shared/app_colors.dart';

class FoodWithLoveShoppingCartItem extends StatefulWidget {
  final FoodShoppingCart shoppingCart;
  final Function(int) onQuantityUpdate;
  final Function(FoodShoppingCart)? onPressRemove;
  const FoodWithLoveShoppingCartItem({
    Key? key,
    required this.shoppingCart,
    required this.onQuantityUpdate,
    this.onPressRemove,
  }) : super(key: key);

  @override
  _FoodWithLoveShoppingCartItemState createState() =>
      _FoodWithLoveShoppingCartItemState();
}

class _FoodWithLoveShoppingCartItemState
    extends State<FoodWithLoveShoppingCartItem> {
  int _count = 1;

  @override
  void initState() {
    super.initState();
    setState(() {
      _count = widget.shoppingCart.quantity ?? 1;
    });
  }

  @override
  void didUpdateWidget(FoodWithLoveShoppingCartItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _count = widget.shoppingCart.quantity ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 180.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: kcExtraLightGreyColor,
            ),
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: _imgBuilder(),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _titleAndIdBuilder(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _priceBuilder(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: _addRemoveBuilder(),
          ),
          Positioned(
            top: -12.0,
            left: 20.0,
            child: _removeItemBuilder(),
          ),
        ],
      ),
    );
  }

  Widget _imgBuilder() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: widget.shoppingCart.foodProduct?.color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: CachedNetworkImage(
          width: 100.0,
          height: 100.0,
          imageUrl: '${widget.shoppingCart.foodProduct?.imgUrl}',
        ),
      ),
    );
  }

  Widget _titleAndIdBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.shoppingCart.foodProduct?.title}'.toUpperCase(),
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'ID: ${widget.shoppingCart.id}'.toUpperCase(),
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
          'Rs ${widget.shoppingCart.foodProduct?.price}',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'per kg',
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }

  Widget _addRemoveBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            setState(() => _count != 1 ? --_count : 1);
            widget.onQuantityUpdate(_count);
          },
          child: Container(
            width: 40.0,
            height: 35.0,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
              ),
            ),
            child: Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 1.0,
        ),
        Container(
          width: 40.0,
          height: 35.0,
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Center(
            child: Text(
              '$_count',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 1.0,
        ),
        GestureDetector(
          onTap: () {
            setState(() => ++_count);
            widget.onQuantityUpdate(_count);
          },
          child: Container(
            width: 40.0,
            height: 35.0,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _removeItemBuilder() {
    return GestureDetector(
      onTap: () => widget.onPressRemove?.call(widget.shoppingCart),
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: kcPrimaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 3.0,
          horizontal: 8.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.close,
              size: 18.0,
              color: Colors.white,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              'Remove',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
