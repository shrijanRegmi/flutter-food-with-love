import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/viewmodels/order_vm.dart';
import 'package:shopping_app/viewmodels/vm_provider.dart';
import 'package:shopping_app/views/widgets/common_widgets/filled_appbar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VMProvider<OrderVm>(
      vm: OrderVm(context),
      builder: (context, vm, appVm, appUser) {
        return Scaffold(
          backgroundColor: Color(0xffEEEEEE),
          body: Column(
            children: [
              FilledAppbar(
                title: 'My Orders',
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: FoodWithLoveOrdersList(
                    orders: vm.orders,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
