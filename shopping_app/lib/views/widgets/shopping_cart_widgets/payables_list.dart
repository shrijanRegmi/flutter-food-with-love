import 'package:flutter/material.dart';
import 'package:shopping_app/views/widgets/shopping_cart_widgets/payable_item.dart';

class PayablesList extends StatelessWidget {
  final int productTotal;
  final int deliveryCharge;
  const PayablesList({
    Key? key,
    required this.productTotal,
    required this.deliveryCharge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payable',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            PayableItem(
              title: 'Product Total',
              subTitle: 'Rs $productTotal',
            ),
            PayableItem(
              title: 'Delivery Charge',
              subTitle: 'Rs $deliveryCharge',
            ),
            PayableItem(
              title: 'Total Payable',
              subTitle: 'Rs ${productTotal + deliveryCharge}',
              bold: true,
            ),
          ],
        ),
      ],
    );
  }
}
