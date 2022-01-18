import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/viewmodels/checkout_vm.dart';
import 'package:shopping_app/viewmodels/vm_provider.dart';
import 'package:shopping_app/views/widgets/common_widgets/input.dart';
import 'package:shopping_app/views/widgets/shopping_cart_widgets/addresses_list.dart';
import 'package:shopping_app/views/widgets/shopping_cart_widgets/delivery_options_list.dart';
import 'package:shopping_app/views/widgets/shopping_cart_widgets/payables_list.dart';

class CheckoutBottomSheet extends StatelessWidget {
  final List<FoodShoppingCart> shoppingCarts;
  const CheckoutBottomSheet({
    required this.shoppingCarts,
    Key? key,
  }) : super(key: key);

  // open checkout bottomsheet
  void _openBottomSheet(final BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      isScrollControlled: true,
      builder: (context) => CheckoutBottomSheetContent(
        shoppingCarts: shoppingCarts,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FoodWithLoveCheckoutBlock(
      shoppingCarts: shoppingCarts,
      onPressedCheckout: () => _openBottomSheet(context),
    );
  }
}

class CheckoutBottomSheetContent extends StatelessWidget {
  final List<FoodShoppingCart> shoppingCarts;
  const CheckoutBottomSheetContent({
    Key? key,
    required this.shoppingCarts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VMProvider<CheckoutVm>(
      vm: CheckoutVm(context, shoppingCarts),
      builder: (context, vm, appVm, appUser) {
        final _widgets = <Widget>[
          _selectAddressBuilder(vm),
          _addAddressBuilder(context, vm),
          _deliveryBuilder(vm),
          _selectGpsBuilder(vm),
        ];

        return SizedBox(
          height: 500.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: vm.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : _widgets[vm.step - 1],
          ),
        );
      },
    );
  }

  // STEP 1 : Select Existing Address
  Widget _selectAddressBuilder(final CheckoutVm vm) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Address',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
              FoodWithLoveButton.filled(
                value: 'Add New',
                onPressed: () {
                  vm.updateStep(2);
                  vm.updateAddressToEdit(null);
                  vm.clearValues();
                },
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                padding: const EdgeInsets.all(2.0),
                borderRadius: 10.0,
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: AddressesList(
              addresses: vm.addresses,
              onAddressSelect: vm.updateSelectedAddress,
              onAddressDelete: vm.deleteAddress,
              onAddressEdit: vm.onAddressEdit,
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        if (vm.addresses.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: FoodWithLoveButton.filled(
              value: 'Select Address',
              onPressed:
                  vm.selectedAddress == null ? null : () => vm.updateStep(3),
              borderRadius: 50.0,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }

  // STEP 2 : Add New Address
  Widget _addAddressBuilder(
    final BuildContext context,
    final CheckoutVm vm,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () => vm.updateStep(1),
                  behavior: HitTestBehavior.opaque,
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  vm.addressToEdit == null ? 'Add New Address' : 'Edit Address',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(child: _addAddressInputContainer(vm)),
            SizedBox(
              height: 20.0,
            ),
            FoodWithLoveButton.filled(
              value: 'Save Address',
              onPressed: vm.addressToEdit == null
                  ? vm.createAddress
                  : vm.updateAddress,
              borderRadius: 50.0,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // STEP 3 : Delivery Options
  Widget _deliveryBuilder(final CheckoutVm vm) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => vm.updateStep(1),
                    behavior: HitTestBehavior.opaque,
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Select Delivery Timings',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              DeliveryOptionsList(
                onPressed: vm.updateDeliveryTiming,
              ),
              SizedBox(
                height: 30.0,
              ),
              PayablesList(
                productTotal: vm.getTotalPrice(),
                deliveryCharge: vm.getShippingPrice(),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          FoodWithLoveButton.filled(
            value: 'Order Now',
            onPressed: vm.selectedDeliveryTiming == null ? null : vm.placeOrder,
            borderRadius: 50.0,
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // STEP 4 : Select GPS
  Widget _selectGpsBuilder(final CheckoutVm vm) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => vm.updateStep(2),
                behavior: HitTestBehavior.opaque,
                child: Icon(
                  Icons.arrow_back,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Change Location',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Colors.grey[200],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                _gpsBuilder(vm, fromChangeLocation: true),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          FoodWithLoveButton.filled(
            value: 'Save Changes',
            onPressed: () => vm.updateStep(2),
            borderRadius: 50.0,
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _addAddressInputContainer(final CheckoutVm vm) {
    return Column(
      children: [
        TextInput(
          hintText: 'Full Name',
          leftIcon: SvgPicture.asset(
            'assets/svgs/full_name.svg',
          ),
          controller: vm.nameController,
          capitalization: TextCapitalization.words,
        ),
        SizedBox(
          height: 15.0,
        ),
        TextInput(
          hintText: 'Mobile Number',
          leftIcon: SvgPicture.asset(
            'assets/svgs/mobile_number.svg',
          ),
          type: TextInputType.number,
          controller: vm.phoneController,
        ),
        SizedBox(
          height: 15.0,
        ),
        TextInput(
          hintText: 'Optional Mobile Number',
          leftIcon: SvgPicture.asset(
            'assets/svgs/mobile_number.svg',
          ),
          type: TextInputType.number,
          controller: vm.optPhoneController,
        ),
        SizedBox(
          height: 15.0,
        ),
        TextInput(
          hintText: 'Address',
          leftIcon: SvgPicture.asset(
            'assets/svgs/address.svg',
          ),
          controller: vm.addressController,
        ),
        SizedBox(
          height: 15.0,
        ),
        _gpsBuilder(vm),
      ],
    );
  }

  Widget _gpsBuilder(
    final CheckoutVm vm, {
    final bool fromChangeLocation = false,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: fromChangeLocation ? null : () => vm.updateStep(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: fromChangeLocation
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                )
              : BorderRadius.circular(20.0),
          color: Colors.grey[200],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: fromChangeLocation ? 15.0 : 11.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 1.0,
            ),
            SvgPicture.asset(
              'assets/svgs/gps.svg',
              height: 24.0,
            ),
            SizedBox(
              width: 11.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GPS',
                  style: TextStyle(
                    color: kcDarkGreyColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                Text(
                  'Unnamed Road, Street 4, Anarmani',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Row(
                  children: [
                    Text(
                      "4.5 Km's ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kcGreenColor,
                      ),
                    ),
                    Text(
                      'from Mukti Chowk',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                if (!fromChangeLocation)
                  SizedBox(
                    height: 3.0,
                  ),
                if (!fromChangeLocation)
                  Text(
                    'Click to Change Location',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
