import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/routes/routes.dart';
import 'package:myapp/core/services/navigator.dart';
import 'package:myapp/core/services/user.dart';

import '../firestore/firebase_auth_instance_provider.dart';

class UserResolver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserResolverState();
}

class _UserResolverState extends State<UserResolver> {
  StreamSubscription<User> _listener;

  @override
  void initState() {
    super.initState();
    _listener = getFirebaseAuthInstance().authStateChanges().listen((User user) {
      if (user == null) {
        NavigatorService.instance.navigateTo(routeLogin);
      } else {
        GlobalService.instance.userID = user.uid;
        NavigatorService.instance.navigateTo(routeGroups);
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
