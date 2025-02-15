import 'package:flutter/cupertino.dart';

import '../../../util/string_const.dart';

class SplashScreenController extends ChangeNotifier{
  Future<void> splashScreen({required BuildContext context})async{
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacementNamed(context, StringConst.routIntroScreen);
  }


}