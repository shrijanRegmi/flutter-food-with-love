import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_with_love/models/food_product_model.dart';
import 'package:food_with_love/models/food_wishlist_model.dart';
import 'package:food_with_love/models/shopping_cart_model.dart';

import '../constants.dart';

class FWLProductProvider {
  static final _ref = FirebaseFirestore.instance;

  // search product
  static Future<List<FoodProduct>> search(final String searchKey) async {
    final _products = <FoodProduct>[];
    try {
      final _productsRef = _ref
          .collection(productsCol)
          .where('search_keys', arrayContains: searchKey);
      final _productsSnap = await _productsRef.get();
      _productsSnap.docs.forEach((snap) {
        final _data = snap.data();
        final _product = FoodProduct.fromJson(_data);
        _products.add(_product);
      });
    } catch (e) {
      print(e);
      print('Error!!!: Searching products');
    }
    return _products;
  }

  // add to cart
  static Future<void> addToCart(
    final FoodShoppingCart shoppingCart, {
    final Function(dynamic)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _shoppingCartRef = _ref
          .collection(usersCol)
          .doc(shoppingCart.uid)
          .collection(shoppingCartsCol)
          .doc();
      final _shoppingCart = shoppingCart.copyWith(id: _shoppingCartRef.id);
      await _shoppingCartRef.set(_shoppingCart.toJson());
      onSuccess?.call(_shoppingCart);
    } catch (e) {
      print(e);
      print('Error!!!: Adding to shopping cart');
      onError?.call(e);
    }
  }

  // add to wishlist
  static Future<void> addToWishlist(
    final FoodWishlist wishlist, {
    final Function(dynamic)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _wishlistRef = _ref
          .collection(usersCol)
          .doc(wishlist.uid)
          .collection(wishListsCol)
          .doc();
      final _wishlist = wishlist.copyWith(id: _wishlistRef.id);
      await _wishlistRef.set(_wishlist.toJson());
      onSuccess?.call(_wishlist);
    } catch (e) {
      print(e);
      print('Error!!!: Adding to shopping cart');
      onError?.call(e);
    }
  }

  //get list of products from firestore
  List<FoodProduct> _productsFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => FoodProduct.fromJson(e.data())).toList();
  }

  // stream of list of products
  Stream<List<FoodProduct>> get popularProductsList {
    return _ref
        .collection(productsCol)
        .where('popular', isEqualTo: true)
        .orderBy('views')
        .snapshots()
        .map(_productsFromFirestore);
  }
}