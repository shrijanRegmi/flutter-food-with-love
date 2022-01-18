import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';

class DeliveryOptionItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool expressDelivery;
  final Function()? onPressed;
  final bool active;
  const DeliveryOptionItem({
    Key? key,
    required this.title,
    required this.subTitle,
    this.expressDelivery = false,
    this.onPressed,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: active ? kcPrimaryColor : kcGreyColor,
            width: 1.5,
          ),
        ),
        child: Stack(
          children: [
            Center(child: _contentBuilder()),
            if (active)
              Positioned(
                right: -8.0,
                top: -8.0,
                child: _activeIconBuilder(),
              )
          ],
        ),
      ),
    );
  }

  Widget _contentBuilder() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 10.0,
            right: 10.0,
          ),
          child: Image.asset(
            'assets/images/${expressDelivery ? 'express_delivery' : 'normal_delivery'}.png',
            height: 50.0,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        expressDelivery
            ? Container(
                decoration: BoxDecoration(
                  color: kcGreyColor,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 2.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 15.0,
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            : Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
        SizedBox(
          height: 2.0,
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: expressDelivery ? kcPrimaryColor : Colors.grey,
            fontSize: expressDelivery ? 16.0 : 12.0,
          ),
        ),
        SizedBox(
          height: expressDelivery ? 3.0 : 14.0,
        ),
      ],
    );
  }

  Widget _activeIconBuilder() {
    return Container(
      decoration: BoxDecoration(
        color: kcPrimaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60.0),
          bottomLeft: Radius.circular(40.0),
        ),
      ),
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 10.0,
        right: 10.0,
        bottom: 10.0,
      ),
      child: Icon(
        Icons.check_rounded,
        color: Colors.white,
        size: 20.0,
      ),
    );
  }
}
