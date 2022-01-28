import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper extends ChangeNotifier {
  bool authStatus = false;
  String? statusMessage;
  String? name;
  String? email;

  AuthHelper() {
    initialAuthChecker();
  }

  initialAuthChecker() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool('isSignedIn') == true) {
      authStatus = true;
      this.name = preferences.getString('name');
      this.email = preferences.getString('emailID');
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
      this.name = preferences.getString('name');
      this.email = preferences.getString('emailID');
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
        this.name = preferences.getString('name');
        this.email = preferences.getString('emailID');
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
