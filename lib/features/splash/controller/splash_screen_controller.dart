import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy/util/app_constantSP.dart';

import '../../../util/string_const.dart';

class SplashScreenController extends ChangeNotifier{
  final SharedPreferences sp;
  SplashScreenController({required this.sp});
  Future<void> splashScreen({required BuildContext context})async{
    ///Cheack Onboarding
    if(sp.getBool(AppConstSP.onBoardingNavigation)??true){
       Navigator.pushReplacementNamed(context, StringConst.routIntroScreen);
      return;
    }else if(sp.getBool(AppConstSP.loginStatus)??true){
     ///Ckeack Login Credential
     ///becomes true When API Responce get True While Login
     Navigator.pushReplacementNamed(context, StringConst.routAuthScreen);
     return;
    }else{
      ///Navigate TO Direct Home Page
      ///Handel The User Get the user Profile
      Navigator.pushReplacementNamed(context, StringConst.routHomePage);
      return;
    }

  }


}