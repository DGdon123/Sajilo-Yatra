// ignore_for_file: unnecessary_new

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sajilo_yatra/outstationgoing.dart';
import 'package:sajilo_yatra/ridesearch.dart';

class RideOne extends StatefulWidget {
  final String? going;
  final String? leaving;
  const RideOne({
    Key? key,
    this.going,
    this.leaving,
  }) : super(key: key);

  @override
  State<RideOne> createState() => _RideOneState();
}

class _RideOneState extends State<RideOne> {
  @override
  var vehicle = ['Bus', 'Jeep', 'MicroBus', 'Taxi', 'Others'];
  var vehicle1 = [];
  DateTime? dob;
  TextEditingController dobController = TextEditingController();
  DateTime? dob2;
  TextEditingController dobController2 = TextEditingController();
  String? drop;
  TextEditingController? _goingController;
  TextEditingController? _leavingController;

  @override
  void initState() {
    super.initState();
    _goingController = TextEditingController(text: widget.going);
    _leavingController = TextEditingController(text: widget.leaving);
  }

  @override
  void dispose() {
    _goingController!.dispose();
    _leavingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFFFFFFF),
        height: 800,
        child: Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                height: 408.4,
                width: 305,
                margin: const EdgeInsets.only(top: 14),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(0, 0),
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                    ), //BoxShadow
                    //BoxShadow
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 18),
                      width: 270,
                      child: TextFormField(
                        controller: _leavingController,
                        readOnly: true,
                        maxLines: 1,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFFFFFFF),
                          prefixIcon: Icon(
                            Icons.near_me_rounded,
                            color: Color(0xFF222222),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 242, 243, 245),
                                width: 3,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 242, 243, 245),
                                width: 2,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          labelText: 'Leaving From',
                          labelStyle: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF222222),
                              fontSize: 17.7),
                          suffixIconColor: Color.fromARGB(255, 255, 0, 0),
                        ),
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Leaving Destination field cannot be empty';
                          }
                          return '';
                        },
                        onTap: () {
                          Navigator.pushNamed(context, '/line4');
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      width: 270,
                      child: TextFormField(
                        controller: _goingController,
                        maxLines: 1,
                        readOnly: true,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFFFFFFF),
                          prefixIcon: Icon(
                            Icons.location_on_rounded,
                            color: Color(0xFF222222),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 242, 243, 245),
                                width: 3,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 242, 243, 245),
                                width: 2,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          labelText: 'Going To',
                          labelStyle: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF222222),
                              fontSize: 17.7),
                          suffixIconColor: Color.fromARGB(255, 255, 0, 0),
                        ),
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Going Destination field cannot be empty';
                          }
                          return '';
                        },
                        onTap: () {
                          Navigator.pushNamed(context, '/line3');
                        },
                      ),
                    ),
                    Container(
                      width: 270,
                      margin: const EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        border: Border.all(
                            color: Color.fromARGB(255, 242, 243, 245),
                            width: 3,
                            style: BorderStyle.solid),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: DropdownButton2(
                        dropdownMaxHeight: 150,
                        itemSplashColor: Color(0xFF9BC2F2),
                        itemPadding: const EdgeInsets.only(left: 16),
                        itemHighlightColor: Color(0xFF9BC2F2),
                        isExpanded: true,
                        iconSize: 42,
                        buttonPadding: const EdgeInsets.only(top: 5, bottom: 5),
                        iconEnabledColor: const Color(0xFF222222),
                        iconDisabledColor: const Color(0xFF222222),
                        style: const TextStyle(
                            height: 1,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF222222),
                            fontSize: 16.7),
                        underline: Container(color: Colors.transparent),
                        hint: const Text(
                          "Choose Vehicle",
                          style: TextStyle(
                              fontSize: 16.7, color: Color(0xFF222222)),
                        ),
                        value: drop,
                        items: vehicle.map((itemone) {
                          return DropdownMenuItem(
                              value: itemone, child: Text(itemone));
                        }).toList(),
                        onChanged: (String? newvalue) {
                          setState(() {
                            drop = newvalue!;
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 270,
                      margin: const EdgeInsets.only(top: 12),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: dobController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFFFFFFF),
                              suffixIcon: Icon(
                                Icons.calendar_month_rounded,
                                size: 28,
                                color: Color(0xFF222222),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 242, 243, 245),
                                    width: 3,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 242, 243, 245),
                                    width: 2,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              labelText: 'Departing',
                              hintText: 'Departing',
                              hintStyle: TextStyle(
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF222222),
                                  fontSize: 16.7),
                              labelStyle: TextStyle(
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF222222),
                                  fontSize: 17.7),
                              suffixIconColor: Color.fromARGB(255, 255, 0, 0),
                            ),
                            style: const TextStyle(
                                fontSize: 18,
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            onTap: () async {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              final DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100),
                              );
                              if (date != null) {
                                dobController.text =
                                    DateFormat("yyyy-MM-dd").format(date);
                                dob = date;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 270,
                      margin: const EdgeInsets.only(top: 12),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: dobController2,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFFFFFFF),
                              suffixIcon: Icon(
                                Icons.calendar_month_rounded,
                                size: 28,
                                color: Color(0xFF222222),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 242, 243, 245),
                                    width: 3,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 242, 243, 245),
                                    width: 2,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              labelText: 'Return',
                              hintText: 'Return',
                              hintStyle: TextStyle(
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF222222),
                                  fontSize: 16.7),
                              labelStyle: TextStyle(
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF222222),
                                  fontSize: 17.7),
                              suffixIconColor: Color.fromARGB(255, 255, 0, 0),
                            ),
                            style: const TextStyle(
                                fontSize: 18,
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            onTap: () async {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              final DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100),
                              );
                              if (date != null) {
                                dobController2.text =
                                    DateFormat("yyyy-MM-dd").format(date);
                                dob2 = date;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                heightFactor: 0.75,
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 40.4,
                  width: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF222222),

                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(
                              6)), //background color of button
                    ),
                    child: const Text(
                      "Search",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.2,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                          fontSize: 16),
                    ),
                    onPressed: () {
                      if (_leavingController!.text.isNotEmpty &&
                          _goingController!.text.isNotEmpty &&
                          dobController.text.isNotEmpty &&
                          dobController2.text.isNotEmpty &&
                          drop != null) {
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OutSearchScreen(
                                      leaving: _leavingController!.text,
                                      going: _goingController!.text,
                                      dob: dobController.text)));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Please fill out all the fields",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.2,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Nunito',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            duration: const Duration(milliseconds: 1200),
                            backgroundColor: Colors.blue,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
