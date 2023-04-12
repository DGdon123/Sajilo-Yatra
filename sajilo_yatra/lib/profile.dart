// ignore_for_file: unnecessary_new

import 'dart:core';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sajilo_yatra/ui_helper.dart';

class FourthRoute extends StatefulWidget {
  final String userId;
  const FourthRoute({Key? key, required this.userId}) : super(key: key);

  @override
  State<FourthRoute> createState() => _FourthRouteState();
}

class _FourthRouteState extends State<FourthRoute> {
  final _storage = FlutterSecureStorage();
  var isLoading = true;
  String? username;
  String? locat;
  String? emailing;
  String? phonenumber;
  String? gen;
  String? aging;
  String? dobing;

  @override
  void initState() {
    super.initState();

    _getSavedData();
  }

  void _getSavedData() async {
    final fullName = await _storage.read(key: 'full_name');
    final location = await _storage.read(key: 'location');
    final email = await _storage.read(key: 'email');
    final phoneNumber = await _storage.read(key: 'phone_number');
    final gender = await _storage.read(key: 'gender');
    final age = await _storage.read(key: 'age');
    final dob = await _storage.read(key: 'dob');
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
          backgroundColor: Color(0xFF0062DE),
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
                  Navigator.pushNamed(context, '/seventh');
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
                          child: Container(
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
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                              "images/hello.jpg",
                                            ),
                                            fit: BoxFit.fill),
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(80)),
                                      ),
                                    ),
                                    Text(
                                      username!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          height: height / 305,
                                          fontFamily: "Mulish",
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFFFFFFF),
                                          fontSize: width * 0.077),
                                    ),
                                    UiHelper.verticalSpace(
                                        vspace: Spacing.small),
                                    Container(
                                      width:
                                          UiHelper.displayWidth(context) * 0.52,
                                      height: UiHelper.displayHeight(context) *
                                          0.074,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: const Color(
                                              0xFFFFFFFFF), //background color of button
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
                                                0.0009,
                                            fontFamily: "ZenKakuGothicAntique",
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF0062DE),
                                            fontSize:
                                                UiHelper.displayWidth(context) *
                                                    0.044,
                                          ),
                                        ),
                                      ),
                                    ),
                                    UiHelper.verticalSpace(
                                        vspace: Spacing.medium),
                                    Container(
                                      height: 435,
                                      width:
                                          UiHelper.displayWidth(context) * 0.83,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFFFFF),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            offset: Offset(0, 8),
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
                                                    color: Color(0xFF0062DE),
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
                                                      color: Color(0xFF222222),
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
                                                        locat!,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            letterSpacing: 0.1,
                                                            fontFamily:
                                                                "SignikaNegative-Bold",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
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
                                                    color: Color(0xFF0062DE),
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
                                                      color: Color(0xFF222222),
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
                                                        emailing!,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            letterSpacing: 0.1,
                                                            fontFamily:
                                                                "SignikaNegative-Bold",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
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
                                                    color: Color(0xFF0062DE),
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
                                                      color: Color(0xFF222222),
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
                                                        phonenumber!,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            letterSpacing: 0.1,
                                                            fontFamily:
                                                                "SignikaNegative-Bold",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
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
                                                    color: Color(0xFF0062DE),
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
                                                      color: Color(0xFF222222),
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
                                                        gen!,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            letterSpacing: 0.1,
                                                            fontFamily:
                                                                "SignikaNegative-Bold",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
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
                                                    color: Color(0xFF0062DE),
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
                                                      color: Color(0xFF222222),
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
                                                        aging!,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            letterSpacing: 0.1,
                                                            fontFamily:
                                                                "SignikaNegative-Bold",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
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
                                                    color: Color(0xFF0062DE),
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
                                                      color: Color(0xFF222222),
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
                                                        dobing!,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            letterSpacing: 0.1,
                                                            fontFamily:
                                                                "SignikaNegative-Bold",
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
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
    paint.color = Color(0xFF0062DE);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.55);
    path.quadraticBezierTo(
        size.width / 2, size.height / 1.85, size.width, size.height * 0.55);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
