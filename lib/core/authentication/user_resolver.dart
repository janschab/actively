import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserResolver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserResolverState();
}

class _UserResolverState extends State<UserResolver> {
  StreamSubscription<User> _listener;

  @override
  void initState() {
    super.initState();
    _listener = FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        Navigator.pushNamed(
            context,
            '/login'
        );
      } else {
        Navigator.pushNamed(
            context,
            '/dashboard'
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    _listener.cancel();
    super.dispose();
  }
}
