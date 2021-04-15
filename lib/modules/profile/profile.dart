import 'package:flutter/material.dart';
import 'package:myapp/core/widgets/bottomNavigationBar.dart';

import '../groups/list.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
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
        currentIndex: 2,
      ),
    );
  }
}
