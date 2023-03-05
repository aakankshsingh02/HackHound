//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackhound/profile/profile/edit%20profile/user_model.dart';

final boldstyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
final normalstyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
final bold = TextStyle(fontSize: 24, fontWeight: FontWeight.w900);

final softbold = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
final softnormal = TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
const maincolor = Color.fromARGB(255, 249, 249, 249);
const kmaincolor = Color(0xFF1f1545);
const double defaultPadding = 16.0;
const themecolor = Color.fromARGB(237, 35, 18, 6);
Widget buildName(User user) => Column(
      children: [
        Text(user.name, style: GoogleFonts.josefinSans(textStyle: boldstyle)),
        const SizedBox(height: 4),
        Text(user.email,
            style: GoogleFonts.josefinSans(
                textStyle: softnormal, color: Colors.black, fontSize: 20))
      ],
    );
