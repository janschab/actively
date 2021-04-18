import 'package:flutter/material.dart';

class GlobalService {
  String userID;

  static GlobalService instance = GlobalService();

  GlobalService() {
    userID = null;
  }
}
