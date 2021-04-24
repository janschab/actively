import 'package:flutter/material.dart';
import 'package:myapp/core/routes/routes.dart';
import 'package:myapp/core/services/navigator.dart';
import 'package:myapp/core/widgets/bottomNavigationBar.dart';
import 'package:myapp/core/widgets/containers/main_scaffold.dart';

import 'list.dart';

class Groups extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: "Groups",
      child: Container(
        child: Center(
          child: GroupsList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => NavigatorService.instance.navigateTo(routeGroupsAdd),
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
      index: 1,
    );
  }
}
