import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/widgets/errors.dart';
import 'package:myapp/widgets/loading.dart';
import 'package:myapp/widgets/main_container.dart';

import 'core/firestore/firebase_auth_instance_provider.dart';
import 'core/firestore/firebase_store_instance_provider.dart';

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<void> _initialization = initializeFirebase();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        print(snapshot);
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MainContainer();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }

  static Future<void> initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();

    String host = "localhost:8080";
    try {
      host = Platform.isAndroid ? "10.0.2.2:8080" : "localhost:8080";
    } catch(e) {
      host = "localhost:8080";
    }

    await Firebase.initializeApp();

    FirebaseFirestore.instance.settings = Settings(
      host: host,
      sslEnabled: false,
      persistenceEnabled: true,
    );

    try {
      await getFirestoreAuthInstance().enablePersistence();
      await getFirebaseAuthInstance().setPersistence(Persistence.LOCAL);
    } catch(e) {
      print(e.toString());
    }
    await getFirebaseAuthInstance().useEmulator("http://localhost:9099");
  }
}