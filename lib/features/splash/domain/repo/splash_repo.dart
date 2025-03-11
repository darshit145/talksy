import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy/features/splash/domain/repo/splash_repo_interface.dart';
import 'package:http/http.dart' as http;
import 'package:talksy/util/app_constantSP.dart';
import 'package:talksy/util/string_const.dart';
class SplashRepo extends SplashRepoInterface{
  @override
  Future<String> getConfig() async{
    print("dsf");
    SharedPreferences sp=await SharedPreferences.getInstance();
    String userTocken= sp.getString(AppConstSP.loginUserTocken)??"null";
    if(userTocken=="null"){
      return StringConst.ERROR;
    }
    var responce=await http.get(Uri.parse(StringConst.baseUrl+"api/user/$userTocken"));
    return responce.body;
  }

}