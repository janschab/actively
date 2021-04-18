import 'package:flutter/material.dart';
import 'package:myapp/core/routes/routes.dart';
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
              if (currentIndex != index) {
                switch (index) {
                  case 0:
                    NavigatorService.instance.navigateTo(routeActivities);
                    break;
                  case 1:
                    NavigatorService.instance.navigateTo(routeGroups);
                    break;
                  case 2:
                    NavigatorService.instance.navigateTo(routeProfile);
                    break;
                }
              }
            });
}
