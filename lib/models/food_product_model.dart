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
  final bool? popular;
  final int? views;
  final int? createdAt;
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
    this.popular,
    this.views,
    this.createdAt,
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
    final bool? popular,
    final int? views,
    final int? createdAt,
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
      popular: popular ?? this.popular,
      views: views ?? this.views,
      createdAt: createdAt ?? this.createdAt,
      extraData: extraData ?? this.extraData,
    );
  }

  static FoodProduct fromJson(final Map<String, dynamic> data) {
    return FoodProduct(
      id: data['id'],
      imgUrl: data['img_url'],
      title: data['title'] ?? '',
      subTitle: data['sub_title'] ?? '',
      description: data['description'] ?? '',
      price: data['price'] ?? 0,
      shippingPrice: data['shipping_price'] ?? 0,
      quantity: data['quantity'] ?? 1,
      color: data['color'] == null
          ? Colors.pink
          : Color(int.parse(data['color'], radix: 16)),
      category: FoodCategory.fromJson(data['category']),
      popular: data['popular'] ?? false,
      views: data['views'] ?? 0,
      createdAt: data['created_at'],
      extraData: data['extra_data'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'img_url': imgUrl,
      'title': title,
      'sub_title': subTitle,
      'description': description,
      'price': price,
      'shipping_price': shippingPrice,
      'quantity': quantity,
      'color': color?.value.toRadixString(16),
      'category': category?.toJson(),
      'popular': popular,
      'views': views,
      'created_at': createdAt,
      'extra_data': extraData ?? {},
      'search_keys': _getSearchKeys(),
    };
  }

  List<String> _getSearchKeys() {
    final _arr = <String>[];
    for (int i = 0; i < (title?.length ?? 0); i++) {
      final _title = title?.substring(0, i + 1).toUpperCase();
      if (_title != null) _arr.add(_title);
    }
    return _arr;
  }
}
