import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sajilo_yatra/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FifthRoute extends StatefulWidget {
  const FifthRoute({Key? key}) : super(key: key);
  @override
  State<FifthRoute> createState() => _FifthRouteState();
}

class _FifthRouteState extends State<FifthRoute> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  bool _isObscure = true;
  bool _rememberMe = false;
  var size, height, width;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? email;
  String? password;
  Color originalButtonColor = Color(0xFF0062DE);
  Color? _buttonColor;
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();

    _loadSavedLoginDetails();
  }

  void _onRememberMeChanged(bool? newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _rememberMe = newValue ?? false;
      if (_rememberMe) {
        prefs.setString('email', emailController.text);
        prefs.setString('password', passwordController.text);
      } else {
        prefs.remove('email');
        prefs.remove('password');
      }
    });
  }

  void _loadSavedLoginDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');
    if (email != null && password != null) {
      emailController.text = email;
      passwordController.text = password;
      setState(() {
        _rememberMe = true;
      });
    }
  }

  Future<void> login() async {
    setState(() {
      email = emailController.text;
      password = passwordController.text;
    });

    if (_rememberMe) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email!);
      prefs.setString('password', password!);
    }

    final snapshot = await db.collection("vehicle_owners").get();
    final vehicleOwners = snapshot.docs
        .map((doc) => doc.data())
        .where(
            (owner) => owner["email"] == email && owner["password"] == password)
        .toList();

    if (vehicleOwners.length == 1) {
      final user = vehicleOwners.first;
      final fullName = user["full_name"];
      final location = user["location"];
      final email = user["email"];
      final phoneNumber = user["phone"];
      final gender = user["gender"];
      final age = user["age"];
      final vehicleFacility = user["vehicle_facility"];
      final vehicleName = user["vehicle_name"];
      final vehicleSeats = user["vehicle_seats"];
      final vehicleType = user["vehicle_type"];
      final dob = user["dob"].toString();

      await storage.write(key: 'full_name', value: fullName);
      await storage.write(key: 'location', value: location);
      await storage.write(key: 'email', value: email);
      await storage.write(key: 'vehicle_name', value: vehicleName);
      await storage.write(key: 'vehicle_facility', value: vehicleFacility);
      await storage.write(key: 'vehicle_seats', value: vehicleSeats.toString());
      await storage.write(key: 'vehicle_type', value: vehicleType);
      await storage.write(key: 'phone_number', value: phoneNumber.toString());
      await storage.write(key: 'gender', value: gender);
      await storage.write(key: 'age', value: age.toString());
      await storage.write(key: 'dob', value: dob);

      Navigator.pushNamed(context, '/seventh');
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
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
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
                      heightFactor: 1.65,
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
                            margin: const EdgeInsets.only(bottom: 18, top: 8.5),
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
                    Container(
                      width: width * 0.49,
                      height: height * 0.04,
                      margin: const EdgeInsets.only(right: 122, bottom: 35),
                      child: Row(
                        children: [
                          Checkbox(
                            checkColor: Color(0xFFFFFFFF),
                            activeColor: Color(0xFF0062DE),
                            value: _rememberMe,
                            onChanged: _onRememberMeChanged,
                          ),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2222222),
                              fontSize: width * 0.042,
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
                        margin: const EdgeInsets.only(bottom: 4),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/line1');
                      },
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF222222),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 0),
                      child: Row(
                        children: [
                          const Align(
                            alignment: Alignment.bottomRight,
                            widthFactor: 1.38,
                            heightFactor: 0.9,
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
                                    height: 4.05,
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
