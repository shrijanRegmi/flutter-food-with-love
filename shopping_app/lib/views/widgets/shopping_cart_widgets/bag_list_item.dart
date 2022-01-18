import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';

class BagItem extends StatelessWidget {
  const BagItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 30.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _productInfoBuilder(),
              SizedBox(
                width: 30.0,
              ),
              _priceBuilder(),
            ],
          ),
          Positioned(
            left: 20.0,
            top: -10.0,
            child: _removeButtonBuilder(),
          ),
        ],
      ),
    );
  }

  Widget _productInfoBuilder() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        child: Row(
          children: [
            _imgBuilder(),
            SizedBox(
              width: 20.0,
            ),
            _productTitleBuilder(),
          ],
        ),
      ),
    );
  }

  Widget _imgBuilder() {
    return Image.asset(
      'assets/images/prod_pepsodent.png',
      height: 101.0,
    );
  }

  Widget _productTitleBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pepsodent 2 in 1',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Rs 25',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: kcGreenColor,
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Text(
                'Per Each',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10.0,
                  color: kcGreyColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: kcGreyColor,
          ),
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
          child: Text(
            '2 Packets',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: kcGreyColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _priceBuilder() {
    return Column(
      children: [
        Text(
          'Rs 125',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
        Text(
          'Rs 180',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
            color: kcGreyColor,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }

  Widget _removeButtonBuilder() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: kcRedColor,
      ),
      padding: const EdgeInsets.fromLTRB(5.0, 1.0, 7.0, 1.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.close,
            color: Colors.white,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            'Remove',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
