import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sajilo_yatra/ride.dart';
import 'package:sajilo_yatra/screens/home.dart';
import 'package:sajilo_yatra/screens/prepare_ride.dart';
import 'package:sajilo_yatra/tickets.dart';
import 'package:sajilo_yatra/ui_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThirdRoute extends StatefulWidget {
  final String userId;

  const ThirdRoute({Key? key, required this.userId}) : super(key: key);

  @override
  State<ThirdRoute> createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  final _storage = FlutterSecureStorage();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late String? username;

  @override
  void initState() {
    super.initState();

    _getSavedData();
  }

  void _getSavedData() async {
    final fullName = await _storage.read(key: 'full_name');
    setState(() {
      username = fullName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text('Welcome ${username?.split(' ')[0]}',
            style: TextStyle(
              color: Color(0xFF0062DE),
              fontFamily: "ZenKakuGothicAntique",
              fontSize: UiHelper.displayWidth(context) * 0.067,
              fontWeight: FontWeight.w700,
            )),
        elevation: 0,
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10, bottom: 0, top: 2),
            child: IconButton(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Color(0xFF0062DE),
                size: UiHelper.displayWidth(context) * 0.11,
              ),
              tooltip: 'Open shopping cart',
              onPressed: () {
                Navigator.pushNamed(context, '/fourteenth');
              },
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(children: [
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: UiHelper.displayWidth(context) * 0.42,
                    height: UiHelper.displayHeight(context) * 0.127,
                    margin:
                        const EdgeInsets.only(left: 25, bottom: 6.8, top: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: Offset(0, 0),
                          blurRadius: 10.0,
                          spreadRadius: 0.1,
                        ), //BoxShadow
                        //BoxShadow
                      ],
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //background color of button
                          //border width and color
                          backgroundColor: Color(0xFFFFFFFF),
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(11)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              child: Image.asset(
                                "images/ticket.png",
                                width: UiHelper.displayWidth(context) * 0.167,
                                height: UiHelper.displayHeight(context) * 0.058,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Tickets",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "FiraSans",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF222222),
                                  fontSize:
                                      UiHelper.displayWidth(context) * 0.041,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EighthScreen()),
                            (Route<dynamic> route) => false,
                          );
                        }),
                  ),
                  Container(
                    width: UiHelper.displayWidth(context) * 0.42,
                    height: UiHelper.displayHeight(context) * 0.127,
                    margin:
                        const EdgeInsets.only(left: 15, bottom: 6.8, top: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: Offset(0, 0),
                          blurRadius: 10.0,
                          spreadRadius: 0.1,
                        ), //BoxShadow
                        //BoxShadow
                      ],
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //background color of button
                          //border width and color
                          backgroundColor: Color(0xFFFFFFFF),
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(11)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 32),
                              child: Image.asset(
                                "images/ride.png",
                                width: UiHelper.displayWidth(context) * 0.170,
                                height: UiHelper.displayHeight(context) * 0.037,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 8.3),
                              child: Text(
                                "Ride",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "FiraSans",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF222222),
                                  fontSize:
                                      UiHelper.displayWidth(context) * 0.041,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Ride()),
                            (Route<dynamic> route) => false,
                          );
                        }),
                  ),
                ],
              ),
              UiHelper.verticalSpace(vspace: Spacing.medium),
              Container(
                width: UiHelper.displayWidth(context) * 1,
                height: UiHelper.displayHeight(context) * 0.012,
                color: Color(0xFFF3F3F3),
              ),
              UiHelper.verticalSpace(vspace: Spacing.small),
              Row(
                children: [
                  UiHelper.horizontaSpace(hspace: Spacing.xlarge),
                  const Text(
                    "Check out some offers?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 2,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF0062DE),
                        fontSize: 19.5),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          height: UiHelper.displayHeight(context) * 0.47,
          child: Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: 400,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          widthFactor: 1.1,
                          child: Container(
                            height: 188.4,
                            width: 170,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  offset: Offset(0, 0),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.1,
                                ), //BoxShadow
                                //BoxShadow
                              ],
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(11.8)),
                            ),
                            margin: const EdgeInsets.only(right: 0.2, top: 10),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(
                                      0xFFFFFFFF), //background color of button
                                  //border width and color

                                  shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      heightFactor: 1.1,
                                      child: Image.asset(
                                        "images/one.png",
                                        width: 95,
                                        height: 77,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const Text(
                                      "SAVE Rs: 100",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          height: 1.94,
                                          fontFamily: "Sen",
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xFF222222),
                                          fontSize: 18),
                                    ),
                                    const Text(
                                      "on First Ticket/Ride",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          height: 1.3,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                          fontSize: 15),
                                    ),
                                    Container(
                                      height: 27.4,
                                      width: 132,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF4E93E8),
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(7)),
                                      ),
                                      margin: const EdgeInsets.only(top: 7.5),
                                      child: Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerRight,
                                            widthFactor: 1.17,
                                            child: const Text(
                                              "CODE:",
                                              style: TextStyle(
                                                  fontFamily: "OpenSans",
                                                  fontWeight: FontWeight.w900,
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            widthFactor: 1.07,
                                            child: const Text(
                                              "YGFJY899",
                                              style: TextStyle(
                                                  fontFamily: "OpenSans",
                                                  fontWeight: FontWeight.w900,
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/sixteenth');
                                }),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          widthFactor: 1.1,
                          child: Container(
                            height: 188.4,
                            width: 170,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  offset: Offset(0, 0),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.1,
                                ), //BoxShadow
                                //BoxShadow
                              ],
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(11.8)),
                            ),
                            margin: const EdgeInsets.only(right: 0.2, top: 10),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(
                                      0xFFFFFFFF), //background color of button
                                  //border width and color

                                  shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      heightFactor: 1.1,
                                      child: Image.asset(
                                        "images/two.png",
                                        width: 95,
                                        height: 77,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const Text(
                                      "SAVE Rs: 200",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          height: 1.94,
                                          fontFamily: "Sen",
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xFF222222),
                                          fontSize: 18),
                                    ),
                                    const Text(
                                      "on KTM Tickets",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          height: 1.3,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                          fontSize: 15),
                                    ),
                                    Container(
                                      height: 27.4,
                                      width: 132,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF4E93E8),
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(7)),
                                      ),
                                      margin: const EdgeInsets.only(top: 7.5),
                                      child: Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerRight,
                                            widthFactor: 1.33,
                                            child: const Text(
                                              "CODE:",
                                              style: TextStyle(
                                                  fontFamily: "OpenSans",
                                                  fontWeight: FontWeight.w900,
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            widthFactor: 1.07,
                                            child: const Text(
                                              "UIGF78",
                                              style: TextStyle(
                                                  fontFamily: "OpenSans",
                                                  fontWeight: FontWeight.w900,
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/sixteenth');
                                }),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            widthFactor: 1.1,
                            child: Container(
                              height: 188.4,
                              width: 170,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    offset: Offset(0, 0),
                                    blurRadius: 10.0,
                                    spreadRadius: 0.1,
                                  ), //BoxShadow
                                  //BoxShadow
                                ],
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(11.8)),
                              ),
                              margin:
                                  const EdgeInsets.only(right: 0.2, top: 10),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(
                                        0xFFFFFFFF), //background color of button
                                    //border width and color

                                    shape: RoundedRectangleBorder(
                                        //to set border radius to button
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        heightFactor: 1.1,
                                        child: Image.asset(
                                          "images/three.png",
                                          width: 95,
                                          height: 77,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Text(
                                        "SAVE Rs: 900",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            height: 1.94,
                                            fontFamily: "Sen",
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xFF222222),
                                            fontSize: 18),
                                      ),
                                      const Text(
                                        "on Referral",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            height: 1.3,
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                            fontSize: 15),
                                      ),
                                      Container(
                                        height: 27.4,
                                        width: 132,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF4E93E8),
                                          borderRadius: const BorderRadius.all(
                                              const Radius.circular(7)),
                                        ),
                                        margin: const EdgeInsets.only(top: 7.5),
                                        child: Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              widthFactor: 1.17,
                                              child: const Text(
                                                "CODE:",
                                                style: TextStyle(
                                                    fontFamily: "OpenSans",
                                                    fontWeight: FontWeight.w900,
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 15),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              widthFactor: 1.07,
                                              child: const Text(
                                                "HRDTY56",
                                                style: TextStyle(
                                                    fontFamily: "OpenSans",
                                                    fontWeight: FontWeight.w900,
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/sixteenth');
                                  }),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            widthFactor: 1.1,
                            child: Container(
                              height: 188.4,
                              width: 170,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    offset: Offset(0, 0),
                                    blurRadius: 10.0,
                                    spreadRadius: 0.1,
                                  ), //BoxShadow
                                  //BoxShadow
                                ],
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(11.8)),
                              ),
                              margin:
                                  const EdgeInsets.only(right: 0.2, top: 9.6),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(
                                        0xFFFFFFFF), //background color of button
                                    //border width and color

                                    shape: RoundedRectangleBorder(
                                        //to set border radius to button
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        heightFactor: 1.1,
                                        child: Image.asset(
                                          "images/four.png",
                                          width: 95,
                                          height: 77,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Text(
                                        "SAVE Rs: 2000",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            height: 1.94,
                                            fontFamily: "Sen",
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xFF222222),
                                            fontSize: 18),
                                      ),
                                      const Text(
                                        "on 45 Min Ride",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            height: 1.3,
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                            fontSize: 15),
                                      ),
                                      Container(
                                        height: 27.4,
                                        width: 132,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF4E93E8),
                                          borderRadius: const BorderRadius.all(
                                              const Radius.circular(7)),
                                        ),
                                        margin: const EdgeInsets.only(top: 7.5),
                                        child: Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              widthFactor: 1.36,
                                              child: const Text(
                                                "CODE:",
                                                style: TextStyle(
                                                    fontFamily: "OpenSans",
                                                    fontWeight: FontWeight.w900,
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 15),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              widthFactor: 1.07,
                                              child: const Text(
                                                "AKI745",
                                                style: TextStyle(
                                                    fontFamily: "OpenSans",
                                                    fontWeight: FontWeight.w900,
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/sixteenth');
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 12),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            widthFactor: 1.1,
                            child: Container(
                              height: 188.4,
                              width: 170,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    offset: Offset(0, 0),
                                    blurRadius: 10.0,
                                    spreadRadius: 0.1,
                                  ), //BoxShadow
                                  //BoxShadow
                                ],
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(11.8)),
                              ),
                              margin:
                                  const EdgeInsets.only(right: 0.2, top: 10),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(
                                        0xFFFFFFFF), //background color of button
                                    //border width and color

                                    shape: RoundedRectangleBorder(
                                        //to set border radius to button
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        heightFactor: 1.1,
                                        child: Image.asset(
                                          "images/five.png",
                                          width: 95,
                                          height: 77,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Text(
                                        "SAVE Rs: 1000",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            height: 1.94,
                                            fontFamily: "Sen",
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xFF222222),
                                            fontSize: 18),
                                      ),
                                      const Text(
                                        "on 1 hour 30 Min Ride",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            height: 1.4,
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                            fontSize: 13),
                                      ),
                                      Container(
                                        height: 27.4,
                                        width: 132,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF4E93E8),
                                          borderRadius: const BorderRadius.all(
                                              const Radius.circular(7)),
                                        ),
                                        margin: const EdgeInsets.only(top: 7.5),
                                        child: Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              widthFactor: 1.31,
                                              child: const Text(
                                                "CODE:",
                                                style: TextStyle(
                                                    fontFamily: "OpenSans",
                                                    fontWeight: FontWeight.w900,
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 15),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              widthFactor: 1.07,
                                              child: const Text(
                                                "HGHG7",
                                                style: TextStyle(
                                                    fontFamily: "OpenSans",
                                                    fontWeight: FontWeight.w900,
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/sixteenth');
                                  }),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            widthFactor: 1.1,
                            child: Container(
                              height: 188.4,
                              width: 170,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    offset: Offset(0, 0),
                                    blurRadius: 10.0,
                                    spreadRadius: 0.1,
                                  ), //BoxShadow
                                  //BoxShadow
                                ],
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(11.8)),
                              ),
                              margin:
                                  const EdgeInsets.only(right: 0.2, top: 9.6),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(
                                        0xFFFFFFFF), //background color of button
                                    //border width and color

                                    shape: RoundedRectangleBorder(
                                        //to set border radius to button
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        heightFactor: 1.1,
                                        child: Image.asset(
                                          "images/six.png",
                                          width: 95,
                                          height: 77,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Text(
                                        "SAVE Rs: 70",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            height: 1.94,
                                            fontFamily: "Sen",
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xFF222222),
                                            fontSize: 18),
                                      ),
                                      const Text(
                                        "on Every Ticket/Ride",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            height: 1.31,
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                            fontSize: 14),
                                      ),
                                      Container(
                                        height: 27.4,
                                        width: 132,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF4E93E8),
                                          borderRadius: const BorderRadius.all(
                                              const Radius.circular(7)),
                                        ),
                                        margin: const EdgeInsets.only(top: 7.5),
                                        child: Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              widthFactor: 1.36,
                                              child: const Text(
                                                "CODE:",
                                                style: TextStyle(
                                                    fontFamily: "OpenSans",
                                                    fontWeight: FontWeight.w900,
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 15),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              widthFactor: 1.07,
                                              child: const Text(
                                                "JHVJ34",
                                                style: TextStyle(
                                                    fontFamily: "OpenSans",
                                                    fontWeight: FontWeight.w900,
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/sixteenth');
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
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
          if (value == 2) Navigator.pushNamed(context, '/seventeenth');
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
                Navigator.pushNamed(context, '/seventeenth');
              });
            }),
      ),
      // position the cart button in the center of the bottom navigation bar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
