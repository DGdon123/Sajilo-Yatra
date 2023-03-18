import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

    try {
      setState(() {
        _isLoading = true;
      });

      // Send password reset email
      await _auth.sendPasswordResetEmail(email: email);

      // Automatically update password field in Firestore
      final newPassword = _newPasswordController.text.trim();
      if (newPassword.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection("users")
            .where("email", isEqualTo: email)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((doc) async {
            await doc.reference.update({"password": newPassword});
          });
        });
      }

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      // Handle reset password errors
      String errorMessage = e.toString();
      print(errorMessage);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
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
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _newPasswordController,
                      obscureText: _isObscured,
                      decoration: InputDecoration(
                        labelText: "New Password",
                        suffixIcon: IconButton(
                          icon: Icon(_isObscured
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _resetPassword,
                      child: Text("Reset Password"),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
