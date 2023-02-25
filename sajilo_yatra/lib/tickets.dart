// ignore_for_file: unnecessary_new

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EighthScreen extends StatefulWidget {
  const EighthScreen({Key? key}) : super(key: key);

  @override
  State<EighthScreen> createState() => _EighthScreenState();
}

class _EighthScreenState extends State<EighthScreen> {
  @override
  var vehicle = ['Bus', 'Jeep', 'MicroBus', 'Taxi', 'Others'];
  var vehicle1 = [];
  DateTime? dob;
  TextEditingController dobController = TextEditingController();
  DateTime? dob2;
  TextEditingController dobController2 = TextEditingController();
  String? drop;
  Widget build(BuildContext context) {
    return Scaffold(
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
                Navigator.pushNamed(context, '/seventh');
              },
            );
          },
        ),
        backgroundColor: Color(0xFF222222),
        title: const Text('Tickets',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: 'Roboto Bold',
              fontSize: 22,
              height: 1.19,
              fontWeight: FontWeight.w500,
            )),
      ),
      body: Container(
        color: const Color(0xFF4E93E8),
        height: 800,
        child: Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 1,
                child: Image.asset(
                  "images/cover.png",
                  width: 480,
                  height: 160,
                  fit: BoxFit.fill,
                ),
              ),
              const Text(
                "Search for Vehicle Tickets",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 4,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF),
                    fontSize: 17),
              ),
              Container(
                height: 350.4,
                width: 343,
                margin: const EdgeInsets.only(top: 7),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 64, 140, 233),
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                ),
                child: Column(children: [
                  Container(
                    width: 290,
                    margin: const EdgeInsets.only(top: 26),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 64, 140, 233),
                      border: Border.all(
                          color: Color(0xFFFFFFFF),
                          width: 3.5,
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
                      readOnly: true,
                      maxLines: 1,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 64, 140, 233),
                        prefixIcon: Icon(
                          Icons.near_me_rounded,
                          color: Color(0xFF222222),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFFFFFFFF),
                              width: 3.5,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFFFFFFFF),
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
                        Navigator.pushNamed(context, '/eleventh');
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 290,
                    child: TextFormField(
                      maxLines: 1,
                      readOnly: true,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 64, 140, 233),
                        prefixIcon: Icon(
                          Icons.location_on_rounded,
                          color: Color(0xFF222222),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFFFFFFFF),
                              width: 3.5,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFFFFFFFF),
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
                        Navigator.pushNamed(context, '/tweleventh');
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
                                fillColor:
                                    const Color.fromARGB(255, 64, 140, 233),
                                suffixIcon: Icon(
                                  Icons.calendar_month_rounded,
                                  size: 28,
                                  color: Color(0xFF222222),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFFFFFFFF),
                                      width: 3.5,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF9BC2F2),
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
                                fillColor:
                                    const Color.fromARGB(255, 64, 140, 233),
                                suffixIcon: Icon(
                                  Icons.calendar_month_rounded,
                                  size: 28,
                                  color: Color(0xFF222222),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFFFFFFFF),
                                      width: 3.5,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF9BC2F2),
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
                      primary: const Color(0xFF0062DE),

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
