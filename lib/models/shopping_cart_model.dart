import 'package:food_with_love/food_with_love.dart';

class FoodShoppingCart {
  final String id;
  final FoodProduct foodProduct;
  final Map<String, dynamic>? extraData;

  FoodShoppingCart({
    required this.id,
    required this.foodProduct,
    this.extraData,
  });

  FoodShoppingCart copyWith({
    final String? id,
    final FoodProduct? foodProduct,
    final int? totalPrice,
    final Map<String, dynamic>? extraData,
  }) {
    return FoodShoppingCart(
      id: id ?? this.id,
      foodProduct: foodProduct ?? this.foodProduct,
      extraData: extraData ?? this.extraData,
    );
  }

  static FoodShoppingCart fromJson(final Map<String, dynamic> data) {
    return FoodShoppingCart(
      id: data['id'],
      foodProduct: FoodProduct.fromJson(data['food_product']),
      extraData: data['extra_data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'food_product': foodProduct.toJson(),
      'extra_data': extraData ?? {},
    };
  }
}
