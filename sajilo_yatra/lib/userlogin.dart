import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sajilo_yatra/userhome.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({Key? key}) : super(key: key);
  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  bool _isObscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? email;
  String? password;
  final storage = FlutterSecureStorage();

  Future<void> login() async {
    setState(() {
      email = emailController.text;
      password = passwordController.text;
    });

    final snapshot = await db.collection("users").get();
    final users = snapshot.docs
        .map((doc) => doc.data())
        .where(
            (owner) => owner["email"] == email && owner["password"] == password)
        .toList();

    if (users.length == 1) {
      final user = users.first;
      final fullName = user["full_name"];
      final location = user["location"];
      final email = user["email"];
      final phoneNumber = user["phone_number"];
      final gender = user["gender"];
      final age = user["age"];
      final dob = user["dob"].toString();

      await storage.write(key: 'full_name', value: fullName);
      await storage.write(key: 'location', value: location);
      await storage.write(key: 'email', value: email);
      await storage.write(key: 'phone_number', value: phoneNumber.toString());
      await storage.write(key: 'gender', value: gender);
      await storage.write(key: 'age', value: age.toString());
      await storage.write(key: 'dob', value: dob);

      Navigator.pushNamed(context, '/seventh', arguments: fullName);
    } else {
      final invalidCredentialsErrorBar = SnackBar(
        content: Text(
          "Invalid email or password!",
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
      ScaffoldMessenger.of(context).showSnackBar(invalidCredentialsErrorBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFF4E93E8),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 1.8,
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
                        "Sign In to continue",
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
                      margin: const EdgeInsets.only(top: 37),
                      child: Column(
                        children: [
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
                                suffixIconColor: Color.fromARGB(255, 255, 0, 0),
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
                            margin: const EdgeInsets.only(bottom: 38.5, top: 7),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: _isObscure,
                              maxLines: 1,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFF9BC2F2),
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Color(0xFF222222),
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
                                suffixIconColor: Color.fromARGB(255, 255, 0, 0),
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
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.9,
                      child: Container(
                        height: 54.4,
                        width: 190,
                        margin: const EdgeInsets.only(bottom: 5.55),
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
                            "Sign In",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.2,
                                fontFamily: "ZenKakuGothicAntique",
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFFFFFF),
                                fontSize: 21),
                          ),
                          onPressed: () {
                            if (emailController.text.isEmpty &&
                                passwordController.text.isEmpty) {
                              final emptyFieldErrorBar = SnackBar(
                                content: Text(
                                  "Email and Password fields cannot be empty!",
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
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(emptyFieldErrorBar);
                            } else if (emailController.text.isEmpty) {
                              final emptyFieldErrorBar = SnackBar(
                                content: Text(
                                  "Email field cannot be empty!",
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
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(emptyFieldErrorBar);
                            } else if (passwordController.text.isEmpty) {
                              final emptyFieldErrorBar = SnackBar(
                                content: Text(
                                  "Password field cannot be empty!",
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
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(emptyFieldErrorBar);
                            } else {
                              // Call the login function
                              login();
                            }
                          },
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF222222),
                            fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Row(
                        children: [
                          const Align(
                            alignment: Alignment.bottomRight,
                            widthFactor: 1.38,
                            heightFactor: 1,
                            child: Text(
                              "Don't have any account?",
                              style: TextStyle(
                                  height: 5.5,
                                  fontFamily: "Comfortaa",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 14),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/fifth');
                            },
                            child: const Align(
                              alignment: Alignment.bottomRight,
                              widthFactor: 1.13,
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    height: 4.97,
                                    fontFamily: "K2D",
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF222222),
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
    );
  }
}
