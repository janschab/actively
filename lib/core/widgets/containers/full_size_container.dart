import 'package:flutter/material.dart';

class FullSizeContainer extends StatelessWidget {
  const FullSizeContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: child,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          constraints: BoxConstraints(maxWidth: 500),
          margin: EdgeInsets.only(bottom: 150),
        ),
      ),
    );
  }
}
