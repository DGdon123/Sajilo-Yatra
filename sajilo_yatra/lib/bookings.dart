// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class EighthRoute extends StatefulWidget {
  const EighthRoute({Key? key}) : super(key: key);

  @override
  State<EighthRoute> createState() => _EighthRouteState();
}

class _EighthRouteState extends State<EighthRoute> {
  int currentIndex = 1;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
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
        backgroundColor: const Color(0xFF222222),
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
                height: 604,
                color: Color(0xFF4E93E8),
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
                              color: Color(0xFF2222222),
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
                        color: Color(0xFF0062DE),
                      ),
                    ),
                    Container(
                      height: 34.4,
                      width: 140,
                      margin: const EdgeInsets.only(bottom: 185),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF0062DE),

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
          Container(
            width: size.width,
            height: 58,
            margin: const EdgeInsets.only(bottom: 2.6),
            color: Color(0xFFFFFFFF),
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(size.width, 20),
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.58,
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
                              setBottomBarIndex(2);
                            });
                          }),
                    ),
                    Text("MENU",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.7,
                          fontFamily: "ReemKufiInk",
                          fontSize: 12,
                          color: currentIndex == 2
                              ? Color(0xFF0062DE)
                              : Color(0xFF222222),
                        )),
                  ],
                ),
                Container(
                  width: size.width,
                  height: 64,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Align(
                            heightFactor: 0.9,
                            child: IconButton(
                                icon: Icon(
                                  Icons.home_filled,
                                  size: 35,
                                  color: currentIndex == 0
                                      ? Color(0xFF0062DE)
                                      : Color(0xFF222222),
                                ),
                                onPressed: () {
                                  setState(() {
                                    setBottomBarIndex(0);
                                    Navigator.pushNamed(context, '/seventh');
                                  });
                                }),
                          ),
                          Text("HOME",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1.05,
                                fontFamily: "ReemKufiInk",
                                fontSize: 12,
                                color: currentIndex == 0
                                    ? Color(0xFF0062DE)
                                    : Color(0xFF222222),
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          Align(
                            heightFactor: 0.9,
                            child: IconButton(
                                icon: Icon(
                                  Icons.work,
                                  size: 35,
                                  color: currentIndex == 1
                                      ? Color(0xFF0062DE)
                                      : Color(0xFF222222),
                                ),
                                onPressed: () {
                                  setState(() {
                                    setBottomBarIndex(1);
                                    Navigator.pushNamed(context, '/eighth');
                                  });
                                }),
                          ),
                          Text("BOOKINGS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1.05,
                                fontFamily: "ReemKufiInk",
                                fontSize: 12,
                                color: currentIndex == 1
                                    ? Color(0xFF0062DE)
                                    : Color(0xFF222222),
                              )),
                        ],
                      ),
                      Container(
                        width: size.width * 0.12,
                      ),
                      Column(
                        children: [
                          Align(
                            heightFactor: 0.9,
                            child: IconButton(
                                icon: Icon(
                                  Icons.help,
                                  size: 35,
                                  color: currentIndex == 3
                                      ? Color(0xFF0062DE)
                                      : Color(0xFF222222),
                                ),
                                onPressed: () {
                                  setState(() {
                                    Navigator.pushNamed(context, '/nineth');
                                    setBottomBarIndex(3);
                                  });
                                }),
                          ),
                          Text("HELP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1.05,
                                fontFamily: "ReemKufiInk",
                                fontSize: 12,
                                color: currentIndex == 3
                                    ? Color(0xFF0062DE)
                                    : Color(0xFF222222),
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          Align(
                            heightFactor: 0.9,
                            child: IconButton(
                                icon: Icon(
                                  Icons.logout_outlined,
                                  size: 35,
                                  color: currentIndex == 4
                                      ? Color(0xFF0062DE)
                                      : Color(0xFF222222),
                                  semanticLabel: "Home",
                                ),
                                onPressed: () {
                                  setState(() {
                                    Navigator.pushNamed(context, '/fifth');
                                    setBottomBarIndex(4);
                                  });
                                }),
                          ),
                          Text("LOGOUT",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1.05,
                                fontFamily: "ReemKufiInk",
                                fontSize: 12,
                                color: currentIndex == 4
                                    ? Color(0xFF0062DE)
                                    : Color(0xFF222222),
                              )),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
