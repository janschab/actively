import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/core/firestore/firebase_store_instance_provider.dart';
import 'package:myapp/core/services/user.dart';

class FirestoreService {
  static Future<DocumentSnapshot> getUser() {
    return getFirebaseFirestoreInstance()
        .collection("users")
        .doc(GlobalService.instance.userID)
        .get();
  }

  static Future<void> setTagsToUser(Iterable<int> tags) {
    return getFirebaseFirestoreInstance()
        .collection("users")
        .doc(GlobalService.instance.userID)
        .set({"tags": tags}, SetOptions(merge: true));
  }

  static Future<void> setUserDetails(String firstName, String lastName) {
    return getFirebaseFirestoreInstance()
        .collection("users")
        .doc(GlobalService.instance.userID)
        .set({"first_name": firstName, "last_name": lastName},
            SetOptions(merge: true));
  }
}
