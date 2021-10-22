import 'package:food_with_love/food_with_love.dart';

class FoodWishlist {
  final String id;
  final String uid;
  final FoodProduct foodProduct;
  final Map<String, dynamic>? extraData;

  FoodWishlist({
    required this.id,
    required this.uid,
    required this.foodProduct,
    this.extraData,
  });

  FoodWishlist copyWith({
    final String? id,
    final String? uid,
    final FoodProduct? foodProduct,
    final int? totalPrice,
    final Map<String, dynamic>? extraData,
  }) {
    return FoodWishlist(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      foodProduct: foodProduct ?? this.foodProduct,
      extraData: extraData ?? this.extraData,
    );
  }

  static FoodWishlist fromJson(final Map<String, dynamic> data) {
    return FoodWishlist(
      id: data['id'],
      uid: data['uid'],
      foodProduct: FoodProduct.fromJson(data['food_product']),
      extraData: data['extra_data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'food_product': foodProduct.toJson(),
      'extra_data': extraData ?? {},
    };
  }
}
