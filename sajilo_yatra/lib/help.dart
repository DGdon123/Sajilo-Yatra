// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class NinethScreen extends StatefulWidget {
  const NinethScreen({Key? key}) : super(key: key);

  @override
  State<NinethScreen> createState() => _NinethScreenState();
}

class _NinethScreenState extends State<NinethScreen> {
  int currentIndex = 3;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF4E93E8),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2222222),
        centerTitle: true,
        title: const Text('Help',
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
                      child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 14),
              child: Text(
                "FAQs",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Color(0xFFFFFFFFF),
                  fontSize: 14,
                  fontFamily: "BalooTammudu2",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 0, bottom: 5),
              child: Text(
                "Frequently asked questions",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Color(0xFFFFFFFFF),
                  fontSize: 25.5,
                  height: 1.44,
                  fontFamily: "BalooTammudu2",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 0),
              child: Text(
                "Have questions? We're here to help.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  height: 0.85,
                  color: Color(0xFFFFFFFFF),
                  fontSize: 16,
                  fontFamily: "Athiti",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(
              thickness: 3.7, // thickness of the line
              indent: 0, // empty space to the leading edge of divider.
              endIndent: 0, // empty space to the trailing edge of the divider.
              color: Color(
                  0xFFFFFFFFF), // The color to use when painting the line.
              height: 40, // The divider's height extent.
            ),
            Card(
                margin: EdgeInsets.only(top: 0, left: 12, right: 12),
                color: Color(0xFF2222222),
                child: ExpansionTile(
                  title: Text(
                    "Is your payment platform secure?",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16.8,
                        fontFamily: "Cambay",
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28,
                    color: Color(0xFFFFFFFF),
                  ),
                  children: [
                    Container(
                      color: Color(0xFFFFFFFF),
                      height: 94,
                      width: 400,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Yes, it is the most safest payment platform ever done. \nUsers would perform cash transactions hand to hand \nwith the vehicle owner.",
                          style: TextStyle(
                            color: Color(0xFF2222222),
                            fontSize: 15,
                            fontFamily: "Athiti",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Card(
                margin: EdgeInsets.only(top: 12, left: 12, right: 12),
                color: Color(0xFF2222222),
                child: ExpansionTile(
                  title: Text(
                    "How do I change my account email and password?",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16.8,
                        fontFamily: "Cambay",
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28,
                    color: Color(0xFFFFFFFF),
                  ),
                  children: [
                    Container(
                      color: Color(0xFFFFFFFF),
                      height: 118,
                      width: 400,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "You can change your password by clicking forgot \npassword and resetting your password but, you are \nnot reset your email. If you want to use another \nemail, you have to register it in the application.",
                          style: TextStyle(
                            color: Color(0xFF2222222),
                            fontSize: 15,
                            fontFamily: "Athiti",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Card(
                margin: EdgeInsets.only(top: 12, left: 12, right: 12),
                color: Color(0xFF2222222),
                child: ExpansionTile(
                  title: Text(
                    "Drivers do not respond",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16.8,
                        fontFamily: "Cambay",
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28,
                    color: Color(0xFFFFFFFF),
                  ),
                  children: [
                    Container(
                      color: Color(0xFFFFFFFF),
                      height: 118,
                      width: 400,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "If a driver has not responded to your ride request, try \nincreasing the price for the ride, then resubmit your \nrequest. Bear in mind that during rush hour drivers \nare busier, so expect to pay more for the ride.",
                          style: TextStyle(
                            color: Color(0xFF2222222),
                            fontSize: 15,
                            fontFamily: "Athiti",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Card(
                margin: EdgeInsets.only(top: 12, left: 12, right: 12),
                color: Color(0xFF2222222),
                child: ExpansionTile(
                  title: Text(
                    "How to leave a review for a driver",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16.8,
                        fontFamily: "Cambay",
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28,
                    color: Color(0xFFFFFFFF),
                  ),
                  children: [
                    Container(
                      color: Color(0xFFFFFFFF),
                      height: 168,
                      width: 400,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Once the app immediately after the ride is completed. \nYou will see a window where you can evaluate \nthe driver and write a review. If you did not enjoy \nyour ride and you decide to write a negative \nreview, don’t worry - the driver will not see that \nit was you.",
                          style: TextStyle(
                            color: Color(0xFF2222222),
                            fontSize: 15,
                            fontFamily: "Athiti",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Card(
                margin: EdgeInsets.only(top: 12, left: 12, right: 12),
                color: Color(0xFF2222222),
                child: ExpansionTile(
                  title: Text(
                    "How to find belongings I left behind",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16.8,
                        fontFamily: "Cambay",
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28,
                    color: Color(0xFFFFFFFF),
                  ),
                  children: [
                    Container(
                      color: Color(0xFFFFFFFF),
                      height: 146,
                      width: 400,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "If you have left your belongings in the vehicle, write \nto us at dipeshgurung797@gmail.com. Include the \ntime and route of your ride, and if possible tell \nus the car’s make, color, and registration number. \nWe’ll help find your belongings.",
                          style: TextStyle(
                            color: Color(0xFF2222222),
                            fontSize: 15,
                            fontFamily: "Athiti",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Card(
                margin: EdgeInsets.only(top: 12, left: 12, right: 12),
                color: Color(0xFF2222222),
                child: ExpansionTile(
                  title: Text(
                    "Are there smoking breaks or stop-offs?",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16.8,
                        fontFamily: "Cambay",
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28,
                    color: Color(0xFFFFFFFF),
                  ),
                  children: [
                    Container(
                      color: Color(0xFFFFFFFF),
                      height: 168,
                      width: 400,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Some of our trips have breaks planned into the \nschedule for the purposes of providing driving breaks \nand rest periods for the drivers. However, our aim is \nto get you to your destination as quickly as possible, \nwhich is why we don't schedule any other type of \nbreak.",
                          style: TextStyle(
                            color: Color(0xFF2222222),
                            fontSize: 15,
                            fontFamily: "Athiti",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Card(
                margin: EdgeInsets.only(top: 12, left: 12, right: 12),
                color: Color(0xFF2222222),
                child: ExpansionTile(
                  title: Text(
                    "I’m running a little late. Will the vehicle wait for me?",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16.8,
                        fontFamily: "Cambay",
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28,
                    color: Color(0xFFFFFFFF),
                  ),
                  children: [
                    Container(
                      color: Color(0xFFFFFFFF),
                      height: 217,
                      width: 400,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Unfortunately, the vehicle cannot wait for delayed \npassengers. Our vehicles travel within a network and \nare bound to a timetable. Please ensure that you are \nat the stop at least 15 minutes before departure.\n\nIf you realize that you’re not going to make it, you can \ncancel your ride up to 15 minutes before departure via \nBooking screen.",
                          style: TextStyle(
                            color: Color(0xFF2222222),
                            fontSize: 15,
                            fontFamily: "Athiti",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ])))),
          Container(
            width: size.width,
            height: 58,
            margin: const EdgeInsets.only(bottom: 0.7),
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
