import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackhound/VFX%20and%20GFX/gfx.dart';
import 'package:hackhound/flobal_variables.dart';
import 'package:lottie/lottie.dart';

class VFX_GFX extends StatefulWidget {
  const VFX_GFX({super.key});

  @override
  State<VFX_GFX> createState() => _VFX_GFXState();
}

class _VFX_GFXState extends State<VFX_GFX> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {});
    Future.delayed(Duration(milliseconds: 1000), () {});
    // Future.delayed(Duration(milliseconds: 1500), () {
    //   setState(() {
    //     _opacity = 1.0;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kmaincolor,
        title: Text(
          "Playtopia",
          style: GoogleFonts.secularOne(textStyle: softbold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(
              delay: Duration(milliseconds: 500),
              child: SizedBox(
                height: 200,
                child: Lottie.network(
                    "https://assets2.lottiefiles.com/datafiles/qv6UAmxdn2gUuuQ/data.json"),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            FadeInDown(
                delay: Duration(milliseconds: 800),
                //opacity: _opacity,
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: kmaincolor),
                    child: Text("GFX"),
                    onPressed: () { Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    GFX()));},
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            FadeInDown(
                duration: Duration(milliseconds: 1000),
                //opacity: _opacity,
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: kmaincolor),
                    child: Text("VFX"),
                    onPressed: () { Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    GFX()));},
                  ),
                )),
            // AnimatedOpacity(
            //   duration: Duration(milliseconds: 1500),
            //   opacity: _opacity,
            //   child: Text(
            //     'Third line',
            //     style: TextStyle(fontSize: 24.0),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
