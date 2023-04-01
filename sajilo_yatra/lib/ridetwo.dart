// ignore_for_file: unnecessary_new

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RideTwo extends StatefulWidget {
  final String? city;
  const RideTwo({
    Key? key,
    this.city,
  }) : super(key: key);

  @override
  State<RideTwo> createState() => _RideTwoState();
}

class _RideTwoState extends State<RideTwo> {
  @override
  var vehicle = ['Bus', 'Jeep', 'MicroBus', 'Taxi', 'Others'];
  var vehicle1 = [];
  DateTime? dob;
  TextEditingController dobController = TextEditingController();
  DateTime? dob2;
  TextEditingController dobController2 = TextEditingController();
  String? drop;

  TextEditingController? _cityController;
  @override
  void initState() {
    super.initState();
    _cityController = TextEditingController(text: widget.city);
  }

  @override
  void dispose() {
    _cityController!.dispose();
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
                height: 275.4,
                width: 343,
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
                child: Column(children: [
                  Container(
                    width: 290,
                    margin: const EdgeInsets.only(top: 26),
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
                        style:
                            TextStyle(fontSize: 16.7, color: Color(0xFF222222)),
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
                    margin: const EdgeInsets.only(top: 12),
                    width: 290,
                    child: TextFormField(
                      controller: _cityController,
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
                        labelText: 'Enter City',
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
                        Navigator.pushNamed(context, '/line5');
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 135,
                        margin: const EdgeInsets.only(top: 12, left: 27),
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
                                labelText: 'Pickup',
                                hintText: 'Pickup',
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
                                  firstDate: DateTime(1900),
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
                        width: 135,
                        margin: const EdgeInsets.only(top: 12, left: 19),
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
                                labelText: 'Hire till',
                                hintText: 'Hire till',
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
                                  firstDate: DateTime(1900),
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
                ]),
              ),
              Align(
                heightFactor: 0.65,
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 40.4,
                  width: 140,
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
                      Navigator.pushNamed(context, '/seventh');
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
