import 'package:flutter/material.dart';
import 'package:food_with_love/models/option_model.dart';
import 'package:food_with_love/src/widgets/food_with_love_options_item.dart';

class FoodWithLoveOptionsList extends StatelessWidget {
  final List<FoodWithLoveOption> options;
  final Widget Function(BuildContext, int)? itemBuilder;
  const FoodWithLoveOptionsList({
    Key? key,
    required this.options,
    this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: options.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final _option = options[index];
        return itemBuilder != null
            ? itemBuilder!(context, index)
            : FoodWithLoveOptionsItem(
                option: _option,
              );
      },
    );
  }
}
