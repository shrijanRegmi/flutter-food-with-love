import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_with_love/models/food_last_search_model.dart';
import 'package:food_with_love/models/food_wishlist_model.dart';
import '../constants.dart';
import 'package:food_with_love/food_with_love.dart';

class FWLProductProvider {
  static final _ref = FirebaseFirestore.instance;
  static final _auth = FirebaseAuth.instance;
  static final _uid = _auth.currentUser?.uid;

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

  // view product
  static Future<void> viewProduct(final FoodProduct product) async {
    try {
      final _productRef = _ref.collection(productsCol).doc(product.id);
      await _productRef.update({'views': FieldValue.increment(1)});
    } catch (e) {
      print(e);
      print('Error!!!: Viewing product');
    }
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

  // remove from cart
  static Future<void> removeFromCart(
    final FoodShoppingCart cart, {
    final Function(dynamic)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _shoppingCartRef = _ref
          .collection(usersCol)
          .doc(cart.uid)
          .collection(wishListsCol)
          .doc(cart.id);

      await _shoppingCartRef.delete();
      onSuccess?.call(cart);
    } catch (e) {
      print(e);
      print('Error!!!: Removing from shopping cart');
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
      print('Error!!!: Adding to wishlist');
      onError?.call(e);
    }
  }

  // remove from wishlist
  static Future<void> removeFromWishlist(
    final FoodWishlist wishlist, {
    final Function(dynamic)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _wishlistRef = _ref
          .collection(usersCol)
          .doc(wishlist.uid)
          .collection(wishListsCol)
          .doc(wishlist.id);

      await _wishlistRef.delete();
      onSuccess?.call(wishlist);
    } catch (e) {
      print(e);
      print('Error!!!: Removing from wishlist');
      onError?.call(e);
    }
  }

  // add product to last search
  static Future<void> addToLastSearch(
    final FoodLastSearch foodLastSearch, {
    final Function(dynamic)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _lastSearchRef = _ref
          .collection(usersCol)
          .doc(foodLastSearch.uid)
          .collection(lastSearchesCol)
          .doc();
      final _foodLastSearch = foodLastSearch.copyWith(id: _lastSearchRef.id);
      await _lastSearchRef.set(_foodLastSearch.toJson());
      onSuccess?.call(_foodLastSearch);
    } catch (e) {
      print(e);
      print('Error!!!: Adding product to last search');
      onError?.call(e);
    }
  }

  // upload test products
  static Future<void> uploadTestProducts(
    final List<FoodProduct> products,
  ) async {
    try {
      for (final product in products) {
        final _productRef = _ref.collection(productsCol).doc();
        final _product = product.copyWith(id: _productRef.id);
        await _productRef.set(_product.toJson());
      }
    } catch (e) {
      print(e);
      print('Error!!!: Uploading test products');
    }
  }

  //get list of products from firestore
  List<FoodProduct> _productsFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => FoodProduct.fromJson(e.data())).toList();
  }

  //get list of wishlists from firestore
  List<FoodWishlist> _wishlistsFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => FoodWishlist.fromJson(e.data())).toList();
  }

  //get list of shopping carts from firestore
  List<FoodShoppingCart> _shoppingCartsFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => FoodShoppingCart.fromJson(e.data())).toList();
  }

  //get list of last searches from firestore
  List<FoodLastSearch> _lastSearchesFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => FoodLastSearch.fromJson(e.data())).toList();
  }

  // stream of list of products
  Stream<List<FoodProduct>> get popularProductsList {
    return _ref
        .collection(productsCol)
        .where('popular', isEqualTo: true)
        .orderBy('views', descending: true)
        .snapshots()
        .map(_productsFromFirestore);
  }

  // stream of list of wishlists
  Stream<List<FoodWishlist>> get wishlistsList {
    return _ref
        .collection(usersCol)
        .doc(_uid)
        .collection(wishListsCol)
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(_wishlistsFromFirestore);
  }

  // stream of list of shopping carts
  Stream<List<FoodShoppingCart>> get shoppingCartsList {
    return _ref
        .collection(usersCol)
        .doc(_uid)
        .collection(shoppingCartsCol)
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(_shoppingCartsFromFirestore);
  }

  // stream of list of last searches
  Stream<List<FoodLastSearch>> get lastSearchesList {
    return _ref
        .collection(usersCol)
        .doc(_uid)
        .collection(lastSearchesCol)
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(_lastSearchesFromFirestore);
  }
}
