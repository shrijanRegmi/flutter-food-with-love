import 'package:food_with_love/food_with_love.dart';

class FoodLastSearch {
  final String? id;
  final String? uid;
  final FoodProduct? foodProduct;
  final int? createdAt;

  FoodLastSearch({
    this.id,
    this.uid,
    this.foodProduct,
    this.createdAt,
  });

  FoodLastSearch copyWith({
    final String? id,
    final String? uid,
    final FoodProduct? foodProduct,
    final int? createdAt,
  }) {
    return FoodLastSearch(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      foodProduct: foodProduct ?? this.foodProduct,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  static FoodLastSearch fromJson(final Map<String, dynamic> data) {
    return FoodLastSearch(
      id: data['id'],
      uid: data['uid'],
      foodProduct: FoodProduct.fromJson(data['food_product']),
      createdAt: data['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'food_product': foodProduct?.toJson(),
      'created_at': createdAt,
    };
  }
}
