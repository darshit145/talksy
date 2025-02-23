import 'package:flutter/cupertino.dart';
import 'package:talksy/features/home/screen/home_page.dart';
import 'package:talksy/features/intro/screen/intro_screen.dart';
import 'package:talksy/util/string_const.dart';

import '../features/auth/screen/login_screen.dart';
import '../features/auth/screen/login_screen_mail.dart';
import '../features/auth/screen/mobile_auth_screen.dart';
import '../features/auth/screen/registraation_screen.dart';
import '../features/auth/screen/validation/otp_validation_screen.dart';
import '../features/term_and_conditions/screen/term_and_conditions_screen.dart';

Map<String, WidgetBuilder> routes = {
  StringConst.routIntroScreen: (context) => IntroScreen(),
  StringConst.routAuthScreen: (context) => LoginScreen(),
  StringConst.routRegistraationScreen: (context) => RegistraationScreen(),
  StringConst.routTermAndConditionsScreen: (context) => TermAndConditionsScreen(),
  StringConst.routLoginScreenMail: (context) => LoginScreenMail(),
  StringConst.routMobileAuthScreen: (context) => MobileAuthScreen(),
  StringConst.routOtpValidationScreen: (context) => OtpValidationScreen(),
  StringConst.routHomePage: (context) =>  HomePage(),
};
