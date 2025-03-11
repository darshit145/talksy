import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy/features/auth/domain/services/auth_services_interface.dart';
import 'package:talksy/features/auth/screen/login_screen.dart';
import 'package:talksy/features/home/screen/home_page.dart';

import '../../../util/app_constantSP.dart';
import '../../../util/string_const.dart';
import '../domain/model/model.dart';

class AuthController extends ChangeNotifier{
  final AuthServicesInterface authServicesInterface;
  final SharedPreferences sp;
  AuthController({required this.sp,required this.authServicesInterface});
  TextEditingController controllerForMail=TextEditingController();
  TextEditingController controllerForName=TextEditingController();
  TextEditingController controllerForPass=TextEditingController();
  TextEditingController controllerForRePass=TextEditingController();
  TextEditingController controllerForMobileNo=TextEditingController();



  Future<void> loginViaGmail(BuildContext context)async{
    // PermitionHandler;
    if (await Permission.notification.request().isGranted) {
      String notification=await getFCMToken();
      // Either the permission was already granted before or the user just granted it.
      final AuthService authService = AuthService();
      await authService.logOut();
      final UserCredential? userCredential = await authService.signInWithGoogle();
      if (userCredential != null) {
        ///Make API CALL GET The DATA Store it IN LOCAL device GO to the Home Page
        ///API request [USER name,email,image]
        ///IN API request 1 cheack that USER alread EXist or not
        ///Set the SharedPreferances NO LOGIN screen
        //THis Becomes True When The Api Response Get Success
        if(userCredential.user==null){
          showCupertinoSnackbar("Please try Another Email");
          return;
        }
        sp.setString(AppConstSP.uaerEmail,userCredential.user!.email.toString());
        Map<String,dynamic> userCreadintial={
          "u_name": userCredential.user!.displayName,
          "u_email": userCredential.user!.email,
          "u_photo": userCredential.user!.photoURL??"https://cdn-icons-png.flaticon.com/512/1173/1173817.png",
          "u_messaging":notification
        };

        authServicesInterface.loginViaGmail(jsonEncode(userCreadintial)).then((value) {
          if(value==StringConst.ERROR){
            showCupertinoSnackbar("Cheack Your Internet Connection \nPlease Try Again Later");
          }else{
            var map=jsonDecode(value);
            sp.setString(AppConstSP.loginUserTocken,map["message"]);
            rout(context);
          }
        },
        );

      } else {
        showCupertinoSnackbar("Cheack Your Internet Connection\nPlease Try Again Later");
      }
    }else{
      showCupertinoSnackbar("Go to setting app info and turn on notification.");
    }
  }
  void rout(BuildContext context){
    sp.setBool(AppConstSP.loginStatus,false);
    Navigator.pushReplacementNamed(context, StringConst.routHomePage);
  }
}