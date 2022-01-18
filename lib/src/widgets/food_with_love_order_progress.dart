import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';

class FoodWithLoveOrderProgress extends StatelessWidget {
  final OrderStatus status;
  const FoodWithLoveOrderProgress({
    Key? key,
    required this.status,
  }) : super(key: key);

  final _roundSize = 10.0;

  double _getValue() {
    switch (status) {
      case OrderStatus.processed:
        return 0.1;
      case OrderStatus.packed:
        return 0.5;
      case OrderStatus.delivered:
        return 1;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _progresBarBuilder(context),
        Positioned(
          left: 0.0,
          right: 0.0,
          top: -(_roundSize - 2.0),
          child: _roundBuilder(),
        ),
      ],
    );
  }

  Widget _progresBarBuilder(final BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 5.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: kcGreyColor,
          ),
        ),
        LayoutBuilder(
          builder: (context, c) {
            return Container(
              height: 5.0,
              width: c.maxWidth * _getValue(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: kcPrimaryColor,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _roundBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _roundItemBuilder(
          title: 'Processed',
          active: status == OrderStatus.processed ||
              status == OrderStatus.packed ||
              status == OrderStatus.delivered,
        ),
        _roundItemBuilder(
          title: 'Packed',
          active:
              status == OrderStatus.packed || status == OrderStatus.delivered,
        ),
        _roundItemBuilder(
          title: 'Delivered',
          active: status == OrderStatus.delivered,
        ),
      ],
    );
  }

  Widget _roundItemBuilder({
    required final String title,
    required final bool active,
  }) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: active ? kcPrimaryColor : kcGreyColor,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(_roundSize),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 10.0,
            color: kcDarkGreyColor.withOpacity(0.6),
          ),
        )
      ],
    );
  }
}
