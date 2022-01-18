class FoodAddress {
  final String? id;
  final String? uid;
  final String? name;
  final String? phone;
  final String? optPhone;
  final String? address;
  final int? createdAt;

  FoodAddress({
    this.id,
    this.uid,
    this.name,
    this.phone,
    this.optPhone,
    this.address,
    this.createdAt,
  });

  FoodAddress copyWith({
    final String? id,
    final String? uid,
    final String? name,
    final String? phone,
    final String? optPhone,
    final String? address,
    final int? createdAt,
  }) {
    return FoodAddress(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      optPhone: optPhone ?? this.optPhone,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  static FoodAddress fromJson(final Map<String, dynamic> data) {
    return FoodAddress(
      id: data['id'],
      uid: data['uid'],
      name: data['name'],
      phone: data['phone'],
      optPhone: data['optional_phone'],
      address: data['address'],
      createdAt: data['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'phone': phone,
      'optional_phone': optPhone,
      'address': address,
      'created_at': createdAt,
    };
  }
}
