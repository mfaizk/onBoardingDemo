import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:testproject/helper/AuthHelper.dart';
import 'package:testproject/helper/location_helper.dart';

final authprovider = ChangeNotifierProvider<AuthHelper>((ref) {
  return AuthHelper();
});

final locationprovider = FutureProvider<Position>((ref) {
  return determinePosition();
});
