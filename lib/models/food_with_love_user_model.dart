import 'package:food_with_love/enums/online_status.dart';

class FoodWithLoveUser {
  final String? uid;
  final String? name;
  final String? email;
  final String? photoUrl;
  final OnlineStatus? onlineStatus;
  final List<String>? wishlists;
  final List<String>? shoppingCarts;
  final Map<String, dynamic>? extraData;

  FoodWithLoveUser({
    this.uid,
    this.name,
    this.email,
    this.photoUrl,
    this.onlineStatus,
    this.wishlists,
    this.shoppingCarts,
    this.extraData,
  });

  FoodWithLoveUser copyWith({
    final String? uid,
    final String? name,
    final String? email,
    final String? photoUrl,
    final List<String>? wishlists,
    final List<String>? shoppingCarts,
    final OnlineStatus? onlineStatus,
    final Map<String, dynamic>? extraData,
  }) {
    return FoodWithLoveUser(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      wishlists: wishlists ?? this.wishlists,
      shoppingCarts: shoppingCarts ?? this.shoppingCarts,
      onlineStatus: onlineStatus ?? this.onlineStatus,
      extraData: extraData ?? this.extraData,
    );
  }

  static FoodWithLoveUser fromJson(final Map<String, dynamic> data) {
    return FoodWithLoveUser(
      uid: data['uid'],
      name: data['name'],
      email: data['email'],
      photoUrl: data['photo_url'],
      wishlists: List<String>.from(data['wishlists'] ?? []),
      shoppingCarts: List<String>.from(data['shopping_carts'] ?? []),
      onlineStatus: OnlineStatus.values[data['online_status'] ?? 0],
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
      'search_keys': _getSearchKeys(),
    };
  }

  List<String> _getSearchKeys() {
    final _arr = <String>[];
    for (int i = 0; i < (name?.length ?? 0); i++) {
      final _name = name?.substring(0, i + 1).toUpperCase();
      if (_name != null) _arr.add(_name);
    }
    return _arr;
  }
}
