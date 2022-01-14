import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_with_love/enums/online_status.dart';
import 'package:food_with_love/models/food_with_love_user_model.dart';
import 'package:food_with_love/src/services/constants.dart';

class FWLUserProvider {
  static final _ref = FirebaseFirestore.instance;
  static final _auth = FirebaseAuth.instance;
  static final _uid = _auth.currentUser?.uid;

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

  // set user online status
  static Future<void> setUserOnlineStatus(
    final OnlineStatus onlineStatus, {
    final Function(dynamic)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _userRef = _ref.collection(usersCol).doc(_uid);
      final _data = {
        'online_status': onlineStatus.index,
      };
      if (onlineStatus == OnlineStatus.offline) {
        _data['last_online'] = DateTime.now().millisecondsSinceEpoch;
      }
      await _userRef.update(_data);
      onSuccess?.call(_uid);
    } catch (e) {
      print(e);
      print('Error!!!: Setting online status');
      onError?.call(e);
    }
  }

  // update user profile
  static Future<void> updateUserProfile(
    final Map<String, dynamic> data, {
    final Function(dynamic)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _appUserRef = _ref.collection(usersCol).doc(_uid);
      await _appUserRef.update(data);
      onSuccess?.call(_uid);
    } catch (e) {
      print(e);
      print('Error!!!: Updating user profile');
      onError?.call(e);
    }
  }

  // get user from firestore
  static FoodWithLoveUser _userFromFirebase(
    final DocumentSnapshot<Map<String, dynamic>> snap,
  ) {
    return FoodWithLoveUser.fromJson(snap.data() ?? {});
  }

  // stream of user
  static Stream<FoodWithLoveUser> get appUser {
    return _ref
        .collection(usersCol)
        .doc(_uid)
        .snapshots()
        .map(_userFromFirebase);
  }
}
