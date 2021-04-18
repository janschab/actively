import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key key,
    @required this.onPressed,
    @required this.text,
    this.color,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: color != null ? color : Colors.blueGrey,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
