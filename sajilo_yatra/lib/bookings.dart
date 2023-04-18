// ignore_for_file: unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import 'package:sajilo_yatra/payment.dart';
import 'dart:convert';

import 'package:sajilo_yatra/ui_helper.dart';

class EighthRoute extends StatefulWidget {
  const EighthRoute({
    Key? key,
  }) : super(key: key);

  @override
  State<EighthRoute> createState() => _EighthRouteState();
}

class _EighthRouteState extends State<EighthRoute> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController dobController3 = TextEditingController();
  TextEditingController dobController2 = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController timeController2 = TextEditingController();
  TextEditingController priceController = TextEditingController();

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final fireStore =
      FirebaseFirestore.instance.collection('bookings').snapshots();

  final _storage = FlutterSecureStorage();
  final FirebaseFirestore db = FirebaseFirestore.instance;

  var num = 1;
  late CollectionReference ticketsRef;
  late Stream<QuerySnapshot> fireStores;

  String username = "";
  DateTime? dob2;
  String vehiclename = "";
  String locat = "";
  String emailing = "";
  String phonenumber = "";
  String gen = "";
  String aging = "";

  String dobing = "";
  String seats = "";
  String vehiclefacility = "";
  String arrival1 = "";
  String arrive1 = "";
  String date1 = "";
  String depart1 = "";
  String departure1 = "";
  String price1 = "";
  String seats1 = "";

  var isLoading = true;

  Future<void> _savedData() async {
    final snapshot = await db.collection("bookings").get();

    final users = snapshot.docs.map((doc) => doc.data()).toList();

    if (users.length > 0) {
      // check if there is at least one document in the snapshot
      final data = users.first;
      final arrival = data['arrival'];
      final arrive = data['arrive'];
      final date = data['date'];
      final depart = data['depart'];
      final departure = data['departure'];
      final price = data['price'];
      final seats = data['seats'];

      await _storage.write(key: 'arrival', value: arrival);
      await _storage.write(key: 'arrive', value: arrive);
      await _storage.write(key: 'date', value: date);
      await _storage.write(key: 'depart', value: depart);
      await _storage.write(key: 'departure', value: departure);
      await _storage.write(key: 'price', value: price.toString());
      await _storage.write(key: 'seats', value: seats.toString());

      setState(() {
        arrival1 = arrival;
        arrive1 = arrive;
        depart1 = depart;
        departure1 = departure;
        date1 = date;
        seats1 = seats.toString();
        price1 = price.toString();
        isLoading = false;
      });
    } else {
      print('No documents found for the user');
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _savedData();

    dobController3 = TextEditingController(text: date1);
    print(dobController3);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    dobController3 = TextEditingController(text: date1);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0062DE),
        centerTitle: true,
        title: const Text('Bookings',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: 'ComicNeue',
              fontSize: 24,
              fontWeight: FontWeight.w900,
            )),
        elevation: 0,
      ),
      body: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Color(0xFF0062DE),
                )
              : (arrival1.isNotEmpty &&
                      arrive1.isNotEmpty &&
                      depart1.isNotEmpty &&
                      departure1.isNotEmpty &&
                      price1.isNotEmpty) // check if ring list is empty
// check if ring list is empty
                  ? Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    color: Color(0xFF0062DE),
                                    height:
                                        UiHelper.displayHeight(context) * 0.115,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 15),
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                controller: dobController3,
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Color.fromARGB(
                                                      255, 49, 121, 215),
                                                  prefixIcon: Icon(
                                                    Icons
                                                        .calendar_month_rounded,
                                                    size: UiHelper.displayWidth(
                                                            context) *
                                                        0.075,
                                                    color: Color(0xFFFFFFFF),
                                                  ),
                                                  suffixIcon: Icon(
                                                    Icons
                                                        .arrow_drop_down_rounded,
                                                    size: UiHelper.displayWidth(
                                                            context) *
                                                        0.1,
                                                    color: Color(0xFFFFFFFF),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color.fromARGB(
                                                            255, 49, 121, 215),
                                                        width: 0,
                                                        style:
                                                            BorderStyle.solid),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color.fromARGB(
                                                            255, 49, 121, 215),
                                                        width: 0,
                                                        style:
                                                            BorderStyle.solid),
                                                  ),
                                                  prefixIconColor:
                                                      Color.fromARGB(
                                                          255, 255, 0, 0),
                                                ),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: "Mulish",
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFFFFFFFF)),
                                                onTap: () async {
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          new FocusNode());
                                                  final DateTime? date =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2100),
                                                  );
                                                  if (date != null) {
                                                    dobController3.text =
                                                        DateFormat("yyyy-MM-dd")
                                                            .format(date);
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
                                  Container(
                                    height:
                                        UiHelper.displayHeight(context) * 0.69,
                                    color: Color(0xFF9BC2F2),
                                    child: StreamBuilder<QuerySnapshot>(
                                        stream: fireStore,
                                        builder: (BuildContext context,
                                            AsyncSnapshot<QuerySnapshot>
                                                snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }
                                          if (snapshot.hasError) {
                                            return Text("Some error");
                                          }
                                          return Expanded(
                                            child: ListView.builder(
                                              itemCount:
                                                  snapshot.data!.docs.length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  title: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      UiHelper.verticalSpace(
                                                          vspace:
                                                              Spacing.small),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 8,
                                                                    left: 5),
                                                            child: Text(
                                                              "${departure1.split(',')[0].trim().toUpperCase()} TO ${arrival1.split(',')[0].trim().toUpperCase()}",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "PublicSans",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Color(
                                                                    0xFFFFFFFF),
                                                                fontSize: UiHelper
                                                                        .displayWidth(
                                                                            context) *
                                                                    0.035,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: UiHelper
                                                                    .displayWidth(
                                                                        context) *
                                                                0.42,
                                                          ),
                                                          GestureDetector(
                                                            child: Icon(
                                                              Icons
                                                                  .delete_rounded,
                                                              size: UiHelper
                                                                      .displayWidth(
                                                                          context) *
                                                                  0.07,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      0,
                                                                      0),
                                                            ),
                                                            onTap: () {},
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(left: 4),
                                                        child: Text(
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ['vehicle_name'],
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "PublicSans",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xFFFFFFFF),
                                                            fontSize: UiHelper
                                                                    .displayWidth(
                                                                        context) *
                                                                0.047,
                                                          ),
                                                        ),
                                                      ),
                                                      UiHelper.verticalSpace(
                                                          vspace:
                                                              Spacing.small),
                                                      UiHelper.verticalSpace(
                                                          vspace:
                                                              Spacing.small),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(left: 4),
                                                        child: Text(
                                                          snapshot.data!
                                                                  .docs[index][
                                                              'vehicle_facility'],
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "PublicSans",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xFF222222),
                                                            fontSize: UiHelper
                                                                    .displayWidth(
                                                                        context) *
                                                                0.038,
                                                          ),
                                                        ),
                                                      ),
                                                      UiHelper.verticalSpace(
                                                          vspace:
                                                              Spacing.medium),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 4),
                                                            child: Text(
                                                              depart1,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "PublicSans",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Color(
                                                                    0xFF222222),
                                                                fontSize: UiHelper
                                                                        .displayWidth(
                                                                            context) *
                                                                    0.036,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8,
                                                                    bottom: 2),
                                                            height: UiHelper
                                                                    .displayHeight(
                                                                        context) *
                                                                0.01,
                                                            width: UiHelper
                                                                    .displayWidth(
                                                                        context) *
                                                                0.02,
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xFF222222),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            70))),
                                                          ),
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 0,
                                                              bottom: 2,
                                                            ),
                                                            height: UiHelper
                                                                    .displayHeight(
                                                                        context) *
                                                                0.0035,
                                                            width: UiHelper
                                                                    .displayWidth(
                                                                        context) *
                                                                0.07,
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xFF222222),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            00))),
                                                          ),
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 0,
                                                              bottom: 2,
                                                            ),
                                                            height: UiHelper
                                                                    .displayHeight(
                                                                        context) *
                                                                0.0035,
                                                            width: UiHelper
                                                                    .displayWidth(
                                                                        context) *
                                                                0.07,
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xFF222222),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            00))),
                                                          ),
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 2),
                                                            height: UiHelper
                                                                    .displayHeight(
                                                                        context) *
                                                                0.01,
                                                            width: UiHelper
                                                                    .displayWidth(
                                                                        context) *
                                                                0.02,
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xFF222222),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            70))),
                                                          ),
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8),
                                                            child: Text(
                                                              arrive1,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "PublicSans",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Color(
                                                                    0xFF222222),
                                                                fontSize: UiHelper
                                                                        .displayWidth(
                                                                            context) *
                                                                    0.036,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            top: 14, left: 4),
                                                        height: UiHelper
                                                                .displayHeight(
                                                                    context) *
                                                            0.0007,
                                                        width: UiHelper
                                                                .displayWidth(
                                                                    context) *
                                                            0.9,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xFF222222),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            00))),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 15,
                                                                    left: 5),
                                                            height: UiHelper
                                                                    .displayHeight(
                                                                        context) *
                                                                0.045,
                                                            width: UiHelper
                                                                    .displayWidth(
                                                                        context) *
                                                                0.245,
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xFF222222),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            6))),
                                                            child: Row(
                                                              children: [
                                                                UiHelper.horizontaSpace(
                                                                    hspace: Spacing
                                                                        .small),
                                                                Icon(
                                                                  Icons
                                                                      .event_seat_rounded,
                                                                  color: Color(
                                                                      0xFFFFFFFF),
                                                                  size: UiHelper
                                                                          .displayWidth(
                                                                              context) *
                                                                      0.05,
                                                                ),
                                                                UiHelper.horizontaSpace(
                                                                    hspace: Spacing
                                                                        .small),
                                                                Text(
                                                                  "${snapshot.data!.docs[index]['seats'].toString()} Seats",
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "PublicSans",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color(
                                                                        0xFFFFFFFF),
                                                                    fontSize:
                                                                        UiHelper.displayWidth(context) *
                                                                            0.034,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: UiHelper
                                                                    .displayWidth(
                                                                        context) *
                                                                0.5,
                                                          ),
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 15),
                                                            child: Text(
                                                              "Rs: ${double.parse(price1).round()}",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "PublicSans",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Color(
                                                                    0xFF222222),
                                                                fontSize: UiHelper
                                                                        .displayWidth(
                                                                            context) *
                                                                    0.043,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(
                                                          top: 18,
                                                        ),
                                                        height: UiHelper
                                                                .displayHeight(
                                                                    context) *
                                                            0.0015,
                                                        width: UiHelper
                                                                .displayWidth(
                                                                    context) *
                                                            1,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xFF222222),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            00))),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    heightFactor: 0.6,
                                    child: Container(
                                      width: 395,
                                      height: 70,
                                      color: Color(0xFFFFFFFF),
                                      child: Text(
                                        "You have no bookings yet.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF0062DE),
                                            fontSize: 19.5,
                                            fontFamily: "Cambay",
                                            fontWeight: FontWeight.w900,
                                            height: 3.85),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    heightFactor: 1.8,
                                    widthFactor: 4.4,
                                    child: Icon(
                                      Icons.event_busy_rounded,
                                      size: 170,
                                      color: Color(0xFF222222),
                                    ),
                                  ),
                                  Container(
                                    height: 34.4,
                                    width: 140,
                                    margin: const EdgeInsets.only(bottom: 185),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF222222),

                                        shape: RoundedRectangleBorder(
                                            //to set border radius to button
                                            borderRadius: BorderRadius.circular(
                                                12)), //background color of button
                                      ),
                                      child: const Text(
                                        "Book Now",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            height: 1.2,
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 16),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/line7');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
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
          if (value == 4) Navigator.pushNamed(context, '/fourteenth');
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
