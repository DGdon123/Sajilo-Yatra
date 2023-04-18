// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

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
        title: const Text('Menu',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: 'ComicNeue',
              fontSize: 24,
              fontWeight: FontWeight.w900,
            )),
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: UiHelper.displayHeight(context) * 0.019,
              color: Color(0xFFEFEEF3),
            ),
            ListTile(
                leading: Icon(
                  Icons.edit_document,
                  color: Color(0xFF0062DE),
                  size: UiHelper.displayWidth(context) * 0.07,
                ),
                title: Text('Write Feedback',
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontFamily: "NotoSans",
                        fontSize: UiHelper.displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w400)),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Color(0xFFD6D6D6),
                  size: UiHelper.displayWidth(context) * 0.08,
                ),
                onTap: (() {
                  Navigator.pushNamed(context, '/ninetenth');
                })),
            UiHelper.verticalSpace(vspace: Spacing.xxsmall),
            Container(
              height: UiHelper.displayHeight(context) * 0.0015,
              color: Color(0xFFD6D6D6),
            ),
            ListTile(
                leading: Icon(
                  Icons.help_outline_rounded,
                  color: Color(0xFF0062DE),
                  size: UiHelper.displayWidth(context) * 0.07,
                ),
                title: Text('FAQs',
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontFamily: "NotoSans",
                        fontSize: UiHelper.displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w400)),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Color(0xFFD6D6D6),
                  size: UiHelper.displayWidth(context) * 0.08,
                ),
                onTap: (() {
                  Navigator.pushNamed(context, '/nineth');
                })),
            UiHelper.verticalSpace(vspace: Spacing.xxsmall),
            Container(
              height: UiHelper.displayHeight(context) * 0.0015,
              color: Color(0xFFD6D6D6),
            ),
            ListTile(
                leading: Icon(
                  Icons.info_outline_rounded,
                  color: Color(0xFF0062DE),
                  size: UiHelper.displayWidth(context) * 0.07,
                ),
                title: Text('About Us',
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontFamily: "NotoSans",
                        fontSize: UiHelper.displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w400)),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Color(0xFFD6D6D6),
                  size: UiHelper.displayWidth(context) * 0.08,
                ),
                onTap: (() {
                  Navigator.pushNamed(context, '/eighth');
                })),
            UiHelper.verticalSpace(vspace: Spacing.xxsmall),
            Container(
              height: UiHelper.displayHeight(context) * 0.0015,
              color: Color(0xFFD6D6D6),
            ),
            ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Color(0xFF0062DE),
                  size: UiHelper.displayWidth(context) * 0.07,
                ),
                title: Text('Contact Us',
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontFamily: "NotoSans",
                        fontSize: UiHelper.displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w400)),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Color(0xFFD6D6D6),
                  size: UiHelper.displayWidth(context) * 0.08,
                ),
                onTap: (() {
                  Navigator.pushNamed(context, '/eighth');
                })),
            UiHelper.verticalSpace(vspace: Spacing.xxsmall),
            Container(
              height: UiHelper.displayHeight(context) * 0.0015,
              color: Color(0xFFD6D6D6),
            ),
            ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  color: Color(0xFF0062DE),
                  size: UiHelper.displayWidth(context) * 0.07,
                ),
                title: Text('LogOut',
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontFamily: "NotoSans",
                        fontSize: UiHelper.displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w400)),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Color(0xFFD6D6D6),
                  size: UiHelper.displayWidth(context) * 0.08,
                ),
                onTap: (() {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            backgroundColor: Color(0xFF0062DE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            title: Text("Are you sure you want to logout?"),
                            titleTextStyle: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Nunito",
                              fontSize: UiHelper.displayWidth(context) * 0.043,
                            ),
                            actions: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(bottom: 11),
                                child: Row(
                                  children: [
                                    UiHelper.horizontaSpace(
                                        hspace: Spacing.large),
                                    UiHelper.horizontaSpace(
                                        hspace: Spacing.large),
                                    UiHelper.horizontaSpace(
                                        hspace: Spacing.large),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFFFFFFF),
                                      ),
                                      child: Text("Yes",
                                          style: TextStyle(
                                            color: Color(0xFF0062DE),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Cabin",
                                            fontSize:
                                                UiHelper.displayWidth(context) *
                                                    0.045,
                                          )),
                                      onPressed: () {
                                        // Perform logout here
                                        Navigator.pushNamed(context, '/second');
                                      },
                                    ),
                                    UiHelper.horizontaSpace(
                                        hspace: Spacing.xxlarge),
                                    UiHelper.horizontaSpace(
                                        hspace: Spacing.xlarge),
                                    UiHelper.horizontaSpace(
                                        hspace: Spacing.large),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFFFFFFF),
                                      ),
                                      child: Text("No",
                                          style: TextStyle(
                                            color: Color(0xFF0062DE),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Cabin",
                                            fontSize:
                                                UiHelper.displayWidth(context) *
                                                    0.045,
                                          )),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ),
                              )
                            ]);
                      });
                })),
            UiHelper.verticalSpace(vspace: Spacing.xxsmall),
            Container(
              height: UiHelper.displayHeight(context) * 0.0015,
              color: Color(0xFFD6D6D6),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF4E93E8),
        iconSize: 28,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF222222),
        unselectedItemColor: Color(0xFFFFFFFF),
        selectedFontSize: 12,
        onTap: (value) {
          if (value == 0) Navigator.pushNamed(context, '/line7');
          if (value == 1) Navigator.pushNamed(context, '/line10');
          if (value == 2) Navigator.pushNamed(context, '/line14');
          if (value == 3) Navigator.pushNamed(context, '/line15');
          if (value == 4) Navigator.pushNamed(context, '/line13');
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: "Bookings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: "Help",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
