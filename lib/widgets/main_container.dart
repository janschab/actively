import 'package:flutter/material.dart';
import 'package:myapp/core/authentication/authentication.dart';
import 'package:myapp/core/authentication/user_resolver.dart';
import 'package:myapp/core/routes/routes.dart';
import 'package:myapp/core/services/navigator.dart';
import 'package:myapp/modules/activities/activities.dart';
import 'package:myapp/modules/groups/groups.dart';

class MainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 2',
      initialRoute: '/',
      routes: getRoutes(),
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          brightness: Brightness.dark
      ),
      navigatorKey: NavigatorService.instance.navigationKey,
    );
  }
}
