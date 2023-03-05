import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackhound/facemesh/face.dart';
import 'package:hackhound/flobal_variables.dart';
import 'package:lottie/lottie.dart';

class HomePage_FaceMesh extends StatefulWidget {
  const HomePage_FaceMesh({Key? key}) : super(key: key);

  @override
  State<HomePage_FaceMesh> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage_FaceMesh> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 65,
        ),
        Text(
          "Playtopia Stream",
          style: GoogleFonts.secularOne(textStyle: boldstyle, fontSize: 45),
        ),
        SizedBox(
          height: 10,
        ),
        Lottie.network(
          "https://assets8.lottiefiles.com/packages/lf20_ddgteomo.json",
        ),
        SizedBox(
          height: 60,
          width: 200,
          child: SafeArea(
            child: Center(
                child: ElevatedButton(
              onPressed: () async {
                await availableCameras().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CameraPage(cameras: value))));
              },
              child: const Text("Start Streaming"),
            )),
          ),
        ),
      ],
    );
  }
}
