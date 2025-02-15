import 'package:flutter/cupertino.dart';
import 'package:talksy/features/intro/screen/intro_screen.dart';
import 'package:talksy/util/string_const.dart';

import '../features/auth/screen/login_screen.dart';
import '../features/auth/screen/registraation_screen.dart';

Map<String, WidgetBuilder> routes = {
  StringConst.routIntroScreen: (context) => IntroScreen(),
  StringConst.routAuthScreen: (context) => LoginScreen(),
  StringConst.routRegistraationScreen: (context) => RegistraationScreen(),
};
