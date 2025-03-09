import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talksy/component/dev.dart';
import 'package:talksy/features/home/widget/custom_tile.dart';
import 'package:talksy/features/home/widget/story_view.dart';
import 'package:talksy/features/userprofile/screen/user_profile.dart';
import 'package:talksy/util/color_const.dart';
import 'package:talksy/util/font_family.dart';
import 'package:talksy/util/images.dart';
import 'package:talksy/util/string_const.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import "package:http/http.dart" as http;

import '../controller/home_page_controller.dart';

class HomePage extends StatelessWidget {
 final FocusNode focusNode=FocusNode();
 TextEditingController textEditingController=TextEditingController();

    HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => context.read<HomePageController>().listAllUser(),);
    // focusNode.unfocus();
    return GestureDetector(
      onTap: () {
        textEditingController.clear();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorConst.getWhite(context),
        floatingActionButton:FloatingActionButton(onPressed: ()async {
           http.get(Uri.parse(StringConst.listAllUser)).then((value) {
             print(value.statusCode);
             print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${value.body}");
           },);
          getFCMToken();

          print(generateChatTableName("dfachara10"," dfachara1"));
        },),
        appBar: AppBar(
          backgroundColor: ColorConst.getWhite(context),
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: SafeArea(
            child: Text(
              StringConst.appName,
              style: TextStyle(
                  fontFamily: FontFamily.schyler,
                  color: ColorConst.getBlack(context),
                  fontSize: 20),
            ),
          ),
          bottom: PreferredSize(
              preferredSize: Size(double.infinity, 10),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              )),
          actions: [
            Text(
              "Online",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: FontFamily.robotoSimple,
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile(),));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Color(0xFFD1D5DB),
                  radius: 17,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 5,
              children: [
                Consumer<HomePageController>(
                  builder:(context, value, child) =>  CupertinoSearchTextField(
                    focusNode: focusNode,
                    controller: textEditingController,
                    onChanged: (val) {
                      value.searchUser(val);
                    },
                    itemColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                // StoryView(),

                Consumer<HomePageController>(builder: (context, value, child) => ListView.separated(
                  padding: EdgeInsets.all(0),

                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 2,
                      child: Divider(
                        color: ColorConst.getDeviderColor(context),
                        thickness: 1,
                      ),
                    );
                  },
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {

                    return CustomTile(
                      photoUrl: value.listOfUsers.result[index].uPhoto,
                      subTitleText:value.listOfUsers.result[index].uEmail ,
                      titleText: value.listOfUsers.result[index].uName,
                    );
                  },itemCount: value.listOfUsers.result.length,),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
String generateChatTableName(String userId1, String userId2) {
  List<String> sortedIds = [userId1, userId2]..sort();
  return "${sortedIds[0]}_${sortedIds[1]}"; // Example: dfachara7_dfachara10
}
Future<void> getFCMToken() async {
  try {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken(); // Get FCM token
    if (token != null) {
      print("FCM Token: $token");
    } else {
      print("Failed to get FCM token");
    }
  } catch (e) {
    print("Error getting FCM token: $e");
  }
}