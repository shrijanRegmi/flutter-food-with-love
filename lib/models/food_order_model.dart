import 'package:food_with_love/enums/delivery_timing.dart';
import 'package:food_with_love/enums/order_status.dart';
import 'package:food_with_love/food_with_love.dart';

class FoodOrder {
  final String? id;
  final String? uid;
  final int? createdAt;
  final List<String>? foodProducts;
  final FoodAddress? foodAddress;
  final DeliveryTiming? deliveryTiming;
  final OrderStatus? orderStatus;
  final int? productTotal;
  final int? deliveryCharge;

  FoodOrder({
    this.id,
    this.uid,
    this.createdAt,
    this.foodProducts,
    this.foodAddress,
    this.deliveryTiming,
    this.orderStatus,
    this.productTotal,
    this.deliveryCharge,
  });

  FoodOrder copyWith({
    final String? id,
    final String? uid,
    final int? createdAt,
    final List<String>? foodProducts,
    final FoodAddress? foodAddress,
    final DeliveryTiming? deliveryTiming,
    final OrderStatus? orderStatus,
    final int? productTotal,
    final int? deliveryCharge,
  }) {
    return FoodOrder(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      foodProducts: foodProducts ?? this.foodProducts,
      foodAddress: foodAddress ?? this.foodAddress,
      deliveryTiming: deliveryTiming ?? this.deliveryTiming,
      orderStatus: orderStatus ?? this.orderStatus,
      productTotal: productTotal ?? this.productTotal,
      deliveryCharge: deliveryCharge ?? this.deliveryCharge,
    );
  }

  static FoodOrder fromJson(final Map<String, dynamic> data) {
    return FoodOrder(
      id: data['id'],
      uid: data['uid'],
      createdAt: data['created_at'],
      foodProducts: List<String>.from(data['food_products'] ?? []),
      foodAddress: FoodAddress.fromJson(data['food_address'] ?? {}),
      deliveryTiming: DeliveryTiming.values[data['delivery_timing'] ?? 0],
      orderStatus: OrderStatus.values[data['order_status'] ?? 0],
      productTotal: data['product_total'],
      deliveryCharge: data['delivery_charge'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'created_at': createdAt,
      'food_products': foodProducts,
      'food_address': foodAddress?.toJson(),
      'delivery_timing': deliveryTiming?.index ?? 0,
      'order_status': orderStatus?.index ?? 0,
      'product_total': productTotal,
      'delivery_charge': deliveryCharge,
    };
  }
}
