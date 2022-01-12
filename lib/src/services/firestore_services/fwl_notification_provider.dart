import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_with_love/models/food_notification_model.dart';
import 'package:food_with_love/src/services/constants.dart';

class FWLNotificationProvider {
  static final _ref = FirebaseFirestore.instance;
  static final _auth = FirebaseAuth.instance;
  static final _uid = _auth.currentUser?.uid;

  // read a notification
  static Future<void> readNotification(
    final FoodNotification notification, {
    final Function(dynamic)? onSuccess,
    final Function(dynamic)? onError,
  }) async {
    try {
      final _notificationRef = _ref
          .collection(usersCol)
          .doc(_uid)
          .collection(notificationsCol)
          .doc(notification.id);
      await _notificationRef.update({
        'read': true,
      });
      onSuccess?.call(notification);
    } catch (e) {
      print(e);
      print('Error!!!: Reading a notification');
      onError?.call(e);
    }
  }

  // get list of notifications from firestore
  List<FoodNotification> _notificationsFromFirestore(
    QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => FoodNotification.fromJson(e.data())).toList();
  }

  // stream of list of notifications
  Stream<List<FoodNotification>> get notificationsList {
    return _ref
        .collection(usersCol)
        .doc(_uid)
        .collection(notificationsCol)
        .snapshots()
        .map(_notificationsFromFirestore);
  }
}
