import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/views/widgets/common_widgets/empty_builder.dart';
import 'package:shopping_app/views/widgets/shopping_cart_widgets/address_item.dart';

class AddressesList extends StatefulWidget {
  final List<FoodAddress> addresses;
  final Function(FoodAddress)? onAddressSelect;
  final Function(FoodAddress)? onAddressEdit;
  final Function(FoodAddress)? onAddressDelete;
  const AddressesList({
    Key? key,
    required this.addresses,
    this.onAddressSelect,
    this.onAddressEdit,
    this.onAddressDelete,
  }) : super(key: key);

  @override
  State<AddressesList> createState() => _AddressesListState();
}

class _AddressesListState extends State<AddressesList> {
  int _activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return widget.addresses.isEmpty
        ? EmptyBuilder(
            title: "You haven't added any address",
            subTitle:
                'Press the Add New button on your top right corner to add one.',
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.addresses.length,
            itemBuilder: (context, index) {
              return AddressItem(
                address: widget.addresses[index],
                onPressed: () {
                  setState(() => _activeIndex = index);
                  widget.onAddressSelect?.call(widget.addresses[index]);
                },
                active: _activeIndex == index,
                onEdit: widget.onAddressEdit,
                onDelete: widget.onAddressDelete,
              );
            },
          );
  }
}
