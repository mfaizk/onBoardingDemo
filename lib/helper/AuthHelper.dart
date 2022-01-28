import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper extends ChangeNotifier {
  bool authStatus = false;
  String? statusMessage;

  AuthHelper() {
    initialAuthChecker();
  }

  initialAuthChecker() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool('isSignedIn') == true) {
      authStatus = true;
      print('true');
      notifyListeners();
    }
  }

  signInWithUserNameAndPassWord(String email, String passWord) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (email == preferences.getString("emailID") &&
        passWord == preferences.getString("pass")) {
      authStatus = true;
      statusMessage = "Logged In";

      preferences.setBool('isSignedIn', true);
      print('Logged In');

      notifyListeners();
    } else {
      authStatus = false;
      statusMessage = "Unable to login";
      print('unable to login');
      notifyListeners();
    }
  }

  signUpWithNameAndPassword(String email, String passWord, String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("emailID", email).whenComplete(() {
      preferences.setString('name', name);
      preferences.setString("pass", passWord).whenComplete(() {
        authStatus = true;
        preferences.setBool('isSignedIn', true);

        statusMessage = "Sign Up Sucessfull";
        notifyListeners();
      });
    });
  }

  signout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('isSignedIn', false);
    authStatus = false;
    notifyListeners();
  }
}
