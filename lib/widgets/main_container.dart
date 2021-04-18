import 'package:flutter/material.dart';
import 'package:myapp/core/routes/routes.dart';
import 'package:myapp/core/services/navigator.dart';

class MainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 2',
      initialRoute: '/',
      // onGenerateRoute: handleGenerateRoute,
      routes: getRoutes(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      navigatorKey: NavigatorService.instance.navigationKey,
    );
  }
}
