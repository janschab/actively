import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/core/services/user.dart';

class GroupsService {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<QuerySnapshot> getGroups() {
    CollectionReference groups = firestore.collection('groups');

    return groups.get();
  }

  static Future<DocumentReference> addGroup({String name}) {
    CollectionReference groups = firestore.collection('groups');

    return groups.add({
      "name": name,
      "ownerID": GlobalService.instance.userID,
    });
  }
}