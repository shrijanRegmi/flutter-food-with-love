import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_with_love/models/user_model.dart';
import 'package:food_with_love/src/services/firestore_services/fwl_user_provider.dart';

class FWLAuthProvider {
  static final _auth = FirebaseAuth.instance;

  // log in with email and password
  static Future loginWithEmailAndPassword(
    final String email,
    final String password, {
    final Function(dynamic)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      onSuccess?.call(_result);
    } catch (e) {
      print(e);
      print('Error!!!: Logging in user with email and password');
      onError?.call(e);
    }
  }

  // create account with email and password
  static Future createAccountWithAppUserAndPassword(
    final FoodWithLoveUser appUser,
    final String password, {
    final Function(dynamic)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _result = await _auth.createUserWithEmailAndPassword(
        email: appUser.email,
        password: password,
      );
      final _appUser = appUser.copyWith(uid: _result.user?.uid);

      await FWLUserProvider.sendUserToFirestore(_appUser);

      onSuccess?.call(_result);
    } catch (e) {
      print(e);
      print('Error!!!: Logging in user with email and password');
      onError?.call(e);
    }
  }

  // appuser from firebase
  FoodWithLoveUser? _appUserFromFirebase(final User? user) {
    return user == null
        ? null
        : FoodWithLoveUser(
            uid: user.uid,
            name: '',
            email: '',
            photoUrl: '',
          );
  }

  // stream of auth changes
  Stream<FoodWithLoveUser?> get userAuthState {
    return _auth.authStateChanges().map(_appUserFromFirebase);
  }
}