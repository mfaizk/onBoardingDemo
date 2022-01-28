import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
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
    return Container(
      color: const Color(0xffffb234),
      child: Consumer(
        builder: (context, ref, child) {
          AuthHelper authHelper = ref.watch(authprovider);
          AsyncValue<Position> curPosition = ref.watch(locationprovider);

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    direction: Axis.vertical,
                    children: [
                      Text("Name of user is :" + authHelper.name.toString()),
                      const Padding(
                        padding: EdgeInsets.only(
                          bottom: 10,
                        ),
                      ),
                      Text(
                          "EmailID of user is :" + authHelper.email.toString()),
                      Text("Location of user is :" +
                          curPosition.value.toString()),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 50,
                ),
              ),
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  authHelper.signout();
                },
                child: const Text(
                  'signout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
