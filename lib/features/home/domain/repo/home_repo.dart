import 'package:http/http.dart'as http;
import 'package:talksy/features/home/domain/repo/home_repo_interface.dart';
import 'package:talksy/util/string_const.dart';

class HomeRepo extends HomeRepoInterface{
  @override
  Future<String> getAllUser() async{
    var res=await http.get(Uri.parse(StringConst.baseUrl+StringConst.listAllUser));
    if(res.statusCode==200){
      return res.body;
    }
    return StringConst.ERROR;
  }

}