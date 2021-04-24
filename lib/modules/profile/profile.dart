import 'package:flutter/material.dart';
import 'package:myapp/core/widgets/bottomNavigationBar.dart';
import 'package:myapp/core/widgets/containers/main_scaffold.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: "Profile",
      child: Container(
        child: Center(
          child: Text("Profile"),
        ),
      ),
      index: 2,
    );
  }
}
