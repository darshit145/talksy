import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy/util/app_constantSP.dart';

class ThemeController extends ChangeNotifier{
  SharedPreferences sp;
  ThemeController({required this.sp});

  bool isDarkMod=false;

  bool isDarkModTheme(){
    isDarkMod=sp.getBool(AppConstSP.themeSP)??false;
    // notifyListeners();
    return isDarkMod;
  }
  bool get getThemeMod=>isDarkMod;

  void toggleTheme(){
    isDarkMod=!isDarkMod;
    sp.setBool(AppConstSP.themeSP, isDarkMod);
    notifyListeners();
  }


}
