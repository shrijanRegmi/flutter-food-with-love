import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';

class FoodProduct {
  final String? id;
  final String? imgUrl;
  final String? title;
  final String? subTitle;
  final String? description;
  final int? price;
  final int? shippingPrice;
  final int? quantity;
  final Color? color;
  final FoodCategory? category;
  final Map<String, dynamic>? extraData;

  FoodProduct({
    this.id,
    this.imgUrl,
    this.title,
    this.subTitle,
    this.description,
    this.price,
    this.shippingPrice,
    this.quantity,
    this.color,
    this.category,
    this.extraData,
  });

  FoodProduct copyWith({
    final String? id,
    final String? imgUrl,
    final String? title,
    final String? subTitle,
    final String? description,
    final int? price,
    final int? shippingPrice,
    final int? quantity,
    final Color? color,
    final FoodCategory? category,
    final Map<String, dynamic>? extraData,
  }) {
    return FoodProduct(
      id: id ?? this.id,
      imgUrl: imgUrl ?? this.imgUrl,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      description: description ?? this.description,
      price: price ?? this.price,
      shippingPrice: shippingPrice ?? this.shippingPrice,
      quantity: quantity ?? this.quantity,
      color: color ?? this.color,
      category: category ?? this.category,
      extraData: extraData ?? this.extraData,
    );
  }

  static FoodProduct fromJson(final Map<String, dynamic> data) {
    return FoodProduct(
      id: data['id'],
      imgUrl: data['img_url'],
      title: data['title'],
      subTitle: data['sub_title'],
      description: data['description'],
      price: data['price'],
      shippingPrice: data['shipping_price'],
      quantity: data['quantity'],
      color: data['color'] == null ? Colors.pink : Color(data['color']),
      category: data['category'] == null
          ? null
          : FoodCategory.fromJson(data['category']),
      extraData: data['extra_data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'img_url': imgUrl,
      'title': title,
      'sub_title': subTitle,
      'price': price,
      'shipping_price': shippingPrice,
      'quantity': quantity,
      'color': color?.value.toRadixString(16),
      'category': category?.toJson(),
      'extra_data': extraData ?? {},
    };
  }
}
