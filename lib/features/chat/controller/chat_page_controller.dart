import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../videocall/controller/video_screen_controller.dart';
import 'package:http/http.dart' as http;

import '../domain/model/database_helper.dart';
import '../domain/model/model.dart';
class ChatPageController extends ChangeNotifier{
  TextEditingController textEditingController = TextEditingController();

  Future<void> sendNotification(String tableName,String sender,String sanderName,String reciverTCK)async{
    DatabaseHelper2 databaseHelper2=DatabaseHelper2.instance;
    Topic topic=Topic(reciverId: "", senderId:sender, message:textEditingController.text.toString(), time:"${DateTime.now().hour}:${DateTime.now().minute}");
    databaseHelper2.insert(tableName,topic.toMap());
    String msg=textEditingController.text.trim().toString();
    await Future.delayed(Duration(seconds: 5));
    String token = await getKey();
    var r= await http.post(
      Uri.parse(
          'https://fcm.googleapis.com/v1/projects/talksy-d8e7f/messages:send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        "message": {
          "token":
          reciverTCK,
          "notification": {
            "body": 'you have a message from $sanderName',
            "title": 'Message',
          },
          "data": {"msg": msg,"sanderName":sanderName}
        }
      }),
    );
    textEditingController.clear();
    print(r.body);
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  }

}