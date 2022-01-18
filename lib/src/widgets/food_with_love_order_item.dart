import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:food_with_love/src/widgets/food_with_love_order_progress.dart';
import 'package:timeago/timeago.dart' as timeAgo;

class FoodWithLoveOrderItem extends StatelessWidget {
  final FoodOrder order;
  const FoodWithLoveOrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 15.0, right: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Column(
          children: [
            _dateBuilder(),
            SizedBox(
              height: 10.0,
            ),
            _priceBuilder(),
            SizedBox(
              height: 20.0,
            ),
            FoodWithLoveOrderProgress(
              status: order.orderStatus ?? OrderStatus.none,
            ),
            SizedBox(
              height: 50.0,
            ),
            _actionButtonsBuilder(context),
          ],
        ),
      ),
    );
  }

  Widget _dateBuilder() {
    return Row(
      children: [
        Text(
          'Order Id: ${order.id}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
        ),
        SizedBox(
          width: 15.0,
        ),
        if (order.createdAt != null)
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 15.0,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                timeAgo.format(
                  DateTime.fromMillisecondsSinceEpoch(order.createdAt!),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                ),
              )
            ],
          ),
      ],
    );
  }

  Widget _priceBuilder() {
    return Row(
      children: [
        Text(
          'Rs ${(order.productTotal ?? 0) + (order.deliveryCharge ?? 0)}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25.0,
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: kcGreyColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
          child: Text(
            '${order.foodProducts?.length} ${(order.foodProducts?.length ?? 0) == 1 ? 'Item' : 'Items'}',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _actionButtonsBuilder(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.close_rounded,
              color: kcDarkGreyColor.withOpacity(0.6),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              'Cancel Order',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: kcDarkGreyColor.withOpacity(0.6),
              ),
            ),
          ],
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          // onTap: () => DialogProvider(context).showNormalDialog(
          //   widget: _showInfoDialogContent(context),
          // ),
          child: Row(
            children: [
              Text(
                'Order Details',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: kcDarkGreyColor.withOpacity(0.6),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              Icon(
                Icons.menu_book_rounded,
                color: kcDarkGreyColor.withOpacity(0.6),
              )
            ],
          ),
        )
      ],
    );
  }

  // Widget _showInfoDialogContent(final BuildContext context) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.only(
  //           top: 15.0,
  //           left: 20.0,
  //           right: 20.0,
  //         ),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Row(
  //               children: [
  //                 SvgPicture.asset(
  //                   'assets/svgs/order_details.svg',
  //                 ),
  //                 SizedBox(
  //                   width: 8.0,
  //                 ),
  //                 Text(
  //                   '4 Items',
  //                   style: TextStyle(
  //                     fontSize: 12.0,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             GestureDetector(
  //               behavior: HitTestBehavior.opaque,
  //               onTap: () => Navigator.pop(context),
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(8.0),
  //                   color: kcRedColor,
  //                 ),
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 10.0,
  //                   vertical: 2.0,
  //                 ),
  //                 child: Row(
  //                   children: [
  //                     Icon(
  //                       Icons.close_rounded,
  //                       color: Colors.white,
  //                       size: 20.0,
  //                     ),
  //                     SizedBox(
  //                       width: 1.0,
  //                     ),
  //                     Text(
  //                       'Cancel',
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.w600,
  //                         color: Colors.white,
  //                         fontSize: 12.0,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       _productItem(),
  //       _productItem(),
  //       _productItem(),
  //       Divider(),
  //       Padding(
  //         padding: const EdgeInsets.only(bottom: 15.0, left: 20.0, right: 20.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: [
  //             Text(
  //               'Total',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.w600,
  //                 fontSize: 12.0,
  //                 color: kcGreyColor,
  //               ),
  //             ),
  //             SizedBox(
  //               width: 5.0,
  //             ),
  //             Text(
  //               'Rs. 600',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _productItem() {
  //   return Column(
  //     children: [
  //       Divider(),
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Row(
  //               children: [
  //                 Image.asset(
  //                   'assets/images/prod_fulkopi.png',
  //                   height: 37.0,
  //                 ),
  //                 SizedBox(
  //                   width: 5.0,
  //                 ),
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       'Fulkopi',
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.w600,
  //                         fontSize: 12.0,
  //                       ),
  //                     ),
  //                     Text(
  //                       'Rs. 150 Per Each',
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.w600,
  //                         fontSize: 10.0,
  //                         color: kcGreyColor,
  //                       ),
  //                     ),
  //                   ],
  //                 )
  //               ],
  //             ),
  //             Text(
  //               'One Kg',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.w600,
  //                 fontSize: 12.0,
  //               ),
  //             ),
  //             Text(
  //               'Rs 150',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.w600,
  //                 fontSize: 12.0,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
