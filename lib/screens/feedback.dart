import 'package:flutter/material.dart';
import 'package:hackhound/screens/homepage.dart';

class feedback extends StatefulWidget {
  //const Feedback({Key? key}) : super(key: key);

  @override
  _feedbackState createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  List<bool> isTypeSelected = [false, false, false, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        elevation: 2.0,
        centerTitle: true,
        title: Text(
          "Feedback",
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
      backgroundColor: Colors.white38,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Please select the type of the feedback",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25.0),
            GestureDetector(
              child: buildCheckItem(
                  title: "Login trouble", isSelected: isTypeSelected[0]),
              onTap: () {
                setState(() {
                  isTypeSelected[0] = !isTypeSelected[0];
                });
              },
            ),
            GestureDetector(
              child: buildCheckItem(
                  title: "Phone number related", isSelected: isTypeSelected[1]),
              onTap: () {
                setState(() {
                  isTypeSelected[1] = !isTypeSelected[1];
                });
              },
            ),
            GestureDetector(
              child: buildCheckItem(
                  title: "Personal profile", isSelected: isTypeSelected[2]),
              onTap: () {
                setState(() {
                  isTypeSelected[2] = !isTypeSelected[2];
                });
              },
            ),
            GestureDetector(
              child: buildCheckItem(
                  title: "Other issues", isSelected: isTypeSelected[3]),
              onTap: () {
                setState(() {
                  isTypeSelected[3] = !isTypeSelected[3];
                });
              },
            ),
            GestureDetector(
              child: buildCheckItem(
                  title: "Suggestions", isSelected: isTypeSelected[4]),
              onTap: () {
                setState(() {
                  isTypeSelected[4] = !isTypeSelected[4];
                });
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            buildFeedbackForm(),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  buildFeedbackForm() {
    return Container(
      height: 150,
      child: Stack(
        children: [
          const TextField(
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "Please briefly describe the issue",
              hintStyle: TextStyle(
                fontSize: 13.0,
                color: Colors.white,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCheckItem({required String title, required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.check_circle : Icons.circle,
            color: isSelected ? Colors.blue : Colors.white,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue : Colors.white),
          ),
        ],
      ),
    );
  }
}
