import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy/util/app_constant.dart';

class ThemeController extends ChangeNotifier{
  SharedPreferences sp;
  ThemeController({required this.sp});

  bool isDarkMod=false;

  bool isDarkModTheme(){
    isDarkMod=sp.getBool(AppConst.themeSP)??false;
    // notifyListeners();
    return isDarkMod;
  }

  void toggleTheme(){
    isDarkMod=!isDarkMod;
    sp.setBool(AppConst.themeSP, isDarkMod);
    notifyListeners();
  }


}
