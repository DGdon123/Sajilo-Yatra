import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bookings.dart';
import '../help.dart';
import '../menu.dart';
import '../userhome.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;
  Offset offset = const Offset(1, 0);
  final List<Widget> screens = [
    const ThirdRoute(
      userId: '',
    ),
    const Menu(),
    const EighthRoute(),
    const NinethScreen(),
  ];

  void goToEighthRoute() {
    selectedIndex = 1;
    screens[1] = const EighthRoute();
    update();
  }

  changeIndex(index) {
    if (index > selectedIndex) {
      offset = const Offset(1, 0);
    } else {
      offset = const Offset(-1, 0);
    }
    selectedIndex = index;
    update();
  }
}
