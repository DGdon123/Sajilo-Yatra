import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sajilo_yatra/ui_helper.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _newPasswordController = TextEditingController();

  bool _isLoading = false;
  bool _isObscured = true;

  void _resetPassword() async {
    final email = _emailController.text.trim();
    final newPassword = _newPasswordController.text.trim();
    if (newPassword.isNotEmpty) {
      final userDocs = await FirebaseFirestore.instance
          .collection("users")
          .where("email", isEqualTo: email)
          .get();
      if (userDocs.docs.isNotEmpty) {
        final userDoc = userDocs.docs.first;
        try {
          await userDoc.reference.update({"password": newPassword});
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Password updated successfully",
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 14.2,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito',
              ),
              textAlign: TextAlign.center,
            ),
            duration: const Duration(milliseconds: 1200),
            backgroundColor: Color(0xFF0062DE),
          ));
          print("Password updated successfully in Firestore");
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Error updating password in Firestore",
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 14.2,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito',
              ),
              textAlign: TextAlign.center,
            ),
            duration: const Duration(milliseconds: 1200),
            backgroundColor: Color(0xFF0062DE),
          ));
          print("Error updating password in Firestore: $e");
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "No user found with email $email in Firestore",
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 14.2,
              fontWeight: FontWeight.w500,
              fontFamily: 'Nunito',
            ),
            textAlign: TextAlign.center,
          ),
          duration: const Duration(milliseconds: 1200),
          backgroundColor: Color(0xFF0062DE),
        ));
        print("No user found with email $email in Firestore");
      }
    }
  }

  @override
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
                Navigator.pop(context);
              },
            );
          },
        ),
        backgroundColor: Color(0xFF0062DE),
        title: Text('Forgot Password',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: 'ComicNeue',
              fontSize: UiHelper.displayWidth(context) * 0.055,
              fontWeight: FontWeight.w900,
            )),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          controller: _emailController,
                          maxLines: 1,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.mail_rounded,
                              size: UiHelper.displayHeight(context) * 0.028,
                              color: Color(0xFF222222),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFA6AEB0),
                                  width: 2,
                                  style: BorderStyle.solid),
                            ),
                            labelText: 'Email',
                            hintText: 'Enter Your Email',
                            hintStyle: TextStyle(
                              height: UiHelper.displayHeight(context) * 0.002,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFA6AEB0),
                              fontSize: UiHelper.displayWidth(context) * 0.043,
                            ),
                            labelStyle: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF222222),
                              fontSize: UiHelper.displayWidth(context) * 0.045,
                            ),
                            suffixIconColor: Color.fromARGB(255, 255, 0, 0),
                          ),
                          style: TextStyle(
                            fontSize: UiHelper.displayWidth(context) * 0.045,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFA6AEB0),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email field cannot be empty';
                            }
                            return '';
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: UiHelper.displayWidth(context) * 0.8,
                      margin: const EdgeInsets.only(bottom: 28.5, top: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          controller: _newPasswordController,
                          obscureText: _isObscured,
                          maxLines: 1,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscured
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color(0xFF271C24),
                                  size: UiHelper.displayHeight(context) * 0.028,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                }),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFA6AEB0),
                                  width: 2,
                                  style: BorderStyle.solid),
                            ),
                            labelText: 'New Password',
                            hintText: 'Enter Your New Password',
                            hintStyle: TextStyle(
                              height: UiHelper.displayHeight(context) * 0.002,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFA6AEB0),
                              fontSize: UiHelper.displayWidth(context) * 0.043,
                            ),
                            labelStyle: TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF222222),
                              fontSize: UiHelper.displayWidth(context) * 0.045,
                            ),
                            suffixIconColor: Color.fromARGB(255, 255, 0, 0),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password field cannot be empty';
                            }
                            return '';
                          },
                          style: TextStyle(
                            fontSize: UiHelper.displayWidth(context) * 0.045,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFA6AEB0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: UiHelper.displayHeight(context) * 0.069,
                        width: UiHelper.displayWidth(context) * 0.1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(
                                0xFF0062DE), //background color of button
                            //border width and color

                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          child: Text(
                            "Reset Password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: UiHelper.displayHeight(context) * 0.001,
                              fontFamily: "ZenKakuGothicAntique",
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: UiHelper.displayWidth(context) * 0.048,
                            ),
                          ),
                          onPressed: _resetPassword,
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
