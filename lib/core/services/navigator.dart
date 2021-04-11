import 'package:flutter/material.dart';

class NavigatorService {
  GlobalKey<NavigatorState> navigationKey;

  static NavigatorService instance = NavigatorService();

  NavigatorService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  Future<dynamic> navigateToReplacement(String _rn) {
    return navigationKey.currentState.pushReplacementNamed(_rn);
  }

  Future<dynamic> navigateTo(String _rn) {
    return navigationKey.currentState.pushNamed(_rn);
  }

  Future<dynamic> navigateToRoute(MaterialPageRoute _rn) {
    return navigationKey.currentState.push(_rn);
  }

  goBack() {
    return navigationKey.currentState.pop();
  }
}
