import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

class SixthScreen extends StatefulWidget {
  const SixthScreen({Key? key}) : super(key: key);
  @override
  State<SixthScreen> createState() => _SixthScreenState();
}

class _SixthScreenState extends State<SixthScreen> {
  final db = FirebaseFirestore.instance;
  String? fullname;
  String? email;
  String? password;
  int? age;
  dynamic phonenumber;
  String? location;
  String? vehname;
  String? type;
  int? seat;
  int? vehnum;
  String? facility;
  DateTime? dob;
  // Initial Selected Value
  String? dropdownvalue;

  // List of items in our dropdown menu
  var items = ['Male', 'Female', 'Others'];
  var item1 = [];
  bool _isObscure = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController vehnameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController seatController = TextEditingController();
  TextEditingController facController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  register() async {
    if (fullname == null ||
        email == null ||
        password == null ||
        dropdownvalue == null ||
        age == null ||
        phonenumber == null ||
        location == null ||
        dob == null) {
      final emptyFieldErrorBar = SnackBar(
        content: Text(
          "Please fill out all the fields!",
          style: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 17,
            fontFamily: 'OpenSans',
          ),
          textAlign: TextAlign.center,
        ),
        duration: const Duration(milliseconds: 3000),
        backgroundColor: Colors.red.shade400,
      );
      ScaffoldMessenger.of(context).showSnackBar(emptyFieldErrorBar);
    } else {
      db.collection('users').add({
        'full_name': fullname,
        'email': email,
        'password': password,
        'gender': dropdownvalue,
        'age': age,
        'phone_number': phonenumber,
        'location': location,
        'dob': dob
      });
      Navigator.pushNamed(context, '/seventh');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: const Color(0xFF4E93E8),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 1.38,
                        child: Image.asset(
                          "images/logos.png",
                          width: 227,
                          height: 220,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 0.0001,
                        child: Text(
                          "Sign Up to login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 0.8,
                              letterSpacing: 0.3,
                              fontFamily: "KumbhSans",
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFFFFFF),
                              fontSize: 26),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 36),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 9.1),
                              width: 290,
                              child: TextFormField(
                                controller: nameController,
                                maxLines: 1,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFF9BC2F2),
                                  suffixIcon: Icon(
                                    Icons.edit,
                                    color: Color(0xFF222222),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF9BC2F2),
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
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
                                  labelText: 'Full Name',
                                  hintText: 'Enter Your Full Name',
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Full Name field cannot be empty';
                                  }
                                  return '';
                                },
                                onChanged: (String val) {
                                  fullname = val;
                                },
                              ),
                            ),
                            Container(
                              width: 290,
                              child: TextFormField(
                                controller: emailController,
                                maxLines: 1,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFF9BC2F2),
                                  suffixIcon: Icon(
                                    Icons.mail_rounded,
                                    color: Color(0xFF222222),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF9BC2F2),
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
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
                                  labelText: 'Email',
                                  hintText: 'Enter Your Email',
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email field cannot be empty';
                                  }
                                  return '';
                                },
                                onChanged: (String val) {
                                  email = val;
                                },
                              ),
                            ),
                            Container(
                              width: 290,
                              margin: const EdgeInsets.only(top: 9.1),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: _isObscure,
                                maxLines: 1,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFF9BC2F2),
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: const Color(0xFF222222),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      }),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF9BC2F2),
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF9BC2F2),
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  labelText: 'Password',
                                  hintText: 'Enter Your Password',
                                  hintStyle: const TextStyle(
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF222222),
                                      fontSize: 16.7),
                                  labelStyle: const TextStyle(
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF222222),
                                      fontSize: 17.7),
                                  suffixIconColor:
                                      const Color.fromARGB(255, 255, 0, 0),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password field cannot be empty';
                                  }
                                  return '';
                                },
                                onChanged: (String val) {
                                  password = val;
                                },
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Mulish",
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 161,
                                  height: 61.14,
                                  margin: const EdgeInsets.only(
                                      top: 9.1, left: 35.1),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF9BC2F2),
                                    border: Border.all(
                                        color: Color(0xFF9BC2F2),
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  child: DropdownButton2(
                                    searchController: genderController,
                                    dropdownMaxHeight: 160,
                                    itemPadding:
                                        const EdgeInsets.only(left: 16),
                                    isExpanded: true,
                                    iconSize: 42,
                                    buttonPadding:
                                        const EdgeInsets.only(top: 5),
                                    iconEnabledColor: const Color(0xFF222222),
                                    iconDisabledColor: const Color(0xFF222222),
                                    style: const TextStyle(
                                        height: 1,
                                        fontFamily: "Mulish",
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF222222),
                                        fontSize: 16.7),
                                    underline: Container(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                    hint: const Text(
                                      "Select Gender",
                                      style: TextStyle(
                                          fontSize: 15.4,
                                          color: Color(0xFF222222)),
                                    ),
                                    value: dropdownvalue,
                                    items: items.map((itemone) {
                                      return DropdownMenuItem(
                                          value: itemone, child: Text(itemone));
                                    }).toList(),
                                    onChanged: (String? newvalue) {
                                      setState(() {
                                        dropdownvalue = newvalue!;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  width: 119,
                                  margin: const EdgeInsets.only(
                                      top: 9.1, left: 7.5),
                                  child: TextFormField(
                                    controller: ageController,
                                    maxLines: 1,
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xFF9BC2F2),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF9BC2F2),
                                            width: 2,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
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
                                      labelText: 'Age',
                                      hintText: 'Enter Your Age',
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
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Age field cannot be empty';
                                      }
                                      return '';
                                    },
                                    onChanged: (String val) {
                                      age = int.parse(val);
                                    },
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Mulish",
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 290,
                              margin: const EdgeInsets.only(top: 9.1),
                              child: TextFormField(
                                controller: phoneController,
                                maxLines: 1,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFF9BC2F2),
                                  suffixIcon: Icon(
                                    Icons.phone,
                                    size: 28,
                                    color: Color(0xFF222222),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF9BC2F2),
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
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
                                  labelText: 'Phone Number',
                                  hintText: 'Enter Your Phone Number',
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Phone number field cannot be empty';
                                  }
                                  return '';
                                },
                                onChanged: (String val) {
                                  phonenumber = val;
                                },
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Mulish",
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            Container(
                              width: 290,
                              margin: const EdgeInsets.only(top: 9.1),
                              child: TextFormField(
                                controller: locationController,
                                maxLines: 1,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFF9BC2F2),
                                  suffixIcon: Icon(
                                    Icons.location_on,
                                    size: 28,
                                    color: Color(0xFF222222),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF9BC2F2),
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
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
                                  labelText: 'Location',
                                  hintText: 'Enter Your Location',
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Location field cannot be empty';
                                  }
                                  return '';
                                },
                                onChanged: (String val) {
                                  location = val;
                                },
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Mulish",
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            Container(
                              width: 290,
                              margin:
                                  const EdgeInsets.only(top: 9.1, bottom: 34),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: dobController,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xFF9BC2F2),
                                      suffixIcon: Icon(
                                        Icons.calendar_month_rounded,
                                        size: 28,
                                        color: Color(0xFF222222),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF9BC2F2),
                                            width: 2,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
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
                                      labelText: 'Date of Birth',
                                      hintText: 'Select Your Date of Birth',
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
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 0.98,
                        child: Container(
                          height: 54.4,
                          width: 190,
                          margin: const EdgeInsets.only(bottom: 1.8),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(
                                    0xFF0062DE), //background color of button
                                //border width and color

                                shape: RoundedRectangleBorder(
                                    //to set border radius to button
                                    borderRadius: BorderRadius.circular(55)),
                              ),
                              child: const Text(
                                "Sign Up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.2,
                                    fontFamily: "ZenKakuGothicAntique",
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 21),
                              ),
                              onPressed: () {
                                register();
                              }),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.bottomRight,
                              widthFactor: 1.31,
                              child: Text(
                                "Already have an account?",
                                style: TextStyle(
                                    height: 6.39,
                                    fontFamily: "Comfortaa",
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFDBEBC0),
                                    fontSize: 14),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/third');
                              },
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                widthFactor: 1.13,
                                child: Text(
                                  "Join Now",
                                  style: TextStyle(
                                      height: 5.96,
                                      fontFamily: "K2D",
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF011627),
                                      fontSize: 15.3),
                                ),
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
    );
  }
}
