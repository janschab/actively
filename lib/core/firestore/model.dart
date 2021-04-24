import 'package:cloud_firestore/cloud_firestore.dart';

enum Collection {
  users
}

class UserModel {
  final String email;
  final String uid;
  final List<int> tags;

  UserModel({this.email, this.uid, this.tags});

  factory UserModel.fromMap(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data();

    return UserModel(
      email: data["email"],
      uid: data["uid"],
      tags: data["tags"],
    );
  }
}
