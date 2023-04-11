// ignore_for_file: unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sajilo_yatra/ui_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VehicleTickets extends StatefulWidget {
  final String? going;
  final User? user;
  final String? leaving;
  final String? dob;
  final String? depart;
  final String? arrival;
  final String? price;
  const VehicleTickets(
      {Key? key,
      this.going,
      this.leaving,
      this.dob,
      this.depart,
      this.arrival,
      this.price,
      this.user})
      : super(key: key);

  @override
  State<VehicleTickets> createState() => _VehicleTicketsState();
}

class _VehicleTicketsState extends State<VehicleTickets> {
  int _selectedIndex = 1;
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController dobController3 = TextEditingController();
  TextEditingController dobController2 = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController timeController2 = TextEditingController();
  TextEditingController priceController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _storage = FlutterSecureStorage();
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final fireStore =
      FirebaseFirestore.instance.collection('vehicle_owners').snapshots();

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
  String d_date = "";
  String depart1 = "";
  String departure1 = "";
  String price1 = "";
  String r_date = "";

  var isLoading = true;

  void _getSavedData() async {
    final fullName = await _storage.read(key: 'full_name');
    final vehName = await _storage.read(key: 'vehicle_name');
    final vehFac = await _storage.read(key: 'vehicle_facility');
    final location = await _storage.read(key: 'location');
    final email = await _storage.read(key: 'email');
    final phoneNumber = await _storage.read(key: 'phone_number');
    final gender = await _storage.read(key: 'gender');
    final age = await _storage.read(key: 'age');
    final seat = await _storage.read(key: 'vehicle_seats');
    final dob = await _storage.read(key: 'dob');

    setState(() {
      username = fullName!;
      locat = location!;
      emailing = email!;
      phonenumber = phoneNumber!;
      gen = gender!;
      aging = age!;
      dobing = dob!;
      vehiclename = vehName!;
      vehiclefacility = vehFac!;
      seats = seat!;
      isLoading = false;
    });
  }

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
    timeController = TextEditingController(text: widget.depart);
    timeController2 = TextEditingController(text: widget.arrival);
    priceController = TextEditingController(text: widget.price);

    _getSavedData();
    _savedData();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0062DE),
        centerTitle: true,
        title: const Text('Tickets',
            style: TextStyle(
              letterSpacing: 0.95,
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
                                        UiHelper.displayHeight(context) * 0.157,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 15, top: 18),
                                          child: Text(
                                            "${departure1.split(',')[0].trim().toUpperCase()} TO ${arrival1.split(',')[0].trim().toUpperCase()}",
                                            style: TextStyle(
                                              fontFamily: "PublicSans",
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFFFFFFFF),
                                              fontSize: UiHelper.displayWidth(
                                                      context) *
                                                  0.035,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 25),
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
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: UiHelper.displayHeight(context) *
                                          0.234,
                                      color: Color(0xFF9BC2F2),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          UiHelper.verticalSpace(
                                              vspace: Spacing.small),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 17),
                                            child: Text(
                                              vehiclename,
                                              style: TextStyle(
                                                fontFamily: "PublicSans",
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFFFFFFFF),
                                                fontSize: UiHelper.displayWidth(
                                                        context) *
                                                    0.047,
                                              ),
                                            ),
                                          ),
                                          UiHelper.verticalSpace(
                                              vspace: Spacing.small),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 17),
                                            child: Text(
                                              vehiclefacility,
                                              style: TextStyle(
                                                fontFamily: "PublicSans",
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF222222),
                                                fontSize: UiHelper.displayWidth(
                                                        context) *
                                                    0.038,
                                              ),
                                            ),
                                          ),
                                          UiHelper.verticalSpace(
                                              vspace: Spacing.medium),
                                          Row(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 17),
                                                child: Text(
                                                  depart1,
                                                  style: TextStyle(
                                                    fontFamily: "PublicSans",
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF222222),
                                                    fontSize:
                                                        UiHelper.displayWidth(
                                                                context) *
                                                            0.036,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 8, bottom: 2),
                                                height: UiHelper.displayHeight(
                                                        context) *
                                                    0.01,
                                                width: UiHelper.displayWidth(
                                                        context) *
                                                    0.02,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF222222),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                70))),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                  left: 0,
                                                  bottom: 2,
                                                ),
                                                height: UiHelper.displayHeight(
                                                        context) *
                                                    0.0035,
                                                width: UiHelper.displayWidth(
                                                        context) *
                                                    0.07,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF222222),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                00))),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                  left: 0,
                                                  bottom: 2,
                                                ),
                                                height: UiHelper.displayHeight(
                                                        context) *
                                                    0.0035,
                                                width: UiHelper.displayWidth(
                                                        context) *
                                                    0.07,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF222222),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                00))),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 2),
                                                height: UiHelper.displayHeight(
                                                        context) *
                                                    0.01,
                                                width: UiHelper.displayWidth(
                                                        context) *
                                                    0.02,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF222222),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                70))),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 8),
                                                child: Text(
                                                  arrive1,
                                                  style: TextStyle(
                                                    fontFamily: "PublicSans",
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF222222),
                                                    fontSize:
                                                        UiHelper.displayWidth(
                                                                context) *
                                                            0.036,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 14, left: 17),
                                            height: UiHelper.displayHeight(
                                                    context) *
                                                0.0007,
                                            width:
                                                UiHelper.displayWidth(context) *
                                                    0.9,
                                            decoration: BoxDecoration(
                                                color: Color(0xFF222222),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(00))),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 15, left: 18),
                                                  height:
                                                      UiHelper.displayHeight(
                                                              context) *
                                                          0.045,
                                                  width: UiHelper.displayWidth(
                                                          context) *
                                                      0.245,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFF222222),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  6))),
                                                  child: Row(
                                                    children: [
                                                      UiHelper.horizontaSpace(
                                                          hspace:
                                                              Spacing.small),
                                                      Icon(
                                                        Icons
                                                            .event_seat_rounded,
                                                        color:
                                                            Color(0xFFFFFFFF),
                                                        size: UiHelper
                                                                .displayWidth(
                                                                    context) *
                                                            0.05,
                                                      ),
                                                      UiHelper.horizontaSpace(
                                                          hspace:
                                                              Spacing.small),
                                                      Text(
                                                        "$seats Seats",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "PublicSans",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xFFFFFFFF),
                                                          fontSize: UiHelper
                                                                  .displayWidth(
                                                                      context) *
                                                              0.034,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: UiHelper.displayWidth(
                                                          context) *
                                                      0.47,
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  margin: const EdgeInsets.only(
                                                      top: 15),
                                                  child: Text(
                                                    "Rs: $price1",
                                                    style: TextStyle(
                                                      fontFamily: "PublicSans",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xFF222222),
                                                      fontSize:
                                                          UiHelper.displayWidth(
                                                                  context) *
                                                              0.043,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 13.75, left: 8),
                                                  width: UiHelper.displayWidth(
                                                          context) *
                                                      0.06,
                                                  height:
                                                      UiHelper.displayHeight(
                                                              context) *
                                                          0.03,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFFFFFF),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                13.8)),
                                                  ),
                                                  child: Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    size: UiHelper.displayWidth(
                                                            context) *
                                                        0.036,
                                                    color: Color(0xFF0062DE),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                        "You have no ticket publications yet.",
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
                                        "Publish Now",
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
          if (value == 0) Navigator.pushNamed(context, '/line7');
          if (value == 1) Navigator.pushNamed(context, '/line10');
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
                                  Navigator.pushNamed(context, '/fourth');
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
            label: "Tickets",
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
        child: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
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
      ),
      // position the cart button in the center of the bottom navigation bar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
