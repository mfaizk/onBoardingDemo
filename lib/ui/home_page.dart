import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject/helper/AuthHelper.dart';
import 'package:testproject/provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        AuthHelper authHelper = ref.watch(authprovider);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.red,
              onPressed: () {
                authHelper.signout();
              },
              child: const Text(
                'signout',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        );
      },
    );
  }
}
