import 'package:flutter/material.dart';
import 'package:myapp/core/widgets/bottomNavigationBar.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    Key key,
    @required this.title,
    @required this.child,
    @required this.index,
    this.floatingActionButton,
  }) : super(key: key);

  final String title;
  final Widget child;
  final int index;
  final FloatingActionButton floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: Container(),
      ),
      body: child,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: index
      ),
    );
  }
}
