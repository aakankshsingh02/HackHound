import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 150,
    height: 150,
  );
}

TextField reusable(String text, IconData icon, bool isPassType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPassType,
    enableSuggestions: !isPassType,
    autocorrect: !isPassType,
    cursorColor: Colors.black,
    style: TextStyle(color: Colors.black.withOpacity(0.8)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black,
      ),
      label: Text(text),
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      fillColor: Colors.transparent,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            width: 00,
            style: BorderStyle.solid,
          )),
    ),
    keyboardType:
        isPassType ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}

Container firebaseButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white;
            }
            return Colors.indigo;
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    ),
  );
}

Future addUserData(String email, String firstName, String lastName) async {
  final user = FirebaseAuth.instance.currentUser;
  await FirebaseFirestore.instance.collection('users').doc(user?.uid).set(
    {
      'email': email,
      'First Name': firstName,
      'Last Name': lastName,
    },
  );
}
