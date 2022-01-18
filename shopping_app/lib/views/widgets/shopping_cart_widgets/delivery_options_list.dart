import 'package:flutter/material.dart';
import 'package:food_with_love/enums/delivery_timing.dart';
import 'package:shopping_app/views/widgets/shopping_cart_widgets/delivery_option_item.dart';

class DeliveryOptionsList extends StatefulWidget {
  final Function(DeliveryTiming)? onPressed;
  const DeliveryOptionsList({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  State<DeliveryOptionsList> createState() => _DeliveryOptionsListState();
}

class _DeliveryOptionsListState extends State<DeliveryOptionsList> {
  int _activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: DeliveryOptionItem(
            title: 'Today',
            subTitle: 'Rs 50',
            expressDelivery: true,
            onPressed: () {
              setState(() => _activeIndex = 0);
              widget.onPressed?.call(DeliveryTiming.today);
            },
            active: _activeIndex == 0,
          ),
        ),
        SizedBox(
          width: 6.0,
        ),
        Expanded(
          child: DeliveryOptionItem(
            title: 'Tomorrow',
            subTitle: 'Rs 20',
            expressDelivery: true,
            onPressed: () {
              setState(() => _activeIndex = 1);
              widget.onPressed?.call(DeliveryTiming.tomorrow);
            },
            active: _activeIndex == 1,
          ),
        ),
        SizedBox(
          width: 6.0,
        ),
        Expanded(
          child: DeliveryOptionItem(
            title: '1-2 Days',
            subTitle: 'Delivery Free',
            onPressed: () {
              setState(() => _activeIndex = 2);
              widget.onPressed?.call(DeliveryTiming.other);
            },
            active: _activeIndex == 2,
          ),
        ),
      ],
    );
  }
}
