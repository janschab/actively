

import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    Key key,
    this.controller,
    this.hintText,
    this.labelText,
    this.onFieldSubmitted,
    this.obscureText,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final ValueChanged<String> onFieldSubmitted;
  final bool obscureText;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
          decorationColor: Colors.blueGrey
      ),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
      ),
      obscureText: obscureText ?? false,
      onFieldSubmitted: onFieldSubmitted,
      validator: this.validator,
    );
  }
}