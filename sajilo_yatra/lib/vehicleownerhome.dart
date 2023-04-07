import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sajilo_yatra/ride.dart';
import 'package:sajilo_yatra/search.dart';
import 'package:sajilo_yatra/tickets.dart';
import 'package:sajilo_yatra/ui_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VehicleHome extends StatefulWidget {
  final String userId;
  final String? going;
  final String? leaving;

  const VehicleHome({Key? key, required this.userId, this.going, this.leaving})
      : super(key: key);

  @override
  State<VehicleHome> createState() => _VehicleHomeState();
}

class _VehicleHomeState extends State<VehicleHome> {
  final _storage = FlutterSecureStorage();
  var vehicle = ['Bus', 'Jeep', 'MicroBus', 'Taxi', 'Others'];
  var vehicle1 = [];
  DateTime? dob;
  TextEditingController dobController = TextEditingController();
  DateTime? dob2;
  TextEditingController dobController2 = TextEditingController();
  String? drop;
  TextEditingController? _goingController;
  TextEditingController? _leavingController;
  TextEditingController? departController;
  TextEditingController? arrivController;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String? username;
  String? vehiclenam;

  @override
  void initState() {
    super.initState();
    _goingController = TextEditingController(text: widget.going);
    _leavingController = TextEditingController(text: widget.leaving);
    _getSavedData();
  }

  @override
  void dispose() {
    _goingController!.dispose();
    _leavingController!.dispose();
    super.dispose();
  }

  void _getSavedData() async {
    final fullName = await _storage.read(key: 'full_name');
    final vehicleName = await _storage.read(key: 'vehicle_name');
    setState(() {
      username = fullName;
      vehiclenam = vehicleName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0062DE),
        title: Container(
          margin: const EdgeInsets.only(bottom: 7),
          child: Text('Welcome ${username?.split(' ')[0]}',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: "ZenKakuGothicAntique",
                fontSize: UiHelper.displayWidth(context) * 0.055,
                fontWeight: FontWeight.w700,
              )),
        ),
        elevation: 0,
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 6, bottom: 0, top: 0),
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
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              child: Column(children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            child: Text(
                              vehiclenam!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF222222),
                                fontSize:
                                    UiHelper.displayWidth(context) * 0.055,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: UiHelper.displayHeight(context) * 0.65,
                  width: UiHelper.displayWidth(context) * 0.84,
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
                          labelText: 'Departure Location',
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
                          Navigator.pushNamed(context, '/line8');
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
                          labelText: 'Arrival Location',
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
                          Navigator.pushNamed(context, '/line8');
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      width: 290,
                      child: TextFormField(
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            departController!.text = pickedTime.format(context);
                          }
                        },
                        controller: departController,
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
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 242, 243, 245),
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          labelText: 'Departing Time',
                          labelStyle: TextStyle(
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF222222),
                            fontSize: 17.7,
                          ),
                          suffixIconColor: Color.fromARGB(255, 255, 0, 0),
                        ),
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Leaving Destination field cannot be empty';
                          }
                          return '';
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      width: 290,
                      child: TextFormField(
                        controller: arrivController,
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
                          labelText: 'Arrival Location',
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
                                  fillColor: const Color(0xFFFFFFFF),
                                  suffixIcon: Icon(
                                    Icons.calendar_month_rounded,
                                    size: 28,
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
                      onPressed: () {},
                    ),
                  ),
                ),
              ]),
            ),
          ),
        )
      ]),

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
                                  Navigator.pushNamed(context, '/third');
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
            label: "Bookings",
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
      // position the cart button in the center of the bottom navigation bar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
