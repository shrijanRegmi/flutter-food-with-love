import 'package:food_with_love/food_with_love.dart';

class FoodWishlist {
  final String? id;
  final String? uid;
  final int? createdAt;
  final String? foodProductId;
  final FoodProduct? foodProduct;
  final Map<String, dynamic>? extraData;

  FoodWishlist({
    this.id,
    this.uid,
    this.createdAt,
    this.foodProductId,
    this.foodProduct,
    this.extraData,
  });

  FoodWishlist copyWith({
    final String? id,
    final String? uid,
    final int? createdAt,
    final FoodProduct? foodProduct,
    final Map<String, dynamic>? extraData,
  }) {
    return FoodWishlist(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      foodProductId: foodProductId ?? this.foodProductId,
      foodProduct: foodProduct ?? this.foodProduct,
      extraData: extraData ?? this.extraData,
    );
  }

  static FoodWishlist fromJson(final Map<String, dynamic> data) {
    return FoodWishlist(
      id: data['id'],
      uid: data['uid'],
      foodProductId: data['food_product_id'],
      foodProduct: FoodProduct.fromJson(data['food_product']),
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
      'created_at': createdAt,
      'extra_data': extraData ?? {},
    };
  }
}
