import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/authentication/authentication.dart';
import 'package:myapp/modules/dashboard/dashboard.dart';

class UserResolver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserResolverState();
}

class _UserResolverState extends State<UserResolver> {

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Authentication(),
            ));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
