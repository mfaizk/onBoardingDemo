import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/ui/home_page.dart';
import 'package:testproject/ui/onboarding_page.dart';
import 'package:testproject/ui/signIn_page.dart';
import 'package:testproject/ui/signup_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (context) => const HomePage());
      case '/signinPage':
        return CupertinoPageRoute(builder: (context) => const SigninPage());
      case '/signupPage':
        return CupertinoPageRoute(builder: (context) => const SignupPage());

      case '/onboardingPage':
        return CupertinoPageRoute(builder: (context) => const OnBoardingPage());

      default:
        return CupertinoPageRoute(builder: (context) => const HomePage());
    }
  }
}
