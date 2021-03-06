import 'package:flutter/material.dart';
import 'package:myapp/core/widgets/containers/main_scaffold.dart';

import 'widgets/calendar.dart';

class Activities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: "Activities",
      child: Container(
        child: Calendar(),
      ),
      index: 0,
    );
  }
}
