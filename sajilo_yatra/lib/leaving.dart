// ignore_for_file: unnecessary_new

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NinethRoute extends StatefulWidget {
  const NinethRoute({Key? key}) : super(key: key);

  @override
  State<NinethRoute> createState() => _NinethRouteState();
}

class _NinethRouteState extends State<NinethRoute> {
  @override
  var vehicle = ['Bus', 'Jeep', 'MicroBus', 'Taxi', 'Others'];
  var vehicle1 = [];
  DateTime? dob;
  TextEditingController dobController = TextEditingController();
  DateTime? dob2;
  TextEditingController dobController2 = TextEditingController();
  String? drop;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFFF),
      appBar: AppBar(
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
                Navigator.pushNamed(context, '/tenth');
              },
            );
          },
        ),
        backgroundColor: Color(0xFF0062DE),
        title: const Text('Search',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: 'Roboto Bold',
              fontSize: 22,
              height: 1.19,
              fontWeight: FontWeight.w500,
            )),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
                height: 132.4,
                width: 395,
                color: Color(0xFF0062DE),
                child: Column(children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    widthFactor: 1.35,
                    child: Text(
                      "Leaving From",
                      style: TextStyle(
                          height: 1.5,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF),
                          fontSize: 40),
                    ),
                  ),
                  Row(children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 17, right: 10, left: 16),
                      width: 300,
                      height: 40,
                      child: TextFormField(
                        maxLines: 1,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFFFFFFF),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            size: 28,
                            color: Color(0xFF222222),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFFFFFFF),
                                width: 2,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(
                              Radius.circular(9),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFFFFFFF),
                                width: 2,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(
                              Radius.circular(9),
                            ),
                          ),
                          hintText: 'Leaving From',
                          hintStyle: TextStyle(
                              height: 0.9,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF222222),
                              fontSize: 16),
                          suffixIconColor: Color.fromARGB(255, 255, 0, 0),
                        ),
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Leaving field cannot be empty';
                          }
                          return '';
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 1),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            height: 2.96,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFFFFFF),
                            fontSize: 16),
                      ),
                    ),
                  ]),
                ])),
          ],
        ),
      ),
    );
  }
}
