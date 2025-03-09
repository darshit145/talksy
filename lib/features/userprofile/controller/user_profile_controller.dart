import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy/main.dart';
import 'package:talksy/util/app_constantSP.dart';
import 'package:talksy/util/string_const.dart';

import '../../auth/domain/model/model.dart';

class UserProfileController extends ChangeNotifier{
  final SharedPreferences sp;
  UserProfileController({required this.sp});
  Future<void> logOutAction()async{
    ///Clear All The Shared Preferances
    ///API logout
    sp.setString(AppConstSP.loginUserTocken, "null");
    sp.setBool(AppConstSP.loginStatus,true);
    final AuthService authService = AuthService();
    authService.logOut();
    REMAINTODO();
  }
}