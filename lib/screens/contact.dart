import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';
import 'package:hackhound/screens/homepage.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.teal,
          elevation: 2.0,
          centerTitle: true,
          title: Text(
            "Contact Us",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ),
        backgroundColor: Colors.teal,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ContactUs(
            textColor: Colors.teal,
            companyColor: Colors.white,
            cardColor: Colors.white,
            taglineColor: Colors.white,
            logo: AssetImage(''),
            email: 'mridulsrivastava6969@gmail.com',
            companyName: 'Entech',
            phoneNumber: '+919793711706',
            dividerThickness: 2,
            website: 'https://deft-klepon-fbee7c.netlify.app/',
            tagLine: 'Developers',
          ),
        ),
      ),
    );
  }
}
