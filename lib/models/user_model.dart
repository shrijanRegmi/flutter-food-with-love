class FoodWithLoveUser {
  final String? uid;
  final String? name;
  final String? email;
  final String? photoUrl;
  final Map<String, dynamic>? extraData;

  FoodWithLoveUser({
    this.uid,
    this.name,
    this.email,
    this.photoUrl,
    this.extraData,
  });

  FoodWithLoveUser copyWith({
    final String? uid,
    final String? name,
    final String? email,
    final String? photoUrl,
    final Map<String, dynamic>? extraData,
  }) {
    return FoodWithLoveUser(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      extraData: extraData ?? this.extraData,
    );
  }

  static FoodWithLoveUser fromJson(final Map<String, dynamic> data) {
    return FoodWithLoveUser(
      uid: data['uid'],
      name: data['name'],
      email: data['email'],
      photoUrl: data['photo_url'],
      extraData: data['extra_data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photo_url': photoUrl,
      'extra_data': extraData,
    };
  }
}
