// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sajilo_yatra/ui_helper.dart';

class EighthRoute extends StatefulWidget {
  const EighthRoute({Key? key}) : super(key: key);

  @override
  State<EighthRoute> createState() => _EighthRouteState();
}

class _EighthRouteState extends State<EighthRoute> {
  int _selectedIndex = 1;

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
        title: const Text('Bookings',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: 'ComicNeue',
              fontSize: 24,
              fontWeight: FontWeight.w900,
            )),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      heightFactor: 0.6,
                      child: Container(
                        width: 395,
                        height: 70,
                        color: Color(0xFFFFFFFF),
                        child: Text(
                          "You have no bookings yet.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF0062DE),
                              fontSize: 19.5,
                              fontFamily: "Cambay",
                              fontWeight: FontWeight.w900,
                              height: 3.85),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 1.8,
                      widthFactor: 4.4,
                      child: Icon(
                        Icons.event_busy_rounded,
                        size: 170,
                        color: Color(0xFF222222),
                      ),
                    ),
                    Container(
                      height: 34.4,
                      width: 140,
                      margin: const EdgeInsets.only(bottom: 185),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF222222),

                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(
                                  12)), //background color of button
                        ),
                        child: const Text(
                          "Book Now",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1.2,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF),
                              fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/seventh');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
