import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/test_data.dart';
import 'package:shopping_app/viewmodels/view_all_categories_vm.dart';
import 'package:shopping_app/viewmodels/vm_provider.dart';

class ViewAllCategoriesScreen extends StatelessWidget {
  const ViewAllCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VMProvider<ViewAllCategoriesVm>(
      vm: ViewAllCategoriesVm(context),
      builder: (context, vm, appVm, appUser) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                _headerBuilder(context),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: FoodWithLoveCategoriesList.vertical(
                      categories: categories,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _headerBuilder(final BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          left: 0.0,
          right: 0.0,
          child: Center(
            child: FoodWithLoveHeader(title: 'Categories'),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: IconButton(
              splashRadius: 30.0,
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
