import 'package:food_with_love/food_with_love.dart';

class FoodNotification {
  final String? id;
  final String? title;
  final String? body;
  final String? uid;
  final bool? read;
  final FoodProduct? foodProduct;

  FoodNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.uid,
    required this.read,
    required this.foodProduct,
  });

  FoodNotification copyWith({
    final String? id,
    final String? title,
    final String? body,
    final String? uid,
    final bool? read,
    final FoodProduct? foodProduct,
  }) {
    return FoodNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      uid: uid ?? this.uid,
      read: read ?? this.read,
      foodProduct: foodProduct ?? this.foodProduct,
    );
  }

  static FoodNotification fromJson(Map<String, dynamic> data) {
    return FoodNotification(
      id: data['id'],
      title: data['title'],
      body: data['body'],
      uid: data['uid'],
      read: data['read'] ?? false,
      foodProduct: FoodProduct.fromJson(data['food_product']),
    );
  }
}
