class FoodCategory {
  final String? id;
  final String? img;
  final String? title;
  FoodCategory({
    this.id,
    this.img,
    this.title,
  });

  FoodCategory copyWith({
    final String? id,
    final String? img,
    final String? title,
  }) {
    return FoodCategory(
      id: id ?? this.id,
      img: img ?? this.img,
      title: title ?? this.title,
    );
  }
}
