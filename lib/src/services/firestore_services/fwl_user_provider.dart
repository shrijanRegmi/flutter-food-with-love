import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_with_love/models/user_model.dart';

class FWLUserProvider {
  static final _ref = FirebaseFirestore.instance;

  // send user to firebase
  static Future<void> sendUserToFirestore(
    final FoodWithLoveUser appUser,
  ) async {
    try {
      if (appUser.uid == '') throw (Exception('Uid must be a valid string'));

      final _usersCol = _ref.collection('users').doc(appUser.uid);
      await _usersCol.set(appUser.toJson());
    } catch (e) {
      print(e);
      print('Error!!!: Sending user to firestore');
      throw (e);
    }
  }
}
