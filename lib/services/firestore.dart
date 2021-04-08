
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<DocumentSnapshot> getGroups() {
  CollectionReference groups = FirebaseFirestore.instance.collection('groups');

  return groups.doc('QCsTDtFnuexLaDOp3u3X').get();
}