import 'dart:io';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hackhound/profile/profile/edit%20profile/user_model.dart';
import 'package:hackhound/profile/profile/edit%20profile/user_prefs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'profile_widger.dart';
import 'textfield.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            //color: themecolor,
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 103, 222, 243),
                Color.fromARGB(255, 118, 39, 134),
                Color.fromARGB(255, 144, 129, 178),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 180, right: 8, left: 8),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user.imagePath,
                  isEdit: true,
                  onClicked: () async {
                    final image = await ImagePicker()
                        .getImage(source: ImageSource.gallery);

                    if (image == null) return;

                    final directory = await getApplicationDocumentsDirectory();
                    final name = basename(image.path);
                    final imageFile = File('${directory.path}/$name');
                    final newImage =
                        await File(image.path).copy(imageFile.path);

                    setState(() => user = user.copy(imagePath: newImage.path));
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Full Name',
                  text: user.name,
                  onChanged: (name) => user = user.copy(name: name),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: user.email,
                  onChanged: (email) => user = user.copy(email: email),
                ),
                // const SizedBox(height: 24),
                // TextFieldWidget(
                //   label: 'About',
                //   text: user.about,
                //   maxLines: 5,
                //   onChanged: (about) => user = user.copy(about: about),
                // ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1f1545)),
                  child: Text('Save'),
                  // style: ButtonStyle(
                  //   backgroundColor: Colors.red
                  // ),
                  onPressed: () {
                    UserPreferences.setUser(user);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
