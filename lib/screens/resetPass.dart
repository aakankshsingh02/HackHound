import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import "package:hackhound/reusable/reusable_wid.dart";
import '../utils/colors.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Reset Password",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
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
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  reusable("Enter Email", CupertinoIcons.mail_solid, false,
                      _emailController),
                  SizedBox(
                    height: 20,
                  ),
                  firebaseButton(context, "Reset Password", () {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: _emailController.text)
                        .then((value) => Navigator.of(context).pop());
                  })
                ],
              ),
            ),
          ),
        ));
  }
}
