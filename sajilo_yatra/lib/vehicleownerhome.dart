import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:sajilo_yatra/ride.dart';
import 'package:sajilo_yatra/search.dart';
import 'package:sajilo_yatra/tickets.dart';
import 'package:sajilo_yatra/ui_helper.dart';
import 'package:sajilo_yatra/vehicletickets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VehicleHome extends StatefulWidget {
  final String userId;
  final String going;
  final String leaving;

  const VehicleHome(
      {Key? key,
      required this.userId,
      required this.going,
      required this.leaving})
      : super(key: key);

  @override
  State<VehicleHome> createState() => _VehicleHomeState();
}

class _VehicleHomeState extends State<VehicleHome> {
  final _storage = FlutterSecureStorage();
  var vehicle = ['Bus', 'Jeep', 'MicroBus', 'Taxi', 'Others'];
  var vehicle1 = [];
  DateTime? dob;
  String referenceId = "";
  TimeOfDay _time = TimeOfDay.now();
  TextEditingController dobController = TextEditingController();
  DateTime? dob2;
  TextEditingController dobController2 = TextEditingController();
  String? drop;
  TextEditingController _goingController = TextEditingController();
  TextEditingController _leavingController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _timeController2 = TextEditingController();
  TextEditingController priceController = TextEditingController();

  var isLoading = false;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final db = FirebaseFirestore.instance;
  String username = "";
  String vehiclenam = "";
  String seats = "";
  String departure = "";
  String arrival = "";
  String depart = "";
  String arrive = "";
  String ddob = "";
  String rdob = "";
  String price = "";

  @override
  void initState() {
    super.initState();
    _goingController = TextEditingController(text: widget.going);
    _leavingController = TextEditingController(text: widget.leaving);

    _getSavedData();
  }

  @override
  void dispose() {
    _timeController.dispose();
    _timeController2.dispose();
    _goingController.dispose();
    _leavingController.dispose();
    super.dispose();
  }

  void _getSavedData() async {
    final fullName = await _storage.read(key: 'full_name');
    final vehicleName = await _storage.read(key: 'vehicle_name');
    final seat = await _storage.read(key: 'vehicle_seats');
    setState(() {
      username = fullName!;
      vehiclenam = vehicleName!;
      seats = seat!;
    });
  }

  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        _timeController.text = pickedTime.format(context);
      });
    }
  }

  Future<void> _selectTime2(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        _timeController2.text = pickedTime.format(context);
      });
    }
  }

  register() async {
    if (dobController.text.isEmpty ||
        dobController2.text.isEmpty ||
        _timeController.text.isEmpty ||
        _timeController2.text.isEmpty ||
        _leavingController.text.isEmpty ||
        _goingController.text.isEmpty ||
        priceController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                backgroundColor: Color(0xFF0062DE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                title: Text("Please fill up all the fields!!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Nunito",
                      fontSize: UiHelper.displayWidth(context) * 0.050,
                    )),
                actions: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 11,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFFFFF),
                          ),
                          child: Text("Okay",
                              style: TextStyle(
                                color: Color(0xFF0062DE),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Cabin",
                                fontSize:
                                    UiHelper.displayWidth(context) * 0.045,
                              )),
                          onPressed: () {
                            // Perform logout here
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  )
                ]);
          });
    } else {
      db.collection('vehicle_home').add({
        'Arrival': _goingController.text,
        'Arrive': _timeController2.text,
        'D_date': dobController.text,
        'Depart': _timeController.text,
        'Departure': _leavingController.text,
        'Price': priceController.text,
        'R_date': dobController2.text,
      });
      payWithKhaltiInApp();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0062DE),
        title: Container(
          margin: const EdgeInsets.only(bottom: 2),
          child: Text('Welcome ${username.split(' ')[0]}',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: 'ComicNeue',
                fontSize: UiHelper.displayWidth(context) * 0.055,
                fontWeight: FontWeight.w900,
              )),
        ),
        elevation: 0,
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 6),
            child: IconButton(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Color(0xFFFFFFFF),
                size: UiHelper.displayWidth(context) * 0.085,
              ),
              tooltip: 'Open shopping cart',
              onPressed: () {
                Navigator.pushNamed(context, '/fourteenth');
              },
            ),
          ),
        ],
      ),

      body: Center(
        child: isLoading
            ? const CircularProgressIndicator(
                color: Color(0xFF0062DE),
              )
            : Column(children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      height: UiHelper.displayHeight(context) * 0.9,
                      child: Column(children: [
                        Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Color(0xFFFFFFFF),
                                    width: UiHelper.displayWidth(context) * 1,
                                    height:
                                        UiHelper.displayHeight(context) * 0.07,
                                    child: Text(
                                      vehiclenam,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        height:
                                            UiHelper.displayHeight(context) *
                                                0.00285,
                                        fontFamily: "Cambay",
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF0062DE),
                                        fontSize:
                                            UiHelper.displayWidth(context) *
                                                0.065,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: UiHelper.displayHeight(context) * 0.72,
                          width: UiHelper.displayWidth(context) * 0.84,
                          margin: const EdgeInsets.only(top: 18),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(14)),
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
                              margin: const EdgeInsets.only(top: 18),
                              width: 290,
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
                                        color:
                                            Color.fromARGB(255, 242, 243, 245),
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 242, 243, 245),
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  labelText: 'Departure Location',
                                  labelStyle: TextStyle(
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF222222),
                                      fontSize: 17.7),
                                  suffixIconColor:
                                      Color.fromARGB(255, 255, 0, 0),
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
                                  Navigator.pushNamed(context, '/line8');
                                },
                                onChanged: (String val) {
                                  departure = val;
                                  print(departure);
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              width: 290,
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
                                        color:
                                            Color.fromARGB(255, 242, 243, 245),
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 242, 243, 245),
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  labelText: 'Arrival Location',
                                  labelStyle: TextStyle(
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF222222),
                                      fontSize: 17.7),
                                  suffixIconColor:
                                      Color.fromARGB(255, 255, 0, 0),
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
                                  Navigator.pushNamed(context, '/line8');
                                },
                                onChanged: (String val) {
                                  arrival = val;
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              width: 290,
                              child: TextFormField(
                                controller: _timeController,
                                maxLines: 1,
                                readOnly: true,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFFFFFFF),
                                  prefixIcon: Icon(
                                    Icons.access_time_filled_rounded,
                                    color: Color(0xFF222222),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 242, 243, 245),
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 242, 243, 245),
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  labelText: 'Departing Time',
                                  labelStyle: TextStyle(
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF222222),
                                      fontSize: 17.7),
                                  suffixIconColor:
                                      Color.fromARGB(255, 255, 0, 0),
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
                                onTap: () => _selectTime(context),
                                onChanged: (String val) {
                                  depart = val;
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              width: 290,
                              child: TextFormField(
                                controller: _timeController2,
                                maxLines: 1,
                                readOnly: true,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFFFFFFF),
                                  prefixIcon: Icon(
                                    Icons.access_time_filled_rounded,
                                    color: Color(0xFF222222),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 242, 243, 245),
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 242, 243, 245),
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  labelText: 'Arriving Time',
                                  labelStyle: TextStyle(
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF222222),
                                      fontSize: 17.7),
                                  suffixIconColor:
                                      Color.fromARGB(255, 255, 0, 0),
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
                                onTap: () => _selectTime2(context),
                                onChanged: (String val) {
                                  arrive = val;
                                },
                              ),
                            ),
                            Container(
                              width: 290,
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
                                            color: Color.fromARGB(
                                                255, 242, 243, 245),
                                            width: 3,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 242, 243, 245),
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
                                      suffixIconColor:
                                          Color.fromARGB(255, 255, 0, 0),
                                    ),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Mulish",
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    onTap: () async {
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                      final DateTime? date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                      );
                                      if (date != null) {
                                        dobController.text =
                                            DateFormat("yyyy-MM-dd")
                                                .format(date);
                                        dob = date;
                                      }
                                    },
                                    onChanged: (String val) {
                                      ddob = val;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 290,
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
                                            color: Color.fromARGB(
                                                255, 242, 243, 245),
                                            width: 3,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 242, 243, 245),
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
                                      suffixIconColor:
                                          Color.fromARGB(255, 255, 0, 0),
                                    ),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Mulish",
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    onTap: () async {
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                      final DateTime? date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                      );
                                      if (date != null) {
                                        dobController2.text =
                                            DateFormat("yyyy-MM-dd")
                                                .format(date);
                                        dob2 = date;
                                      }
                                    },
                                    onChanged: (String val) {
                                      rdob = val;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              width: 290,
                              child: TextFormField(
                                controller: priceController,
                                keyboardType: TextInputType.visiblePassword,
                                maxLines: 1,
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFFFFFFF),
                                  prefixIcon: Icon(
                                    Icons.currency_rupee_rounded,
                                    color: Color(0xFF222222),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 242, 243, 245),
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 242, 243, 245),
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  labelText: 'Seat Price',
                                  hintText: 'Enter Your Seat Price',
                                  labelStyle: TextStyle(
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF222222),
                                      fontSize: 17.7),
                                  hintStyle: TextStyle(
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF222222),
                                      fontSize: 17.7),
                                  suffixIconColor:
                                      Color.fromARGB(255, 255, 0, 0),
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
                                onChanged: (String val) {
                                  price = val;
                                },
                              ),
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
                                  "Publish",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      height: 1.2,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 16),
                                ),
                                onPressed: () {
                                  register();
                                }),
                          ),
                        )
                      ]),
                    ),
                  ),
                )
              ]),
      ),

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

  payWithKhaltiInApp() {
    int originalAmount = 100;
    final price = priceController.text;

    // get discount amount for entered code, default to 0 if code not found
    int discountedAmount = originalAmount * int.parse(price) * int.parse(seats);

    // get discount amount for entered code, default to 0 if code not found

    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: discountedAmount, //in paisa
        productIdentity: 'Product Id',
        productName: 'Product Name',
        mobileReadOnly: false,
      ),
      preferences: [
        PaymentPreference.khalti,
      ],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCancel,
    );
  }

  void onSuccess(PaymentSuccessModel success) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Payment Successful'),
          actions: [
            SimpleDialogOption(
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    referenceId = success.idx;
                  });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VehicleTickets(
                              leaving: _leavingController.text,
                              going: _goingController.text,
                              dob: dobController.text,
                              depart: _timeController.text,
                              arrival: _timeController2.text,
                              price: priceController.text)));
                })
          ],
        );
      },
    );
  }

  void onFailure(PaymentFailureModel failure) {
    debugPrint(
      failure.toString(),
    );
  }

  void onCancel() {
    debugPrint('Cancelled');
  }
}
