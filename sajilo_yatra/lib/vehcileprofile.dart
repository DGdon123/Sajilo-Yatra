// ignore_for_file: unnecessary_new

import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sajilo_yatra/ui_helper.dart';

class Profile extends StatefulWidget {
  final String userId;
  const Profile({Key? key, required this.userId}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _storage = const FlutterSecureStorage();
  var isLoading = true;
  String username = "";
  final FirebaseFirestore db = FirebaseFirestore.instance;
  String locat = "";
  String emailing = "";
  String phonenumber = "";
  String gen = "";
  String aging = "";
  String dobing = "";

  @override
  void initState() {
    super.initState();
    _getSavedData();
    login();
  }

  Future<void> login() async {
    final snapshot = await db.collection("vehicle_owners").get();
    final users = snapshot.docs
        .map((doc) => doc.data())
        .where((owner) => owner["email"] == emailing)
        .toList();

    if (users.length == 1) {
      final user = users.first;
      final fullName = user["full_name"];
      final location = user["location"];
      final email = user["email"];

      final phoneNumber = user["phone"].toString();
      final gender = user["gender"];
      final age = user["age"].toString();
      final dob = user["dob"].toString();

      await _storage.write(key: 'full_name', value: fullName);
      await _storage.write(key: 'location', value: location);
      await _storage.write(key: 'email', value: email);
      await _storage.write(key: 'phone', value: phoneNumber);
      await _storage.write(key: 'gender', value: gender);
      await _storage.write(key: 'age', value: age);
      await _storage.write(key: 'dob', value: dob);

      setState(() {
        username = fullName;
        locat = location;
        emailing = email;
        phonenumber = phoneNumber;
        gen = gender;
        aging = age;
        dobing = dob;

        isLoading = false;
      });
    } else {
      final invalidCredentialsErrorBar = SnackBar(
        content: Text(
          "Invalid email or password!",
          style: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 17,
            fontFamily: 'OpenSans',
          ),
          textAlign: TextAlign.center,
        ),
        duration: const Duration(milliseconds: 3000),
        backgroundColor: Colors.red.shade400,
      );
      ScaffoldMessenger.of(context).showSnackBar(invalidCredentialsErrorBar);
    }
  }

  void _getSavedData() async {
    final email = await _storage.read(key: 'email');

    setState(() {
      emailing = email!;

      isLoading = false;
    });
  }

  var size, height, width;
  var circular = true;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  String creditBalance = "0.00";

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0062DE),
          centerTitle: true,
          title: const Text('Profile',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: 'Roboto Bold',
                fontSize: 22,
                height: 1.19,
                fontWeight: FontWeight.w500,
              )),
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFFFFFFFF),
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Color(0xFF0062DE),
                  )
                : Column(children: [
                    Expanded(
                      child: SingleChildScrollView(
                          child: SizedBox(
                              width: UiHelper.displayWidth(context) * 1,
                              height: UiHelper.displayHeight(context) * 1,
                              child: CustomPaint(
                                painter: CurvePainter(),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      width:
                                          UiHelper.displayWidth(context) * 0.3,
                                      height: UiHelper.displayHeight(context) *
                                          0.15,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              "images/hello.jpg",
                                            ),
                                            fit: BoxFit.fill),
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(80)),
                                      ),
                                    ),
                                    Text(
                                      username,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          height: height / 305,
                                          fontFamily: "Mulish",
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFFFFFFFF),
                                          fontSize: width * 0.077),
                                    ),
                                    UiHelper.verticalSpace(
                                        vspace: Spacing.small),
                                    SizedBox(
                                      width:
                                          UiHelper.displayWidth(context) * 0.52,
                                      height: UiHelper.displayHeight(context) *
                                          0.074,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(
                                              0xfffffffff), //background color of button
                                          //border width and color

                                          shape: RoundedRectangleBorder(
                                              //to set border radius to button
                                              borderRadius:
                                                  BorderRadius.circular(55)),
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/line11');
                                        },
                                        child: Text(
                                          "Edit My Profile",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            height: UiHelper.displayHeight(
                                                    context) *
                                                0.0015,
                                            fontFamily: "ZenKakuGothicAntique",
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFF0062DE),
                                            fontSize:
                                                UiHelper.displayWidth(context) *
                                                    0.047,
                                          ),
                                        ),
                                      ),
                                    ),
                                    UiHelper.verticalSpace(
                                        vspace: Spacing.medium),
                                    Container(
                                      height: 400,
                                      width:
                                          UiHelper.displayWidth(context) * 0.83,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFFFFF),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            offset: const Offset(0, 8),
                                            blurRadius: 10.0,
                                            spreadRadius: 0.0,
                                          ), //BoxShadow
                                          //BoxShadow
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          UiHelper.verticalSpace(
                                              vspace: Spacing.medium),
                                          Row(
                                            children: [
                                              UiHelper.horizontaSpace(
                                                  hspace: Spacing.large),
                                              Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Icon(
                                                    Icons.location_on_rounded,
                                                    size: UiHelper.displayWidth(
                                                            context) *
                                                        0.065,
                                                    color:
                                                        const Color(0xFF0062DE),
                                                  )),
                                              UiHelper.horizontaSpace(
                                                  hspace: Spacing.medium),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Address',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      letterSpacing: 0.3,
                                                      fontFamily: "KumbhSans",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xFF222222),
                                                      fontSize:
                                                          UiHelper.displayWidth(
                                                                  context) *
                                                              0.043),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xxlarge),
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xlarge),
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xsmall),
                                                  Align(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      width: width * 0.65,
                                                      height: height * 0.03,
                                                      child: Text(
                                                        locat,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            letterSpacing: 0.1,
                                                            fontFamily:
                                                                "SignikaNegative-Bold",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xFFA6AEB0),
                                                            fontSize: UiHelper
                                                                    .displayWidth(
                                                                        context) *
                                                                0.04),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: UiHelper.displayHeight(
                                                    context) *
                                                0.000090,
                                          ),
                                          UiHelper.verticalSpace(
                                              vspace: Spacing.medium),
                                          Row(
                                            children: [
                                              UiHelper.horizontaSpace(
                                                  hspace: Spacing.large),
                                              Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Icon(
                                                    Icons.mail_rounded,
                                                    size: UiHelper.displayWidth(
                                                            context) *
                                                        0.065,
                                                    color:
                                                        const Color(0xFF0062DE),
                                                  )),
                                              UiHelper.horizontaSpace(
                                                  hspace: Spacing.medium),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Email Address',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      letterSpacing: 0.3,
                                                      fontFamily: "KumbhSans",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xFF222222),
                                                      fontSize:
                                                          UiHelper.displayWidth(
                                                                  context) *
                                                              0.043),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xxlarge),
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xlarge),
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xsmall),
                                                  Align(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      width: width * 0.65,
                                                      height: height * 0.03,
                                                      child: Text(
                                                        emailing,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            letterSpacing: 0.1,
                                                            fontFamily:
                                                                "SignikaNegative-Bold",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xFFA6AEB0),
                                                            fontSize: UiHelper
                                                                    .displayWidth(
                                                                        context) *
                                                                0.04),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: UiHelper.displayHeight(
                                                    context) *
                                                0.000090,
                                          ),
                                          UiHelper.verticalSpace(
                                              vspace: Spacing.medium),
                                          Row(
                                            children: [
                                              UiHelper.horizontaSpace(
                                                  hspace: Spacing.large),
                                              Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Icon(
                                                    Icons.phone_rounded,
                                                    size: UiHelper.displayWidth(
                                                            context) *
                                                        0.065,
                                                    color:
                                                        const Color(0xFF0062DE),
                                                  )),
                                              UiHelper.horizontaSpace(
                                                  hspace: Spacing.medium),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Mobile Number',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      letterSpacing: 0.3,
                                                      fontFamily: "KumbhSans",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xFF222222),
                                                      fontSize:
                                                          UiHelper.displayWidth(
                                                                  context) *
                                                              0.043),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xxlarge),
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xlarge),
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xsmall),
                                                  Align(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      width: width * 0.65,
                                                      height: height * 0.03,
                                                      child: Text(
                                                        phonenumber,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            letterSpacing: 0.1,
                                                            fontFamily:
                                                                "SignikaNegative-Bold",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xFFA6AEB0),
                                                            fontSize: UiHelper
                                                                    .displayWidth(
                                                                        context) *
                                                                0.04),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: UiHelper.displayHeight(
                                                    context) *
                                                0.000090,
                                          ),
                                          UiHelper.verticalSpace(
                                              vspace: Spacing.medium),
                                          Row(
                                            children: [
                                              UiHelper.horizontaSpace(
                                                  hspace: Spacing.large),
                                              Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Icon(
                                                    Icons.person,
                                                    size: UiHelper.displayWidth(
                                                            context) *
                                                        0.065,
                                                    color:
                                                        const Color(0xFF0062DE),
                                                  )),
                                              UiHelper.horizontaSpace(
                                                  hspace: Spacing.medium),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Gender',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      letterSpacing: 0.3,
                                                      fontFamily: "KumbhSans",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xFF222222),
                                                      fontSize:
                                                          UiHelper.displayWidth(
                                                                  context) *
                                                              0.043),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xxlarge),
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xlarge),
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xsmall),
                                                  Align(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      width: width * 0.65,
                                                      height: height * 0.03,
                                                      child: Text(
                                                        gen,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            letterSpacing: 0.1,
                                                            fontFamily:
                                                                "SignikaNegative-Bold",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xFFA6AEB0),
                                                            fontSize: UiHelper
                                                                    .displayWidth(
                                                                        context) *
                                                                0.04),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: UiHelper.displayHeight(
                                                    context) *
                                                0.000090,
                                          ),
                                          UiHelper.verticalSpace(
                                              vspace: Spacing.medium),
                                          Row(
                                            children: [
                                              UiHelper.horizontaSpace(
                                                  hspace: Spacing.large),
                                              Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Icon(
                                                    Icons.face,
                                                    size: UiHelper.displayWidth(
                                                            context) *
                                                        0.065,
                                                    color:
                                                        const Color(0xFF0062DE),
                                                  )),
                                              UiHelper.horizontaSpace(
                                                  hspace: Spacing.medium),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Age',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      letterSpacing: 0.3,
                                                      fontFamily: "KumbhSans",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xFF222222),
                                                      fontSize:
                                                          UiHelper.displayWidth(
                                                                  context) *
                                                              0.043),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xxlarge),
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xlarge),
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xsmall),
                                                  Align(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      width: width * 0.65,
                                                      height: height * 0.03,
                                                      child: Text(
                                                        aging.toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            letterSpacing: 0.1,
                                                            fontFamily:
                                                                "SignikaNegative-Bold",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xFFA6AEB0),
                                                            fontSize: UiHelper
                                                                    .displayWidth(
                                                                        context) *
                                                                0.04),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: UiHelper.displayHeight(
                                                    context) *
                                                0.000090,
                                          ),
                                          UiHelper.verticalSpace(
                                              vspace: Spacing.medium),
                                          Row(
                                            children: [
                                              UiHelper.horizontaSpace(
                                                  hspace: Spacing.large),
                                              Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Icon(
                                                    Icons
                                                        .calendar_month_rounded,
                                                    size: UiHelper.displayWidth(
                                                            context) *
                                                        0.065,
                                                    color:
                                                        const Color(0xFF0062DE),
                                                  )),
                                              UiHelper.horizontaSpace(
                                                  hspace: Spacing.medium),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Date of Birth',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      letterSpacing: 0.3,
                                                      fontFamily: "KumbhSans",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xFF222222),
                                                      fontSize:
                                                          UiHelper.displayWidth(
                                                                  context) *
                                                              0.043),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xxlarge),
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xlarge),
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.xsmall),
                                                  Align(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      width: width * 0.65,
                                                      height: height * 0.03,
                                                      child: Text(
                                                        dobing,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            letterSpacing: 0.1,
                                                            fontFamily:
                                                                "SignikaNegative-Bold",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xFFA6AEB0),
                                                            fontSize: UiHelper
                                                                    .displayWidth(
                                                                        context) *
                                                                0.04),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ))),
                    )
                  ])));
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(0xFF0062DE);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.55);
    path.quadraticBezierTo(
        size.width / 2, size.height / 1.825, size.width, size.height * 0.55);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
