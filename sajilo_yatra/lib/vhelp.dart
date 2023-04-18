// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sajilo_yatra/ui_helper.dart';

class VHelp extends StatefulWidget {
  const VHelp({Key? key}) : super(key: key);

  @override
  State<VHelp> createState() => _VHelpState();
}

class _VHelpState extends State<VHelp> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0062DE),
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
                  color: Color(0xFF0062DE),
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
                  color: Color(0xFF0062DE),
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
                  color: Color(0xFF0062DE),
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
              color:
                  Color(0xFF0062DE), // The color to use when painting the line.
              height: 40, // The divider's height extent.
            ),
            Card(
                margin: EdgeInsets.only(top: 0, left: 12, right: 12),
                color: Color.fromARGB(255, 242, 243, 245),
                child: ExpansionTile(
                  title: Text(
                    "Is your payment platform secure?",
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 16.8,
                        fontFamily: "Cambay",
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28,
                    color: Color(0xFF222222),
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
                            color: Colors.grey,
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
                margin: EdgeInsets.only(top: 15, left: 12, right: 12),
                color: Color.fromARGB(255, 242, 243, 245),
                child: ExpansionTile(
                  title: Text(
                    "How do I change my account email and password?",
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 16.8,
                        fontFamily: "Cambay",
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28,
                    color: Color(0xFF222222),
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
                            color: Colors.grey,
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
                margin: EdgeInsets.only(top: 15, left: 12, right: 12),
                color: Color.fromARGB(255, 242, 243, 245),
                child: ExpansionTile(
                  title: Text(
                    "Drivers do not respond",
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 16.8,
                        fontFamily: "Cambay",
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28,
                    color: Color(0xFF222222),
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
                            color: Colors.grey,
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
                margin: EdgeInsets.only(top: 15, left: 12, right: 12),
                color: Color.fromARGB(255, 242, 243, 245),
                child: ExpansionTile(
                  title: Text(
                    "How to leave a review for a driver",
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 16.8,
                        fontFamily: "Cambay",
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28,
                    color: Color(0xFF222222),
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
                            color: Colors.grey,
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
                margin: EdgeInsets.only(top: 15, left: 12, right: 12),
                color: Color.fromARGB(255, 242, 243, 245),
                child: ExpansionTile(
                  title: Text(
                    "How to find belongings I left behind",
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 16.8,
                        fontFamily: "Cambay",
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28,
                    color: Color(0xFF222222),
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
                            color: Colors.grey,
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
                margin: EdgeInsets.only(top: 15, left: 12, right: 12),
                color: Color.fromARGB(255, 242, 243, 245),
                child: ExpansionTile(
                  title: Text(
                    "Are there smoking breaks or stop-offs?",
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 16.8,
                        fontFamily: "Cambay",
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28,
                    color: Color(0xFF222222),
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
                            color: Colors.grey,
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
                margin:
                    EdgeInsets.only(top: 15, left: 12, right: 12, bottom: 15),
                color: Color.fromARGB(255, 242, 243, 245),
                child: ExpansionTile(
                  title: Text(
                    "I’m running a little late. Will the vehicle wait for me?",
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 16.8,
                        fontFamily: "Cambay",
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28,
                    color: Color(0xFF222222),
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
                            color: Colors.grey,
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
