import 'package:flutter/material.dart';
import 'package:myapp/app.dart';

void main() async {
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

