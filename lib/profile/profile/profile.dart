import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../../flobal_variables.dart';
import 'edit profile/editprofile.dart';
import 'edit profile/profile_widger.dart';
import 'edit profile/user_model.dart';
import 'edit profile/user_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackhound/VFX%20and%20GFX/landing_page.dart';
import 'package:hackhound/profile/profile/profile.dart';
import 'package:hackhound/screens/contact.dart';
import 'package:hackhound/screens/feedback.dart';
import 'package:hackhound/screens/play.dart';
import 'package:hackhound/screens/privacypolicy.dart';
import 'package:hackhound/screens/resetPass.dart';
import 'package:hackhound/screens/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            //color: themecolor,
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 8, left: 8),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                  setState(() {});
                },
              ),
              SizedBox(
                height: 24,
              ),
              buildName(user),
              const SizedBox(height: 24),
              Card(
                elevation: 10,
                shadowColor: Colors.blue.shade400,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.transparent,
                    width: 6,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 5)),
                    Text(
                      "Playtoria Amenities",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ListTile(
                      title: const Text('GFX-VFX'),
                      leading: Icon(CupertinoIcons.play_rectangle,
                          color: Colors.black),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => VFX_GFX()));
                      },
                    ),
                    ListTile(
                      title: const Text('Play Zones'),
                      leading: Icon(CupertinoIcons.play_rectangle,
                          color: Colors.black),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayZones()));
                      },
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 10,
                shadowColor: Colors.blue.shade400,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.transparent,
                    width: 6,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 5)),
                    Text(
                      "Playtopia Support",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ListTile(
                      title: const Text('Privacy Policy'),
                      leading: Icon(Icons.policy, color: Colors.black),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HTMLtoWidget()));
                      },
                    ),
                    ListTile(
                      title: const Text('Feedback'),
                      leading:
                          Icon(Icons.feedback_outlined, color: Colors.black),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => feedback()));
                      },
                    ),
                    ListTile(
                      title: const Text('Contact Us'),
                      leading: Icon(CupertinoIcons.chat_bubble_2,
                          color: Colors.black),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Contact()));
                      },
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 10,
                shadowColor: Colors.blue.shade400,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.transparent,
                    width: 6,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 5)),
                    Text(
                      "Settings",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ListTile(
                      onTap: () {
                        // Navigator.of(context)
                        //     .pushReplacementNamed('');
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => ProfilePage()));
                      },
                      leading: const Icon(CupertinoIcons.person,
                          color: Colors.black),
                      title: const Text(
                        'My Profile ',
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        // Navigator.of(context)
                        //     .pushReplacementNamed('');
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => ResetPass()));
                      },
                      leading: const Icon(CupertinoIcons.lock_rotation,
                          color: Colors.black),
                      title: const Text(
                        'Reset Password ',
                      ),
                    ),
                    ListTile(
                      title: const Text('Logout'),
                      leading: Icon(
                        Icons.logout_rounded,
                        color: Colors.black,
                      ),
                      onTap: () async {
                        FirebaseAuth.instance.signOut().then(
                          (value) async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.remove('email');
                            prefs.remove('pass');
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()));
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
