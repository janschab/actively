import 'package:flutter/material.dart';
import 'package:myapp/core/services/user.dart';
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
      child: Center(
        child: Container(
          child: Column(
            children: [
              Text(GlobalService.instance.user.firstName),
              Text(GlobalService.instance.user.lastName),
            ],
          ),
        ),
      ),
      index: 2,
    );
  }
}
