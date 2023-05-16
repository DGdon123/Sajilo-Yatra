// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quickalert/quickalert.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:sajilo_yatra/ui_helper.dart';

class VMenu extends StatefulWidget {
  const VMenu({Key? key}) : super(key: key);

  @override
  State<VMenu> createState() => _VMenuState();
}

class _VMenuState extends State<VMenu> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String? grade;
  String? product;
  var num = 1;
  String? thickness;
  String? price;
  var gradeName;
  var productName;
  var thicknessName;
  var priceName;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0062DE),
        centerTitle: true,
        title: Text('Menu',
            style: TextStyle(
              color: const Color(0xFFFFFFFF),
              fontFamily: 'ComicNeue',
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            )),
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: UiHelper.displayHeight(context) * 0.019,
              color: const Color(0xFFEFEEF3),
            ),
            ListTile(
                leading: Icon(
                  Icons.edit_document,
                  color: const Color(0xFF0062DE),
                  size: UiHelper.displayWidth(context) * 0.07,
                ),
                title: Text('Write Feedback',
                    style: TextStyle(
                        color: const Color(0xFF222222),
                        fontFamily: "NotoSans",
                        fontSize: UiHelper.displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w400)),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: const Color(0xFFD6D6D6),
                  size: UiHelper.displayWidth(context) * 0.08,
                ),
                onTap: (() {
                  Navigator.pushNamed(context, '/ninetenth');
                })),
            UiHelper.verticalSpace(vspace: Spacing.xxsmall),
            Container(
              height: UiHelper.displayHeight(context) * 0.0015,
              color: const Color(0xFFD6D6D6),
            ),
            ListTile(
                leading: Icon(
                  Icons.info_outline_rounded,
                  color: const Color(0xFF0062DE),
                  size: UiHelper.displayWidth(context) * 0.07,
                ),
                title: Text('About Us',
                    style: TextStyle(
                        color: const Color(0xFF222222),
                        fontFamily: "NotoSans",
                        fontSize: UiHelper.displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w400)),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: const Color(0xFFD6D6D6),
                  size: UiHelper.displayWidth(context) * 0.08,
                ),
                onTap: (() {
                  Get.toNamed('/line21');
                })),
            UiHelper.verticalSpace(vspace: Spacing.xxsmall),
            Container(
              height: UiHelper.displayHeight(context) * 0.0015,
              color: const Color(0xFFD6D6D6),
            ),
            ListTile(
                leading: Icon(
                  Icons.phone,
                  color: const Color(0xFF0062DE),
                  size: UiHelper.displayWidth(context) * 0.07,
                ),
                title: Text('Contact Us',
                    style: TextStyle(
                        color: const Color(0xFF222222),
                        fontFamily: "NotoSans",
                        fontSize: UiHelper.displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w400)),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: const Color(0xFFD6D6D6),
                  size: UiHelper.displayWidth(context) * 0.08,
                ),
                onTap: (() {
                  Navigator.pushNamed(context, '/eighth');
                })),
            UiHelper.verticalSpace(vspace: Spacing.xxsmall),
            Container(
              height: UiHelper.displayHeight(context) * 0.0015,
              color: const Color(0xFFD6D6D6),
            ),
            ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  color: const Color(0xFF0062DE),
                  size: UiHelper.displayWidth(context) * 0.07,
                ),
                title: Text('LogOut',
                    style: TextStyle(
                        color: const Color(0xFF222222),
                        fontFamily: "NotoSans",
                        fontSize: UiHelper.displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w400)),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: const Color(0xFFD6D6D6),
                  size: UiHelper.displayWidth(context) * 0.08,
                ),
                onTap: (() {
                  QuickAlert.show(
                    context: context,
                    onConfirmBtnTap: () {
                      Get.offAllNamed('/second');
                    },
                    type: QuickAlertType.confirm,
                    text: 'Do you want to logout',
                    confirmBtnText: 'Yes',
                    cancelBtnText: 'No',
                    confirmBtnColor: const Color(0xFF0062DE),
                  );
                })),
            UiHelper.verticalSpace(vspace: Spacing.xxsmall),
            Container(
              height: UiHelper.displayHeight(context) * 0.0015,
              color: const Color(0xFFD6D6D6),
            ),
          ],
        ),
      ),
    );
  }
}
