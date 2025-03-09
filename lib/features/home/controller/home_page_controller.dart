import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy/util/app_constantSP.dart';
import 'package:talksy/util/string_const.dart';

import '../../auth/screen/login_screen.dart';
import '../domain/model/list_all_user_model.dart';
import '../domain/services/home_services_interface.dart';

class HomePageController extends ChangeNotifier{
  HomeServicesInterface homeServicesInterface;
  final SharedPreferences sp;
  HomePageController({required this.sp,required this.homeServicesInterface});
  ListAllUser listOfUsers=ListAllUser(result: []);
  ListAllUser listAllUserForSearch=ListAllUser(result: []);

  Future<void> listAllUser()async{
    String userId=sp.getString(AppConstSP.loginUserTocken)??"null";
    homeServicesInterface.getAllUser().then((value) {
      if(value==StringConst.ERROR){
        showCupertinoSnackbar("Cheack Your Internet Connection\nPlease Try Again Later");
      }else{
        listOfUsers=listAllUserFromJson(value);
        listAllUserForSearch=listOfUsers;
        if(userId!="null"){
          listOfUsers.result.removeWhere((element) {
            return element.id==userId;
          },);
        }
        notifyListeners();
      }
    },);
  }

  Future<void> searchUser(String query)async{
    if(query==""||query.isEmpty){
      listOfUsers=listAllUserForSearch;
      notifyListeners();
      return;
    }
    print(query);
    listOfUsers=ListAllUser(result: listAllUserForSearch.result.where((element) {
      return element.uName.toLowerCase().contains(query.toLowerCase());
    },).toList());
    notifyListeners();


  }

}