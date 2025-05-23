import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy/features/chat/domain/model/model.dart';
import 'package:talksy/features/home/screen/home_page.dart';
import 'package:talksy/features/videocall/controller/video_screen_controller.dart';
import 'package:talksy/util/app_constantSP.dart';
import 'package:talksy/util/string_const.dart';
import '../../di_container.dart';
import '../../main.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

import '../features/auth/screen/login_screen.dart';
import '../features/chat/domain/model/database_helper.dart';
import '../features/home/widget/custom_tile.dart';


String rooomID="";

class NotificationHandler {

  void checkInitialMessage() async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {

    }
  }

  void initialize() async {
    //This will Check If the app Is opened Via a Notification While the app is Completely closed
    checkInitialMessage();
    // this Will run When the user tap on the Notification if the app is Background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {

    });
    // this wiill runs when the app is open and the messagr recived
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if(message.data.length>1){
        inssertRecodesToDataBase(message);
        return;

      }
      rooomID=message.data["id"];
      print(message.data["id"]);
      SnackBar snackBar=SnackBar(content: GestureDetector(
        onTap: () {
          Get.context!.read<VideoScreenController>().reciveaCall(rooomID);
          Navigator.pushNamed(Get.context!,StringConst.routToVideoCallScreen);
        },
          child: Text(rooomID)));
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
      showCupertinoSnackbar("Cheack Your Internet Connection\nPlease Try Again Later");
      print(">>>>>>>>>>>>>>>>>>>>>>>");
     });
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("from hear we will handel the background MSG");
  if(message.data.length>1){
    inssertRecodesToDataBase(message);
    return;
  }else{
    ///it will be a call
  }
}
Future<void > inssertRecodesToDataBase(RemoteMessage message)async{
  String senderMaill=message.data["sanderName"];
  SharedPreferences sp=await  SharedPreferences.getInstance();
  String reciverEmail=sp.getString(AppConstSP.uaerEmail)??"";
  senderMaill=generateChatTableName(senderMaill,reciverEmail);
  print(senderMaill+">>>>>>>>>>>>>>>>>>>>>>>>");
  DatabaseHelper2 databaseHelper2=DatabaseHelper2.instance;
  DateTime time=DateTime.now();
  Topic topic=Topic(reciverId: reciverEmail, senderId:message.data["sanderName"], message:message.data["msg"], time:"${time.hour}:${time.minute}");
  databaseHelper2.insert(senderMaill, topic.toMap());
  print("object");
}
//zdlZnj2MH1OIe4fjqd8f