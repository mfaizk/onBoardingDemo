import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject/provider/provider.dart';
import 'package:testproject/ui/home_page.dart';
import 'package:testproject/ui/onboarding_page.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(authprovider);

    return value.authStatus == true
        ? const Material(child: HomePage())
        : const Material(child: OnBoardingPage());
  }
}
