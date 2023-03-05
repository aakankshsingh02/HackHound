import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:contactus/contactus.dart';
import '../flobal_variables.dart';

class GFX_detail extends StatefulWidget {
  final DocumentSnapshot product;
  GFX_detail({required this.product});

  @override
  State<GFX_detail> createState() => _GFX_detailState();
}

class _GFX_detailState extends State<GFX_detail> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: kmaincolor,
        title: Text("Playtopia",
            style: GoogleFonts.josefinSans(textStyle: boldstyle)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image(image: NetworkImage(widget.product['image'])),
            ),
            //bottomArrow(context),
            scroll(),
          ],
        ),
      ),
    ));
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  color: Color(0xFFEDECF2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: 35,
                            color: kmaincolor,
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(widget.product['name'],
                            style:
                                GoogleFonts.josefinSans(textStyle: boldstyle)),
                                SizedBox(
                          width: 182,
                        ),
                        Icon(
                          Icons.stars_rounded,
                          size: 24,
                          color: kmaincolor,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(widget.product['rating'],
                            style: GoogleFonts.secularOne(
                                textStyle: softnormal, color: Colors.black)),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 6,
                      ),
                    ),
                    Text("About Me",
                        style: GoogleFonts.josefinSans(textStyle: softbold, fontSize: 21)),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(widget.product['about'],
                          style:
                              GoogleFonts.josefinSans(textStyle: normalstyle)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 4,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Contact Me",
                        style: GoogleFonts.josefinSans(textStyle: softbold, fontSize: 21)),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Phone Number: " + widget.product['number'],
                          style:
                              GoogleFonts.josefinSans(textStyle: normalstyle)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Email: " + widget.product['email'],
                          style:
                              GoogleFonts.josefinSans(textStyle: normalstyle)),
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ]),
            ),
          );
        });
  }
}
