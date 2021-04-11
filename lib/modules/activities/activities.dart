import 'package:flutter/material.dart';
import 'package:myapp/core/widgets/bottomNavigationBar.dart';

import '../groups/list.dart';

class Activities extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activities"),
        leading: Container(),
      ),
      body: Container(
        child: Center(
          child: GroupsList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: 0
      ),
    );
  }
}
