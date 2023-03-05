import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackhound/profile/profile/edit%20profile/user_prefs.dart';
import 'package:hackhound/profile/profile/profile.dart';

import 'package:hackhound/screens/homepage.dart';
import 'package:hackhound/screens/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  var pass = prefs.getString('email');

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: email == null && pass == null ? SignInScreen() : HomePage(),
    ),
  );
}
