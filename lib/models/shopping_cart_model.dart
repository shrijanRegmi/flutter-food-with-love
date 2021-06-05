import 'package:food_with_love/food_with_love.dart';

class FoodShoppingCart {
  final String? id;
  final FoodProduct? foodProduct;
  final int? totalPrice;
  final Map<String, dynamic>? extraData;

  FoodShoppingCart({
    this.id,
    this.foodProduct,
    this.totalPrice,
    this.extraData,
  });

  FoodShoppingCart copyWith(
    final String? id,
    final FoodProduct? foodProduct,
    final int? totalPrice,
    final Map<String, dynamic>? extraData,
  ) {
    return FoodShoppingCart(
      id: id ?? this.id,
      foodProduct: foodProduct ?? this.foodProduct,
      totalPrice: totalPrice ?? this.totalPrice,
      extraData: extraData ?? this.extraData,
    );
  }

  static FoodShoppingCart fromJson(final Map<String, dynamic> data) {
    return FoodShoppingCart(
      id: data['id'],
      foodProduct: data['food_product'] != null
          ? FoodProduct.fromJson(data['food_product'])
          : null,
      totalPrice: data['total_price'],
      extraData: data['extra_data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'food_product': foodProduct?.toJson(),
      'total_price': totalPrice,
      'extra_data': extraData ?? {},
    };
  }
}
