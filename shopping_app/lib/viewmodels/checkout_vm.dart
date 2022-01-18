import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:provider/provider.dart';

class CheckoutVm extends ChangeNotifier {
  final BuildContext context;
  final List<FoodShoppingCart> shoppingCarts;
  CheckoutVm(this.context, this.shoppingCarts);

  int _step = 1;
  FoodAddress? _selectedAddress;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _optPhoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  bool _isLoading = false;
  String? _addressToEdit;
  DeliveryTiming? _selectedDeliveryTiming;

  int get step => _step;
  FoodAddress? get selectedAddress => _selectedAddress;
  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get optPhoneController => _optPhoneController;
  TextEditingController get addressController => _addressController;
  List<FoodAddress> get addresses => Provider.of<List<FoodAddress>>(context);
  bool get isLoading => _isLoading;
  String? get addressToEdit => _addressToEdit;
  DeliveryTiming? get selectedDeliveryTiming => _selectedDeliveryTiming;

  // get shipping price
  int getShippingPrice() {
    int _shipping = 0;
    shoppingCarts.forEach((cart) {
      _shipping += (cart.foodProduct?.shippingPrice ?? 0);
    });
    return _shipping;
  }

  // get total price
  int getTotalPrice() {
    int _total = 0;
    shoppingCarts.forEach((cart) {
      _total += ((cart.foodProduct?.price ?? 0) * (cart.quantity ?? 1));
    });
    return _total;
  }

  // initialize values
  void initializeValues(final FoodAddress address) {
    _nameController.text = address.name ?? '';
    _phoneController.text = address.phone ?? '';
    _optPhoneController.text = address.optPhone ?? '';
    _addressController.text = address.address ?? '';

    notifyListeners();
  }

  // clear values
  void clearValues() {
    _nameController.clear();
    _phoneController.clear();
    _optPhoneController.clear();
    _addressController.clear();

    notifyListeners();
  }

  // create a new address
  void createAddress() {
    if (_nameController.text.trim() != '' &&
        _phoneController.text.trim() != '' &&
        _optPhoneController.text.trim() != '' &&
        _addressController.text.trim() != '') {
      updateIsLoading(true);
      final _address = FoodAddress(
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        optPhone: _optPhoneController.text.trim(),
        address: _addressController.text.trim(),
      );

      FWLUserProvider.createAddress(
        address: _address,
        onSuccess: (address) {
          _nameController.clear();
          _phoneController.clear();
          _optPhoneController.clear();
          _addressController.clear();
          updateIsLoading(false);
          updateStep(1);
        },
      );
    }
  }

  // update a new address
  void updateAddress() {
    if (_nameController.text.trim() != '' &&
        _phoneController.text.trim() != '' &&
        _optPhoneController.text.trim() != '' &&
        _addressController.text.trim() != '') {
      updateIsLoading(true);
      final _address = FoodAddress(
        id: _addressToEdit,
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        optPhone: _optPhoneController.text.trim(),
        address: _addressController.text.trim(),
      );

      FWLUserProvider.updateAddress(
        address: _address,
        onSuccess: (address) {
          updateAddressToEdit(null);
          updateIsLoading(false);
          updateStep(1);
        },
      );
    }
  }

  // delete a address
  void deleteAddress(final FoodAddress address) {
    FWLUserProvider.deleteAddress(
      addressId: address.id!,
    );
  }

  // onAddressEdit function
  void onAddressEdit(final FoodAddress address) {
    updateAddressToEdit(address.id);
    initializeValues(address);
    updateStep(2);
  }

  // place an order
  void placeOrder() {
    if (shoppingCarts.isNotEmpty &&
        _selectedAddress != null &&
        _selectedDeliveryTiming != null) {
      updateIsLoading(true);
      final _order = FoodOrder(
        foodProducts: shoppingCarts.map((e) => e.foodProductId!).toList(),
        foodAddress: _selectedAddress,
        deliveryTiming: _selectedDeliveryTiming,
        orderStatus: OrderStatus.none,
        productTotal: getTotalPrice(),
        deliveryCharge: getShippingPrice(),
      );

      FWLProductProvider.placeOrder(
        foodOrder: _order,
        onSuccess: (_) {
          updateIsLoading(false);
          updateStep(1);
        },
      );
    }
  }

  // update value of step
  void updateStep(final int newVal) {
    _step = newVal;
    notifyListeners();
  }

  // update value of selectedAddress
  void updateSelectedAddress(final FoodAddress newVal) {
    _selectedAddress = newVal;
    notifyListeners();
  }

  // update value of isLoading
  void updateIsLoading(final bool newVal) {
    _isLoading = newVal;
    notifyListeners();
  }

  // update value of addressToEdit
  void updateAddressToEdit(final String? newVal) {
    _addressToEdit = newVal;
    notifyListeners();
  }

  // update value of selectedDeliveryTiming
  void updateDeliveryTiming(final DeliveryTiming newVal) {
    _selectedDeliveryTiming = newVal;
    notifyListeners();
  }
}
