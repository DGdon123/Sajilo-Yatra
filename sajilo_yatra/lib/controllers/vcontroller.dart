import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajilo_yatra/vehiclemenu.dart';

import '../vehcileprofile.dart';
import '../vehicleownerhome.dart';
import '../vehicletickets.dart';
import '../vhelp.dart';

class NavController extends GetxController {
  int selectedIndex = 0;
  Offset offset = const Offset(1, 0);
  final List<Widget> screens = [
    const VehicleHome(
      userId: '',
      going: '',
      leaving: '',
    ),
    const VehicleTickets(),
    const VMenu(),
    const VHelp(),
    const Profile(
      userId: '',
    ),
  ];

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
