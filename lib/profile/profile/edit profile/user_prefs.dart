import 'dart:convert';

import 'package:hackhound/profile/profile/edit%20profile/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    imagePath:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSE0ipCStQAloHNLYRk430bFOlWLo3_q7TlOw&usqp=CAU',
    name: 'User',
    email: 'user@gmail.com',
    about: '',
    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences?.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences?.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
