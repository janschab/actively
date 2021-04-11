import 'package:flutter/material.dart';
import 'package:myapp/core/services/navigator.dart';

class MyBottomNavigationBar extends BottomNavigationBar {
  MyBottomNavigationBar({currentIndex})
      : super(
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: "Activities",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group),
                label: "Groups",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
                label: "Profile",
              ),
            ],
            selectedItemColor: Colors.deepOrange,
            onTap: (index) {
              print(index);
              switch (index) {
                case 0:
                  print('/activities');
                  NavigatorService.instance.navigateTo('/activities');
                  break;
                case 1:
                  NavigatorService.instance.navigateTo('/groups');
                  break;
                case 2:
                  NavigatorService.instance.navigateTo('/profile');
                  break;
              }
            });
}
