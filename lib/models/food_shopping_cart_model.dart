import 'package:food_with_love/food_with_love.dart';

class FoodShoppingCart {
  final String? id;
  final String? uid;
  final String? foodProductId;
  final FoodProduct? foodProduct;
  final int? quantity;
  final int? createdAt;
  final Map<String, dynamic>? extraData;

  FoodShoppingCart({
    this.id,
    this.uid,
    this.foodProductId,
    this.foodProduct,
    this.quantity,
    this.createdAt,
    this.extraData,
  });

  FoodShoppingCart copyWith({
    final String? id,
    final String? uid,
    final String? foodProductId,
    final FoodProduct? foodProduct,
    final int? quantity,
    final int? createdAt,
    final Map<String, dynamic>? extraData,
  }) {
    return FoodShoppingCart(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      foodProductId: foodProductId ?? this.foodProductId,
      foodProduct: foodProduct ?? this.foodProduct,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
      extraData: extraData ?? this.extraData,
    );
  }

  static FoodShoppingCart fromJson(final Map<String, dynamic> data) {
    return FoodShoppingCart(
      id: data['id'],
      uid: data['uid'],
      foodProductId: data['food_product_id'],
      foodProduct: FoodProduct.fromJson(data['food_product']),
      quantity: data['quantity'] ?? 1,
      createdAt: data['created_at'],
      extraData: data['extra_data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'food_product_id': foodProductId,
      'food_product': foodProduct?.toJson(),
      'quantity': quantity,
      'created_at': createdAt,
      'extra_data': extraData ?? {},
    };
  }
}
