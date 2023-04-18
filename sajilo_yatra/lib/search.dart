// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:intl/intl.dart';
import 'package:sajilo_yatra/payment.dart';

import 'package:sajilo_yatra/tickets.dart';
import 'package:sajilo_yatra/ui_helper.dart';

class SearchScreen extends StatefulWidget {
  final String? going;
  final String? leaving;
  final String? dob;

  const SearchScreen({
    Key? key,
    this.going,
    this.leaving,
    this.dob,
  }) : super(key: key);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController dobController3 = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DateTime? dob2;
  final String vehicle = "";
  TextEditingController dobController2 = TextEditingController();
  List<String> _places = [];
  bool isLoading = true;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final fireStore =
      FirebaseFirestore.instance.collection('vehicle_owners').snapshots();

  bool _isLoading = true;
  final _storage = FlutterSecureStorage();

  String dobing = "";
  String seats = "";
  String vehiclefacility = "";
  String arrival1 = "";
  String arrive1 = "";
  String d_date = "";
  String depart1 = "";
  String departure1 = "";
  String price1 = "";
  String r_date = "";

  Future<void> _savedData() async {
    final snapshot = await db.collection("vehicle_home").get();

    final vehicleOwners = snapshot.docs.map((doc) => doc.data()).toList();

    if (vehicleOwners.length > 0) {
      // check if there is at least one document in the snapshot
      final data = vehicleOwners.first;
      final arrival = data['Arrival'];
      final arrive = data['Arrive'];
      final ddate = data['D_date'];
      final depart = data['Depart'];
      final departure = data['Departure'];
      final price = data['Price'];
      final rdate = data['R_date'];

      await _storage.write(key: 'Arrival', value: arrival);
      await _storage.write(key: 'Arrive', value: arrive);
      await _storage.write(key: 'D_date', value: ddate);
      await _storage.write(key: 'Depart', value: depart);
      await _storage.write(key: 'Departure', value: departure);
      await _storage.write(key: 'Price', value: price);
      await _storage.write(key: 'R_date', value: rdate);

      setState(() {
        arrival1 = arrival;
        arrive1 = arrive;
        depart1 = depart;
        departure1 = departure;
        d_date = ddate;
        r_date = rdate;
        price1 = price;
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

    dobController = TextEditingController(text: widget.going);
    dobController2 = TextEditingController(text: widget.leaving);
    dobController3 = TextEditingController(text: widget.dob);
    _savedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
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
                Navigator.pop(context);
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
              height: UiHelper.displayHeight(context) * 0.256,
              color: Color(0xFF0062DE),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 22, top: 12),
                    child: Text(
                      "Select trip",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFFFFF),
                        fontSize: UiHelper.displayWidth(context) * 0.11,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 22, top: 12),
                    child: Text(
                      "${widget.leaving?.split(',')[0].trim().toUpperCase()} TO ${widget.going?.split(',')[0].trim().toUpperCase()}",
                      style: TextStyle(
                        fontFamily: "PublicSans",
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                        fontSize: UiHelper.displayWidth(context) * 0.035,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: dobController3,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 49, 121, 215),
                            prefixIcon: Icon(
                              Icons.calendar_month_rounded,
                              size: UiHelper.displayWidth(context) * 0.075,
                              color: Color(0xFFFFFFFF),
                            ),
                            suffixIcon: Icon(
                              Icons.arrow_drop_down_rounded,
                              size: UiHelper.displayWidth(context) * 0.1,
                              color: Color(0xFFFFFFFF),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 49, 121, 215),
                                  width: 0,
                                  style: BorderStyle.solid),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 49, 121, 215),
                                  width: 0,
                                  style: BorderStyle.solid),
                            ),
                            prefixIconColor: Color.fromARGB(255, 255, 0, 0),
                          ),
                          style: const TextStyle(
                              fontSize: 18,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF)),
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
                              dobController3.text =
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
            Container(
              height: UiHelper.displayHeight(context) * 0.628,
              color: Color(0xFF9BC2F2),
              child: StreamBuilder<QuerySnapshot>(
                  stream: fireStore,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text("Some error");
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Payment(
                                      leaving: dobController2.text,
                                      going: dobController.text,
                                      userId: '',
                                      veh: snapshot.data!.docs[index]
                                          ['vehicle_name'],
                                      fac: snapshot.data!.docs[index]
                                          ['vehicle_facility'],
                                      date: dobController3.text,
                                      arrive: arrive1,
                                      depart: depart1,
                                    ),
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    UiHelper.verticalSpace(
                                        vspace: Spacing.small),
                                    Container(
                                      margin: const EdgeInsets.only(left: 4),
                                      child: Text(
                                        snapshot.data!.docs[index]
                                            ['vehicle_name'],
                                        style: TextStyle(
                                          fontFamily: "PublicSans",
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFFFFFFF),
                                          fontSize:
                                              UiHelper.displayWidth(context) *
                                                  0.047,
                                        ),
                                      ),
                                    ),
                                    UiHelper.verticalSpace(
                                        vspace: Spacing.small),
                                    UiHelper.verticalSpace(
                                        vspace: Spacing.small),
                                    Container(
                                      margin: const EdgeInsets.only(left: 4),
                                      child: Text(
                                        snapshot.data!.docs[index]
                                            ['vehicle_facility'],
                                        style: TextStyle(
                                          fontFamily: "PublicSans",
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF222222),
                                          fontSize:
                                              UiHelper.displayWidth(context) *
                                                  0.038,
                                        ),
                                      ),
                                    ),
                                    UiHelper.verticalSpace(
                                        vspace: Spacing.medium),
                                    Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 4),
                                          child: Text(
                                            depart1,
                                            style: TextStyle(
                                              fontFamily: "PublicSans",
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF222222),
                                              fontSize: UiHelper.displayWidth(
                                                      context) *
                                                  0.036,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 8, bottom: 2),
                                          height:
                                              UiHelper.displayHeight(context) *
                                                  0.01,
                                          width:
                                              UiHelper.displayWidth(context) *
                                                  0.02,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF222222),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(70))),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            left: 0,
                                            bottom: 2,
                                          ),
                                          height:
                                              UiHelper.displayHeight(context) *
                                                  0.0035,
                                          width:
                                              UiHelper.displayWidth(context) *
                                                  0.07,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF222222),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(00))),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            left: 0,
                                            bottom: 2,
                                          ),
                                          height:
                                              UiHelper.displayHeight(context) *
                                                  0.0035,
                                          width:
                                              UiHelper.displayWidth(context) *
                                                  0.07,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF222222),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(00))),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 2),
                                          height:
                                              UiHelper.displayHeight(context) *
                                                  0.01,
                                          width:
                                              UiHelper.displayWidth(context) *
                                                  0.02,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF222222),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(70))),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(
                                            arrive1,
                                            style: TextStyle(
                                              fontFamily: "PublicSans",
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF222222),
                                              fontSize: UiHelper.displayWidth(
                                                      context) *
                                                  0.036,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 14, left: 4),
                                      height: UiHelper.displayHeight(context) *
                                          0.0007,
                                      width:
                                          UiHelper.displayWidth(context) * 0.9,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF222222),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(00))),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 15, left: 5),
                                          height:
                                              UiHelper.displayHeight(context) *
                                                  0.045,
                                          width:
                                              UiHelper.displayWidth(context) *
                                                  0.245,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF222222),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6))),
                                          child: Row(
                                            children: [
                                              UiHelper.horizontaSpace(
                                                  hspace: Spacing.small),
                                              Icon(
                                                Icons.event_seat_rounded,
                                                color: Color(0xFFFFFFFF),
                                                size: UiHelper.displayWidth(
                                                        context) *
                                                    0.05,
                                              ),
                                              UiHelper.horizontaSpace(
                                                  hspace: Spacing.small),
                                              Text(
                                                "${snapshot.data!.docs[index]['vehicle_seats'].toString()} Seats",
                                                style: TextStyle(
                                                  fontFamily: "PublicSans",
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize:
                                                      UiHelper.displayWidth(
                                                              context) *
                                                          0.034,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              UiHelper.displayWidth(context) *
                                                  0.54,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 15),
                                          child: Text(
                                            price1,
                                            style: TextStyle(
                                              fontFamily: "PublicSans",
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF222222),
                                              fontSize: UiHelper.displayWidth(
                                                      context) *
                                                  0.043,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 13.75, left: 8),
                                          width:
                                              UiHelper.displayWidth(context) *
                                                  0.06,
                                          height:
                                              UiHelper.displayHeight(context) *
                                                  0.03,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFFFFFF),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(13.8)),
                                          ),
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size:
                                                UiHelper.displayWidth(context) *
                                                    0.036,
                                            color: Color(0xFF0062DE),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        top: 18,
                                      ),
                                      height: UiHelper.displayHeight(context) *
                                          0.0015,
                                      width: UiHelper.displayWidth(context) * 1,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF222222),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(00))),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
