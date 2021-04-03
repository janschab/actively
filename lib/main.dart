import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/authentication/user_resolver.dart';

void main() {
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
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.dark
      ),
      home: UserResolver(),
    );
  }
}
