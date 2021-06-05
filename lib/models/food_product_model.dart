import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';

class FoodProduct {
  final String? id;
  final String? title;
  final String? subTitle;
  final int? price;
  final Color? color;
  final FoodCategory? category;
  final Map<String, dynamic>? extraData;

  FoodProduct({
    this.id,
    this.title,
    this.subTitle,
    this.price,
    this.color,
    this.category,
    this.extraData,
  });

  FoodProduct copyWith({
    final String? id,
    final String? title,
    final String? subTitle,
    final int? price,
    final Color? color,
    final FoodCategory? category,
    final Map<String, dynamic>? extraData,
  }) {
    return FoodProduct(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      price: price ?? this.price,
      color: color ?? this.color,
      category: category ?? this.category,
      extraData: extraData ?? this.extraData,
    );
  }

  static FoodProduct fromJson(final Map<String, dynamic> data) {
    return FoodProduct(
      id: data['id'],
      title: data['title'],
      subTitle: data['sub_title'],
      price: data['price'],
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
      'title': title,
      'sub_title': subTitle,
      'price': price,
      'color': color?.value.toRadixString(16),
      'category': category?.toJson(),
      'extra_data': extraData ?? {},
    };
  }
}
