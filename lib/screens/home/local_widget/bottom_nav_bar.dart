import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/constant/color.dart';
import 'package:ngabolang/screens/maps/maps_screen.dart';

import '../home_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {
        if (index == 0) {
          Get.toNamed(HomePage.id);
        } else if (index == 1) {
          Get.toNamed(MapsScreen.id);
        } else {
          Get.snackbar('Sorry', 'feature not yet available', colorText: Colors.white, backgroundColor: Colors.red);
        }
      },
      backgroundColor: bottomNavBarColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity_outlined),
          label: 'profile',
        ),
      ],
    );
  }
}
