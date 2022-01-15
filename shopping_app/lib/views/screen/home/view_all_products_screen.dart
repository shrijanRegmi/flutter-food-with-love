import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/viewmodels/view_all_products_vm.dart';
import 'package:shopping_app/viewmodels/vm_provider.dart';
import 'package:shopping_app/views/screen/home/view_product_screen.dart';
import 'package:shopping_app/views/widgets/common_widgets/empty_builder.dart';

class ViewAllProductScreen extends StatelessWidget {
  final String title;
  final List<FoodProduct> products;
  final String? noResultsDescription;
  final Function(FoodProduct)? onPressProduct;
  const ViewAllProductScreen({
    required this.title,
    required this.products,
    this.noResultsDescription,
    this.onPressProduct,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VMProvider<ViewAllProductsVm>(
      vm: ViewAllProductsVm(),
      builder: (context, vm, appVm, appUser) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Stack(
                  children: [
                    Positioned.fill(
                      left: 0.0,
                      right: 0.0,
                      child: Center(child: FoodWithLoveHeader(title: title)),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: IconButton(
                          splashRadius: 30.0,
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: products.isEmpty
                      ? EmptyBuilder(
                          title: 'No results found!',
                          subTitle: noResultsDescription,
                        )
                      : SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: FoodWithLoveProductsList(
                            products: products,
                            onBagIt: (product, quantity) => appVm
                                .addToShoppingCart(context, product, quantity),
                            onPressProduct: (product) {
                              onPressProduct?.call(product);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ViewProductScreen(
                                    product: product,
                                  ),
                                ),
                              );
                            },
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
}
