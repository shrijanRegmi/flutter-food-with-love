import 'package:firebase_core/firebase_core.dart';

class FWLInitializer {
  static Future initializeFirebase() async {
    return await Firebase.initializeApp();
  }
}
