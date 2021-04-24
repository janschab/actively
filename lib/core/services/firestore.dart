import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/core/firestore/firebase_store_instance_provider.dart';
import 'package:myapp/core/firestore/model.dart';
import 'package:myapp/core/services/user.dart';

class FirestoreService {
  static Future<DocumentSnapshot> getUser() {
    return getFirebaseFirestoreInstance().collection("users").doc(GlobalService.instance.userID).get();
  }
}