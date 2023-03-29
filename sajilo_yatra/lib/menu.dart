// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sajilo_yatra/ui_helper.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
          if (value == 0) Navigator.pushNamed(context, '/seventh');
          if (value == 1) Navigator.pushNamed(context, '/eighth');
          if (value == 2) Navigator.pushNamed(context, '/eleventh');
          if (value == 3) Navigator.pushNamed(context, '/nineth');
          if (value == 4) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: Text("Logout"),
                      content: Text("Are you sure you want to logout?"),
                      actions: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 39),
                          child: Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                child: Text("Yes"),
                                onPressed: () {
                                  // Perform logout here
                                  Navigator.pushNamed(context, '/third');
                                },
                              ),
                              UiHelper.horizontaSpace(hspace: Spacing.xxlarge),
                              UiHelper.horizontaSpace(hspace: Spacing.large),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  widthFactor: 1.2,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                    ),
                                    child: Text("No"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ))
                            ],
                          ),
                        )
                      ]);
                });
          }
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
              icon: Container(
                margin: const EdgeInsets.only(top: 20),
              ), // empty container to align cart button in the center
              label: "Menu"),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: "Help",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout_outlined),
            label: "Logout",
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: FloatingActionButton(
            elevation: 600,
            backgroundColor: Color(0xFFFFFFFF),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 5.7,
                  color: Color(0xFF4E93E8),
                ),
                //to set border radius to button
                borderRadius: BorderRadius.circular(35)),
            child: Image.asset(
              'images/sajilo.png',
              height: 100,
              fit: BoxFit.fill,
            ),
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, '/seventh');
              });
            }),
      ),
      // position the cart button in the center of the bottom navigation bar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
