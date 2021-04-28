import 'package:cloud_firestore/cloud_firestore.dart';

enum Collection { users }

class UserModel {
  final String email;
  final String firstName;
  final String lastName;
  final String uid;
  final List<dynamic> tags;

  UserModel({this.firstName, this.lastName, this.email, this.uid, this.tags});

  factory UserModel.fromMap(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data();

    return UserModel(
      email: data["email"],
      firstName: data["first_name"],
      lastName: data["last_name"],
      uid: data["uid"],
      tags: data["tags"],
    );
  }
}
