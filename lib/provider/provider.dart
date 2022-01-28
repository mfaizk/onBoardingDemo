import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject/helper/AuthHelper.dart';

final authprovider = ChangeNotifierProvider<AuthHelper>((ref) {
  return AuthHelper();
});
