import 'package:flutter/material.dart';

import '../groups/list.dart';

class Groups extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Groups"),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Activities",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: "Groups",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: "Profile",
          ),
        ],
        selectedItemColor: Colors.deepOrange,
        onTap: handleNavigationBarTap,
      ),
    );
  }

  handleNavigationBarTap(index) {
    switch(index) {
      case 0:
        Navigator.pushNamed(context, "/activities");
        break;
      case 1:
        Navigator.pushNamed(context, "/groups");
        break;
      case 2:
        Navigator.pushNamed(context, "/profile");
        break;
    }
  }
}
