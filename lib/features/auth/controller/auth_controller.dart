import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy/features/auth/screen/login_screen.dart';

import '../../../util/app_constantSP.dart';
import '../../../util/string_const.dart';
import '../domain/model/model.dart';

class AuthController extends ChangeNotifier{
  final SharedPreferences sp;
  AuthController({required this.sp});
  TextEditingController controllerForMail=TextEditingController();
  TextEditingController controllerForName=TextEditingController();
  TextEditingController controllerForPass=TextEditingController();
  TextEditingController controllerForRePass=TextEditingController();
  TextEditingController controllerForMobileNo=TextEditingController();



  Future<void> loginViaGmail(BuildContext context)async{
    final AuthService authService = AuthService();
    final UserCredential? userCredential = await authService.signInWithGoogle();
    if (userCredential != null) {
      ///Make API CALL GET The DATA Store it IN LOCAL device GO to the Home Page
      ///API request [USER name,email,image]
      ///IN API request 1 cheack that USER alread EXist or not
      ///Set the SharedPreferances NO LOGIN screen
      //THis Becomes True When The Api Responce Get Sucess
      sp.setBool(AppConstSP.loginStatus,false);
      Navigator.pushReplacementNamed(context, StringConst.routHomePage);
    } else {
      showCupertinoSnackbar("Cheack Your Internet Connection\nPlease Try Again Later");
    }
  }
}