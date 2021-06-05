class FoodCategory {
  final String? id;
  final String? imgUrl;
  final String? title;
  final Map<String, dynamic>? extraData;
  FoodCategory({
    this.id,
    this.imgUrl,
    this.title,
    this.extraData,
  });

  FoodCategory copyWith({
    final String? id,
    final String? imgUrl,
    final String? title,
    final Map<String, dynamic>? extraData,
  }) {
    return FoodCategory(
      id: id ?? this.id,
      imgUrl: imgUrl ?? this.imgUrl,
      title: title ?? this.title,
      extraData: extraData ?? this.extraData,
    );
  }

  static FoodCategory fromJson(final Map<String, dynamic> data) {
    return FoodCategory(
      id: data['id'],
      imgUrl: data['img_url'],
      title: data['title'],
      extraData: data['extra_data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'img_url': imgUrl,
      'title': title,
      'extra_data': extraData ?? {},
    };
  }
}
