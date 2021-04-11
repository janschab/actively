
import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<QuerySnapshot> getGroups() {
  CollectionReference groups = firestore.collection('groups');

  return groups.get();
}