import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sajilo_yatra/ui_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThirdRoute extends StatefulWidget {
  final String userId;

  const ThirdRoute({Key? key, required this.userId}) : super(key: key);

  @override
  State<ThirdRoute> createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  int currentIndex = 0;
  final _storage = FlutterSecureStorage();

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
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
                color: const Color(0xFF2222222),
                fontFamily: "ZenKakuGothicAntique",
                fontSize: UiHelper.displayWidth(context) * 0.067,
                fontWeight: FontWeight.w700,
              )),
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 7, bottom: 0, top: 2),
              child: Icon(
                Icons.account_circle_outlined,
                size: UiHelper.displayWidth(context) * 0.12,
                color: const Color(0xFF2222222),
              ),
            ),
          ]),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: UiHelper.displayWidth(context) * 0.46,
                      height: UiHelper.displayHeight(context) * 0.127,
                      margin:
                          const EdgeInsets.only(left: 15, bottom: 6.8, top: 22),
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
                              Image.asset(
                                "images/ticket.png",
                                width: 45,
                                height: 40,
                                fit: BoxFit.fill,
                              ),
                              const Text(
                                "Tickets",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.95,
                                    fontFamily: "FiraSans",
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF222222),
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/tenth');
                          }),
                    ),
                    Container(
                      height: 100.4,
                      width: 172,
                      margin: const EdgeInsets.only(bottom: 6.8),
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
                              Image.asset(
                                "images/ride.png",
                                width: 65,
                                height: 70,
                                fit: BoxFit.fill,
                              ),
                              const Text(
                                "Ride",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "FiraSans",
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF2222222),
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/thirteenth');
                          }),
                    ),
                  ],
                ),
                UiHelper.verticalSpace(vspace: Spacing.medium),
                Row(
                  children: [
                    UiHelper.horizontaSpace(hspace: Spacing.xlarge),
                    const Text(
                      "Take a ride to",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          height: 2,
                          fontFamily: "ZenKakuGothicAntique",
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2222222),
                          fontSize: 24),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      heightFactor: 1.25,
                      widthFactor: 1.05,
                      child: Container(
                        height: 70.4,
                        width: 172,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: Offset(0, 0),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                            ), //BoxShadow
                            //BoxShadow
                          ],
                        ),
                        margin: const EdgeInsets.only(bottom: 6.8, left: 9.2),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              //background color of button
                              //border width and color
                              backgroundColor: Color(0xFFFFFFFF),
                              shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                            child: Column(
                              children: [
                                Align(
                                  widthFactor: 1.19,
                                  alignment: Alignment.bottomLeft,
                                  child: const Text(
                                    "Home",
                                    style: TextStyle(
                                        height: 2,
                                        letterSpacing: 0.8,
                                        fontFamily: "Podkova",
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xFF222222),
                                        fontSize: 18),
                                  ),
                                ),
                                Align(
                                  widthFactor: 0.57,
                                  alignment: Alignment.bottomLeft,
                                  child: const Text(
                                    "Set home address",
                                    style: TextStyle(
                                        height: 1.68,
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF222222),
                                        fontSize: 12.4),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  heightFactor: 0.02,
                                  widthFactor: 6,
                                  child: Icon(Icons.home_filled,
                                      size: 35, color: Color(0xFF222222)),
                                ),
                              ],
                            ),
                            onPressed: () {}),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      heightFactor: 1.25,
                      widthFactor: 1,
                      child: Container(
                        height: 70.4,
                        width: 172,
                        margin: const EdgeInsets.only(bottom: 6.8, left: 14.05),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: Offset(0, 0),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
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
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                            child: Column(
                              children: [
                                Align(
                                  widthFactor: 1.19,
                                  alignment: Alignment.bottomLeft,
                                  child: const Text(
                                    "Work",
                                    style: TextStyle(
                                        height: 2,
                                        letterSpacing: 0.8,
                                        fontFamily: "Podkova",
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xFF222222),
                                        fontSize: 18),
                                  ),
                                ),
                                Align(
                                  widthFactor: 0.54,
                                  alignment: Alignment.bottomLeft,
                                  child: const Text(
                                    "Set work address",
                                    style: TextStyle(
                                        height: 1.68,
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF222222),
                                        fontSize: 12.2),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  heightFactor: 0.02,
                                  widthFactor: 6,
                                  child: Icon(
                                    Icons.work_rounded,
                                    size: 35,
                                    color: Color(0xFF222222),
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {}),
                      ),
                    ),
                  ],
                ),
                UiHelper.verticalSpace(vspace: Spacing.xlarge),
                Row(
                  children: [
                    UiHelper.horizontaSpace(hspace: Spacing.xlarge),
                    const Text(
                      "Check out some offers?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 0.95,
                          fontFamily: "ZenKakuGothicAntique",
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2222222),
                          fontSize: 24),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 23),
            height: 217.22,
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
                                border: Border.all(
                                    color: const Color(0xFF2222222),
                                    width: 3,
                                    style: BorderStyle.solid),
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(11.8)),
                              ),
                              margin: const EdgeInsets.only(right: 0.2),
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
                                            color: Color(0xFF222222),
                                            fontSize: 15),
                                      ),
                                      Container(
                                        height: 27.4,
                                        width: 132,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF9BC2F2),
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
                                                    color: Color(0xFF222222),
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {}),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            widthFactor: 1.1,
                            child: Container(
                              height: 188.4,
                              width: 170,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xFFFFFFFF),
                                    width: 4,
                                    style: BorderStyle.solid),
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(11.8)),
                              ),
                              margin: const EdgeInsets.only(right: 0.2),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(
                                        0xFF4E93E8), //background color of button
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
                                            color: Color(0xFF9BC2F2),
                                            fontSize: 18),
                                      ),
                                      const Text(
                                        "on KTM Tickets",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            height: 1.3,
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF222222),
                                            fontSize: 15),
                                      ),
                                      Container(
                                        height: 27.4,
                                        width: 132,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF0062DE),
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
                                                    color: Color(0xFF222222),
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {}),
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
                                  border: Border.all(
                                      color: const Color(0xFFFFFFFF),
                                      width: 4,
                                      style: BorderStyle.solid),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(11.8)),
                                ),
                                margin:
                                    const EdgeInsets.only(right: 0.2, top: 10),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(
                                          0xFF4E93E8), //background color of button
                                      //border width and color

                                      shape: RoundedRectangleBorder(
                                          //to set border radius to button
                                          borderRadius:
                                              BorderRadius.circular(8)),
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
                                              color: Color(0xFF9BC2F2),
                                              fontSize: 18),
                                        ),
                                        const Text(
                                          "on Referral",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              height: 1.3,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF222222),
                                              fontSize: 15),
                                        ),
                                        Container(
                                          height: 27.4,
                                          width: 132,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF0062DE),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    const Radius.circular(7)),
                                          ),
                                          margin:
                                              const EdgeInsets.only(top: 7.5),
                                          child: Row(
                                            children: [
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                widthFactor: 1.17,
                                                child: const Text(
                                                  "CODE:",
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color(0xFFFFFFFF),
                                                      fontSize: 15),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                widthFactor: 1.07,
                                                child: const Text(
                                                  "HRDTY56",
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color(0xFF222222),
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {}),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              widthFactor: 1.1,
                              child: Container(
                                height: 188.4,
                                width: 170,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFFFFFFF),
                                      width: 4,
                                      style: BorderStyle.solid),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(11.8)),
                                ),
                                margin:
                                    const EdgeInsets.only(right: 0.2, top: 9.6),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(
                                          0xFF4E93E8), //background color of button
                                      //border width and color

                                      shape: RoundedRectangleBorder(
                                          //to set border radius to button
                                          borderRadius:
                                              BorderRadius.circular(8)),
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
                                              color: Color(0xFF9BC2F2),
                                              fontSize: 18),
                                        ),
                                        const Text(
                                          "on 45 Min Ride",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              height: 1.3,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF222222),
                                              fontSize: 15),
                                        ),
                                        Container(
                                          height: 27.4,
                                          width: 132,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF0062DE),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    const Radius.circular(7)),
                                          ),
                                          margin:
                                              const EdgeInsets.only(top: 7.5),
                                          child: Row(
                                            children: [
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                widthFactor: 1.36,
                                                child: const Text(
                                                  "CODE:",
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color(0xFFFFFFFF),
                                                      fontSize: 15),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                widthFactor: 1.07,
                                                child: const Text(
                                                  "AKI745",
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color(0xFF222222),
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {}),
                              ),
                            ),
                          ],
                        ),
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
                                  border: Border.all(
                                      color: const Color(0xFFFFFFFF),
                                      width: 4,
                                      style: BorderStyle.solid),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(11.8)),
                                ),
                                margin:
                                    const EdgeInsets.only(right: 0.2, top: 10),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(
                                          0xFF4E93E8), //background color of button
                                      //border width and color

                                      shape: RoundedRectangleBorder(
                                          //to set border radius to button
                                          borderRadius:
                                              BorderRadius.circular(8)),
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
                                              color: Color(0xFF9BC2F2),
                                              fontSize: 18),
                                        ),
                                        const Text(
                                          "on 1 hour 30 Min Ride",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              height: 1.4,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF222222),
                                              fontSize: 13),
                                        ),
                                        Container(
                                          height: 27.4,
                                          width: 132,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF0062DE),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    const Radius.circular(7)),
                                          ),
                                          margin:
                                              const EdgeInsets.only(top: 7.5),
                                          child: Row(
                                            children: [
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                widthFactor: 1.31,
                                                child: const Text(
                                                  "CODE:",
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color(0xFFFFFFFF),
                                                      fontSize: 15),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                widthFactor: 1.07,
                                                child: const Text(
                                                  "HGHG7",
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color(0xFF222222),
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {}),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              widthFactor: 1.1,
                              child: Container(
                                height: 188.4,
                                width: 170,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFFFFFFF),
                                      width: 4,
                                      style: BorderStyle.solid),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(11.8)),
                                ),
                                margin:
                                    const EdgeInsets.only(right: 0.2, top: 9.6),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(
                                          0xFF4E93E8), //background color of button
                                      //border width and color

                                      shape: RoundedRectangleBorder(
                                          //to set border radius to button
                                          borderRadius:
                                              BorderRadius.circular(8)),
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
                                              color: Color(0xFF9BC2F2),
                                              fontSize: 18),
                                        ),
                                        const Text(
                                          "on Every Ticket/Ride",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              height: 1.31,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF222222),
                                              fontSize: 14),
                                        ),
                                        Container(
                                          height: 27.4,
                                          width: 132,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF0062DE),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    const Radius.circular(7)),
                                          ),
                                          margin:
                                              const EdgeInsets.only(top: 7.5),
                                          child: Row(
                                            children: [
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                widthFactor: 1.36,
                                                child: const Text(
                                                  "CODE:",
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color(0xFFFFFFFF),
                                                      fontSize: 15),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                widthFactor: 1.07,
                                                child: const Text(
                                                  "JHVJ34",
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color(0xFF222222),
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {}),
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
          Container(
            width: size.width,
            height: 60,
            margin: const EdgeInsets.only(top: 11.4),
            color: Color(0xFF4E93E8),
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(size.width, 20),
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.6,
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
                              ? Color(0xFF222222)
                              : Color(0xFFFFFFFF),
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
                                      ? Color(0xFF222222)
                                      : Color(0xFFFFFFFF),
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
                                    ? Color(0xFF222222)
                                    : Color(0xFFFFFFFF),
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
                                      ? Color(0xFF222222)
                                      : Color(0xFFFFFFFF),
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
                                    ? Color(0xFF222222)
                                    : Color(0xFFFFFFFF),
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
                                      ? Color(0xFF222222)
                                      : Color(0xFFFFFFFF),
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
                                    ? Color(0xFF222222)
                                    : Color(0xFFFFFFFF),
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
                                      ? Color(0xFF222222)
                                      : Color(0xFFFFFFFF),
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
                                    ? Color(0xFF222222)
                                    : Color(0xFFFFFFFF),
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
