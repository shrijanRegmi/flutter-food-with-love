import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_with_love/models/food_last_search_model.dart';
import 'package:food_with_love/models/food_order_model.dart';
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
          .where('search_keys', arrayContains: searchKey.toUpperCase());
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
  static Future<void> addToCart({
    required final FoodProduct foodProduct,
    required final int quantity,
    final Function(FoodShoppingCart)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    final _currentDate = DateTime.now().millisecondsSinceEpoch;

    try {
      final _userShoppingCartRef =
          _ref.collection(usersCol).doc(_uid).collection(shoppingCartsCol);
      final _shoppingCartsRef = _userShoppingCartRef
          .where('food_product_id', isEqualTo: foodProduct.id)
          .limit(1);
      final _shoppingCartSnaps = await _shoppingCartsRef.get();

      if (_shoppingCartSnaps.docs.isEmpty) {
        final _shoppingCartRef = _userShoppingCartRef.doc();
        final _shoppingCart = FoodShoppingCart(
          id: _shoppingCartRef.id,
          uid: _uid,
          createdAt: _currentDate,
          foodProduct: foodProduct,
          foodProductId: foodProduct.id,
          quantity: quantity,
        );
        await _shoppingCartRef.set(_shoppingCart.toJson());

        // add this shopping cart to user doc
        await FWLUserProvider.updateUserProfile({
          'shopping_carts': FieldValue.arrayUnion([foodProduct.id]),
        });
        onSuccess?.call(_shoppingCart);
      } else {
        final _shoppingCartSnap = _shoppingCartSnaps.docs.first;

        if (_shoppingCartSnap.exists) {
          final _shoppingCartRef =
              _userShoppingCartRef.doc(_shoppingCartSnap.id);
          final _shoppingCartFromFirestore =
              FoodShoppingCart.fromJson(_shoppingCartSnap.data());
          final _shoppingCart = _shoppingCartFromFirestore.copyWith(
              quantity: (_shoppingCartFromFirestore.quantity ?? 0) + quantity);
          await _shoppingCartRef.update({
            'quantity': FieldValue.increment(quantity),
            'created_at': _currentDate,
          });
          onSuccess?.call(_shoppingCart);
        }
      }
    } catch (e) {
      print(e);
      print('Error!!!: Adding to shopping cart');
      onError?.call(e);
    }
  }

  // remove from cart
  static Future<void> removeFromCart({
    required final FoodProduct foodProduct,
    final Function(FoodShoppingCart)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _userShoppingCartsRef =
          _ref.collection(usersCol).doc(_uid).collection(shoppingCartsCol);

      final _shoppingCartsRef = _userShoppingCartsRef
          .where('food_product_id', isEqualTo: foodProduct.id)
          .limit(1);
      final _shoppingCartsSnap = await _shoppingCartsRef.get();

      if (_shoppingCartsSnap.docs.isNotEmpty) {
        final _shoppingCartSnap = _shoppingCartsSnap.docs.first;
        final _shoppingCart =
            FoodShoppingCart.fromJson(_shoppingCartSnap.data());
        await _shoppingCartSnap.reference.delete();

        // remove this shopping cart from user doc
        await FWLUserProvider.updateUserProfile({
          'shopping_carts': FieldValue.arrayRemove(['']),
        });
        onSuccess?.call(_shoppingCart);
      }
    } catch (e) {
      print(e);
      print('Error!!!: Removing from shopping cart');
      onError?.call(e);
    }
  }

  // update cart quantity
  static Future<void> updateCartQuantity({
    required final FoodShoppingCart foodShoppingCart,
    required final int quantity,
    final Function(FoodShoppingCart)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _userShoppingCartsRef =
          _ref.collection(usersCol).doc(_uid).collection(shoppingCartsCol);
      final _shoppingCartsRef = _userShoppingCartsRef.doc(foodShoppingCart.id);
      final _shoppingCart = foodShoppingCart.copyWith(quantity: quantity);
      await _shoppingCartsRef.update({
        'quantity': quantity,
      });
      onSuccess?.call(_shoppingCart);
    } catch (e) {
      print(e);
      print('Error!!!: Removing from shopping cart');
      onError?.call(e);
    }
  }

  // add to wishlist
  static Future<void> addToWishlist({
    required final FoodProduct foodProduct,
    final Function(FoodWishlist)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    final _currentDate = DateTime.now().millisecondsSinceEpoch;

    try {
      final _userWishlistsRef =
          _ref.collection(usersCol).doc(_uid).collection(wishListsCol);
      final _wishlistsRef = _userWishlistsRef
          .where('food_product_id', isEqualTo: foodProduct.id)
          .limit(1);
      final _wishlistsSnap = await _wishlistsRef.get();

      if (_wishlistsSnap.docs.isEmpty) {
        final _wishlistRef = _userWishlistsRef.doc();
        final _wishlist = FoodWishlist(
          id: _wishlistRef.id,
          uid: _uid,
          createdAt: _currentDate,
          foodProduct: foodProduct,
          foodProductId: foodProduct.id,
        );
        await _wishlistRef.set(_wishlist.toJson());

        // add this wishlist to user doc
        await FWLUserProvider.updateUserProfile({
          'wishlists': FieldValue.arrayUnion([foodProduct.id]),
        });
        onSuccess?.call(_wishlist);
      } else {
        final _wishlistSnap = _wishlistsSnap.docs.first;

        if (_wishlistSnap.exists) {
          final _wishlistRef = _userWishlistsRef.doc(_wishlistSnap.id);
          final _wishlistFromFirestore =
              FoodWishlist.fromJson(_wishlistSnap.data());
          final _wishlist = _wishlistFromFirestore.copyWith(
            createdAt: _currentDate,
          );
          await _wishlistRef.update({
            'created_at': _currentDate,
          });
          onSuccess?.call(_wishlist);
        }
      }
    } catch (e) {
      print(e);
      print('Error!!!: Adding to wishlist');
      onError?.call(e);
    }
  }

  // remove from wishlist
  static Future<void> removeFromWishlist({
    required final FoodProduct foodProduct,
    final Function(FoodWishlist)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _userWishlistsRef =
          _ref.collection(usersCol).doc(_uid).collection(wishListsCol);

      final _wishlistsRef = _userWishlistsRef
          .where('food_product_id', isEqualTo: foodProduct.id)
          .limit(1);
      final _wishlistsSnap = await _wishlistsRef.get();

      if (_wishlistsSnap.docs.isNotEmpty) {
        final _wishlistSnap = _wishlistsSnap.docs.first;
        final _wishlist = FoodWishlist.fromJson(_wishlistSnap.data());
        await _wishlistSnap.reference.delete();

        // remove this wishlist from user doc
        await FWLUserProvider.updateUserProfile({
          'wishlists': FieldValue.arrayRemove([foodProduct.id]),
        });
        onSuccess?.call(_wishlist);
      }
    } catch (e) {
      print(e);
      print('Error!!!: Removing from wishlist');
      onError?.call(e);
    }
  }

  // add product to last search
  static Future<void> addToLastSearch({
    required final FoodProduct foodProduct,
    final bool full = false,
    final Function(FoodLastSearch)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    final _currentDate = DateTime.now().millisecondsSinceEpoch;
    try {
      final _userLastSearchesRef =
          _ref.collection(usersCol).doc(_uid).collection(lastSearchesCol);
      final _lastSearchesRef = _userLastSearchesRef
          .where('food_product_id', isEqualTo: foodProduct.id)
          .limit(1);
      final _lastSearchesSnap = await _lastSearchesRef.get();

      if (_lastSearchesSnap.docs.isEmpty) {
        final _lastSearchRef = _userLastSearchesRef.doc();
        final _foodLastSearch = FoodLastSearch(
          id: _lastSearchRef.id,
          uid: _uid,
          foodProduct: foodProduct,
          foodProductId: foodProduct.id,
          createdAt: _currentDate,
        );
        await _lastSearchRef.set(_foodLastSearch.toJson());

        // add this last search to user doc
        await FWLUserProvider.updateUserProfile({
          'last_searches': FieldValue.arrayUnion([foodProduct.id]),
        });
        onSuccess?.call(_foodLastSearch);
      } else {
        final _lastSearchSnap = _lastSearchesSnap.docs.first;

        if (_lastSearchSnap.exists) {
          final _lastSearchRef = _userLastSearchesRef.doc(_lastSearchSnap.id);
          final _lastSearchFromFirestore =
              FoodLastSearch.fromJson(_lastSearchSnap.data());
          final _foodLastSearch = _lastSearchFromFirestore.copyWith(
            createdAt: _currentDate,
          );
          await _lastSearchRef.update({
            'created_at': _currentDate,
          });
          onSuccess?.call(_foodLastSearch);
        }
      }

      if (full) {
        final _lastSearchesRef =
            _userLastSearchesRef.orderBy('created_at').limit(1);
        final _lastSearchesSnap = await _lastSearchesRef.get();

        if (_lastSearchesSnap.docs.isNotEmpty) {
          final _lastSearchSnap = _lastSearchesSnap.docs.first;

          if (_lastSearchSnap.exists) {
            final _lastSearch = FoodLastSearch.fromJson(_lastSearchSnap.data());
            removeFromLastSearch(foodProduct: _lastSearch.foodProduct!);
          }
        }
      }
    } catch (e) {
      print(e);
      print('Error!!!: Adding product to last search');
      onError?.call(e);
    }
  }

  // remove from last search
  static Future<void> removeFromLastSearch({
    required final FoodProduct foodProduct,
    final Function(FoodLastSearch)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _userLastSearchesRef =
          _ref.collection(usersCol).doc(_uid).collection(lastSearchesCol);

      final _lastSearchesRef = _userLastSearchesRef
          .where('food_product_id', isEqualTo: foodProduct.id)
          .limit(1);
      final _lastSearchesSnap = await _lastSearchesRef.get();

      if (_lastSearchesSnap.docs.isNotEmpty) {
        final _lastSearchSnap = _lastSearchesSnap.docs.first;
        final _foodLastSearch = FoodLastSearch.fromJson(_lastSearchSnap.data());
        await _lastSearchSnap.reference.delete();

        // remove this last search from user doc
        await FWLUserProvider.updateUserProfile({
          'last_searches': FieldValue.arrayRemove([foodProduct.id]),
        });
        onSuccess?.call(_foodLastSearch);
      }
    } catch (e) {
      print(e);
      print('Error!!!: Removing from wishlist');
      onError?.call(e);
    }
  }

  // place an order
  static Future<void> placeOrder({
    required final FoodOrder foodOrder,
    final Function(FoodOrder)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _orderRef =
          _ref.collection(usersCol).doc(_uid).collection(ordersCol).doc();
      final _foodOrder = foodOrder.copyWith(
        id: _orderRef.id,
        uid: _uid,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );

      await _orderRef.set(_foodOrder.toJson());
      onSuccess?.call(_foodOrder);
    } catch (e) {
      print(e);
      print('Error!!!: Placing an order');
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
  static List<FoodProduct> _productsFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => FoodProduct.fromJson(e.data())).toList();
  }

  //get list of wishlists from firestore
  static List<FoodWishlist> _wishlistsFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => FoodWishlist.fromJson(e.data())).toList();
  }

  //get list of shopping carts from firestore
  static List<FoodShoppingCart> _shoppingCartsFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => FoodShoppingCart.fromJson(e.data())).toList();
  }

  //get list of last searches from firestore
  static List<FoodLastSearch> _lastSearchesFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => FoodLastSearch.fromJson(e.data())).toList();
  }

  // get list of food orders
  static List<FoodOrder> _ordersFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => FoodOrder.fromJson(e.data())).toList();
  }

  // stream of list of products
  static Stream<List<FoodProduct>> get popularProductsList {
    return _ref
        .collection(productsCol)
        .where('popular', isEqualTo: true)
        .orderBy('views', descending: true)
        .snapshots()
        .map(_productsFromFirestore);
  }

  // stream of list of wishlists
  static Stream<List<FoodWishlist>> get wishlistsList {
    return _ref
        .collection(usersCol)
        .doc(_uid)
        .collection(wishListsCol)
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(_wishlistsFromFirestore);
  }

  // stream of list of shopping carts
  static Stream<List<FoodShoppingCart>> get shoppingCartsList {
    return _ref
        .collection(usersCol)
        .doc(_uid)
        .collection(shoppingCartsCol)
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(_shoppingCartsFromFirestore);
  }

  // stream of list of last searches
  static Stream<List<FoodLastSearch>> get lastSearchesList {
    return _ref
        .collection(usersCol)
        .doc(_uid)
        .collection(lastSearchesCol)
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(_lastSearchesFromFirestore);
  }

  // stream of list of food orders
  static Stream<List<FoodOrder>> get ordersList {
    return _ref
        .collection(usersCol)
        .doc(_uid)
        .collection(ordersCol)
        .orderBy('created_at', descending: true)
        .snapshots()
        .map(_ordersFromFirestore);
  }
}
