import 'package:flutter/material.dart';

class Validators {
  static String required(value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  static bool validate(GlobalKey<FormState> formKey) {
    return formKey.currentState.validate();
  }
}