import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackhound/VFX%20and%20GFX/gfx_details.dart';
import 'package:hackhound/flobal_variables.dart';

class GFX extends StatefulWidget {
  const GFX({super.key});

  @override
  State<GFX> createState() => _GFXState();
}

class _GFXState extends State<GFX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('GFX').snapshots(),
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
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GFX_detail(product:product)));
                        },
                        child: Container(
                          height: 150,
                          child: Container(
                              height: 75,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  product['image']),
                                              fit: BoxFit.fill)),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(top: 45),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
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
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.stars_rounded,
                                                size: 24,
                                                color: kmaincolor,
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(product['rating'],
                                                  style: GoogleFonts.secularOne(
                                                      textStyle: softnormal,
                                                      color: Colors.black)),
                                            ],
                                          )
                                        ]),
                                  ]))),
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
