import 'package:food_with_love/food_with_love.dart';

class FoodLastSearch {
  final String? id;
  final String? uid;
  final int? createdAt;
  final FoodProduct? foodProduct;
  final String? foodProductId;

  FoodLastSearch({
    this.id,
    this.uid,
    this.createdAt,
    this.foodProduct,
    this.foodProductId,
  });

  FoodLastSearch copyWith({
    final String? id,
    final String? uid,
    final int? createdAt,
    final FoodProduct? foodProduct,
    final String? foodProductId,
  }) {
    return FoodLastSearch(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      foodProduct: foodProduct ?? this.foodProduct,
      foodProductId: foodProductId ?? this.foodProductId,
    );
  }

  static FoodLastSearch fromJson(final Map<String, dynamic> data) {
    return FoodLastSearch(
      id: data['id'],
      uid: data['uid'],
      createdAt: data['created_at'],
      foodProduct: FoodProduct.fromJson(data['food_product']),
      foodProductId: data['food_product_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'created_at': createdAt,
      'food_product': foodProduct?.toJson(),
      'food_product_id': foodProductId,
    };
  }
}
