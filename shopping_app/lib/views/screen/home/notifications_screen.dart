import 'package:flutter/material.dart';
import 'package:shopping_app/viewmodels/notifications_vm.dart';
import 'package:shopping_app/viewmodels/vm_provider.dart';
import 'package:shopping_app/views/widgets/common_widgets/empty_builder.dart';
import 'package:shopping_app/views/widgets/common_widgets/filled_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VMProvider<NotificationVm>(
      vm: NotificationVm(context),
      builder: (context, vm, appVm, appUser) {
        return Scaffold(
          body: Column(
            children: [
              FilledAppbar(
                title: 'My Notifications',
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: EmptyBuilder(
                  lottieUrl: 'assets/lottie/notifications.json',
                  title: 'No items in your notifications',
                  subTitle: 'We believe this place will be crowded soon.',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
