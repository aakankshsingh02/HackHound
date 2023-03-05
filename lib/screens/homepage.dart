import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackhound/Sponsorship/sponsors.dart';
import 'package:hackhound/facemesh/face.dart';
import 'package:hackhound/facemesh/hp.dart';

import 'package:hackhound/flobal_variables.dart';
import 'package:hackhound/profile/profile/profile.dart';
import 'package:hackhound/screens/aimTracker.dart';

import 'package:hackhound/shopping/screens/tabbar/tabbar.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  late String? userId = user!.uid;

  int index = 2;
  final style = TextStyle(color: Colors.black, fontSize: 23);
  final linestyle =
      TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: Duration(milliseconds: 1000),
          backgroundColor: Colors.black,
          height: 55,
          items: [
            Icon(
              Icons.shopping_basket_rounded,
              size: 22,
            ),
            Icon(
              Icons.handshake_outlined,
              size: 22,
            ),
            Icon(
              Icons.home,
              size: 22,
            ),
            Icon(
              Icons.stream_outlined,
              size: 22,
            ),
            Icon(
              CupertinoIcons.bars,
              size: 22,
            ),
          ],
          index: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
        ),
        body: (index == 0)
            ? FRTabbarScreen()
            : (index == 1)
                ? Sponsors()
                : (index == 2)
                    ? Scaffold(
                        body: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 95,
                            ),
                            Text(
                              "Playtopia",
                              style: GoogleFonts.secularOne(
                                  textStyle: boldstyle, fontSize: 45),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Lottie.network(
                              "https://assets6.lottiefiles.com/temp/lf20_Ny9gY0.json",
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              height: 45,
                              width: 127,
                              child: ElevatedButton(
                                onPressed: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AimTracker()));
                                },
                                child: Text(
                                  "Aim Practice",
                                  style: GoogleFonts.secularOne(
                                      textStyle: softnormal,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                    : (index == 3)
                        ? HomePage_FaceMesh()
                        : (index == 4)
                            ? ProfilePage()
                            : Container());
  }
}
