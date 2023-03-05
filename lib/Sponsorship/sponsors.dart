import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackhound/VFX%20and%20GFX/landing_page.dart';
import 'package:hackhound/flobal_variables.dart';

class Sponsors extends StatefulWidget {
  const Sponsors({super.key});

  @override
  State<Sponsors> createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('sponsorship')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot product = snapshot.data!.docs[index];
                    return Card(
                      color: maincolor,
                      elevation: 5,
                      child: Container(
                        height: 205,
                        child: Container(
                            height: 175,
                            //padding: const EdgeInsets.only(left: 5, right: 5),
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            decoration: BoxDecoration(
                              color: maincolor,
                              // Color.fromARGB(255, 196, 192, 211),
                              borderRadius: BorderRadius.circular(40),
                              // boxShadow: [
                              //   BoxShadow(
                              //       blurRadius: 2,
                              //       offset: Offset(0, 0),
                              //       color: Colors.grey.withOpacity(0.2))
                              // ]
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(1),
                              child: Row(children: [
                                Container(
                                  width: 127,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(product['image']),
                                          fit: BoxFit.fill)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 15),
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(
                                        product['name'],
                                        style: GoogleFonts.secularOne(
                                            textStyle: softbold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        child: Text(
                                          product['about'],
                                          //overflow: TextOverflow.ellipsis),
                                        )),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(
                                        "Sponsored: " + product['number'],
                                        style: GoogleFonts.secularOne(
                                            textStyle: softnormal,
                                            color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: kmaincolor),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VFX_GFX()));
                                      },
                                      child: Text("Get Sponsored",
                                          style: GoogleFonts.secularOne(
                                              textStyle: softnormal)),
                                    ),
                                  ],
                                )
                              ]),
                            )),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
