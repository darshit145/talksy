import 'dart:convert';

import 'package:talksy/features/auth/domain/repo/auth_repo_interface.dart';
import 'package:http/http.dart' as http;
import 'package:talksy/util/string_const.dart';

class AuthRepo extends AuthRepoInterface {
  @override
  Future<String> loginViaGmail(String jsonEncoded) async {
    var res = await http.post(
        Uri.parse(StringConst.baseUrl + StringConst.loginUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncoded);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return res.body;
    } else {
      return StringConst.ERROR;
    }
  }
}
