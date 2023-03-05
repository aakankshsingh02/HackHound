import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hackhound/screens/homepage.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../reusable/reusable_wid.dart';
import '../utils/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _passController = TextEditingController();
  TextEditingController _confirmPassController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  bool _obscureText = true;
  bool _obscureText1 = true;
  bool isButtonActive = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [
              hexStringColor("FFFFFF"),
              hexStringColor("FFFFFF"),
            ], radius: 1.2

                // begin: Alignment.topLeft,
                // end: Alignment.bottomLeft,
                ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Icon(
                      CupertinoIcons.arrowtriangle_right_circle,
                      size: 75,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Hello!",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Enter a world limitless gaming possibilities",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //Email Field

                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        prefixIconColor: Colors.black,
                        labelText: "Enter Email",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              width: 00,
                              style: BorderStyle.solid,
                            )),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                                .hasMatch(value)) {
                          return "Please Enter Correct Email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //Password Field

                    TextFormField(
                      controller: _passController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        prefixIcon: Icon(CupertinoIcons.lock_fill),
                        prefixIconColor: Colors.black,
                        labelText: "Enter Password",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              width: 00,
                              style: BorderStyle.solid,
                            )),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value) ||
                            value.length < 6) {
                          return "Password must be 6 digits long";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Confirm Pass
                    TextFormField(
                      controller: _confirmPassController,
                      obscureText: _obscureText1,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText1 = !_obscureText1;
                            });
                          },
                          child: Icon(_obscureText1
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        prefixIcon: Icon(CupertinoIcons.lock_fill),
                        prefixIconColor: Colors.black,
                        labelText: "Confirm Password",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              width: 00,
                              style: BorderStyle.solid,
                            )),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value) ||
                            value.length < 6) {
                          return "Password must be 6 digits long";
                        } else if (value != _passController.text) {
                          return "Password Didn't Match. Try Again!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //Name Field

                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.textformat_abc),
                        prefixIconColor: Colors.black,
                        labelText: "First Name",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              width: 00,
                              style: BorderStyle.solid,
                            )),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          return "Please Enter Correct Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //Last Name Field

                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.textformat_abc),
                        prefixIconColor: Colors.black,
                        labelText: "Last Name",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              width: 00,
                              style: BorderStyle.solid,
                            )),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          return "Please Enter Correct Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    firebaseButton(
                      context,
                      "Sign Up",
                      () {
                        if (_formKey.currentState!.validate()) {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: _emailController.text.trim(),
                            password: _passController.text.trim(),
                          )
                              .then((value) async {
                            print("Created New Account");

                            addUserData(
                              _emailController.text.trim(),
                              _firstNameController.text.trim(),
                              _lastNameController.text.trim(),
                            );
                            SharedPreferences prefs = await SharedPreferences
                                .getInstance(); //Shared Pref
                            prefs.setString(
                                'email', _emailController.toString());
                            prefs.setString('pass', _passController.toString());

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          }).onError((error, stackTrace) {
                            var snackBar =
                                SnackBar(content: Text('Login Failed'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            print('${error.toString()}');
                          });
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
