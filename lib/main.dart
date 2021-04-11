import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/firestore/firebase_store_instance_provider.dart';

import 'core/authentication/authentication.dart';
import 'core/firestore/firebase_auth_instance_provider.dart';
import 'core/authentication/user_resolver.dart';
import 'core/services/navigator.dart';
import 'modules/activities/activities.dart';
import 'modules/groups/groups.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String host = "localhost:8080";
  try {
    host = Platform.isAndroid ? "10.0.2.2:8080" : "localhost:8080";
  } catch(e) {
    host = "localhost:8080";
  }
  FirebaseFirestore.instance.settings = Settings(
    host: host,
    sslEnabled: false,
    persistenceEnabled: true,
  );

  try {
    await getFirestoreAuthInstance().enablePersistence();
  } catch(e) {
    print(e.toString());
  }
  await getFirebaseAuthInstance().useEmulator("http://localhost:9099");
  await getFirebaseAuthInstance().setPersistence(Persistence.LOCAL);

  runApp(AppContainer());
}

class AppContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: App(),
    );
  }
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
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
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Loading...', textDirection: TextDirection.ltr);
  }
}

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('SomethingWentWrong', textDirection: TextDirection.ltr);
  }
}

class MainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 2',
      initialRoute: '/',
      routes: {
        '/': (context) => UserResolver(),
        '/login': (context) => Authentication(),
        '/groups': (context) => Groups(),
        '/activities': (context) => Activities(),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.dark
      ),
      navigatorKey: NavigatorService.instance.navigationKey,
    );
  }
}
