import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy/features/auth/domain/services/auth_services.dart';
import 'package:talksy/features/chat/domain/model/database_helper.dart';
import 'package:talksy/features/chat/screen/chat_page.dart';
import 'package:talksy/util/app_constantSP.dart';
import 'package:talksy/util/color_const.dart';
import 'package:talksy/util/font_family.dart';

import '../../../di_container.dart';
import '../../auth/domain/model/model.dart';

class CustomTile extends StatelessWidget {
  final String titleText;
  final String subTitleText;
  final String photoUrl;
  final SharedPreferences sp;
  final String notificationTck;
  const CustomTile(
      {super.key,
      required this.sp,
      required this.notificationTck,
      required this.photoUrl,
      required this.titleText,
      required this.subTitleText});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: ColorConst.getDeviderColor(context),
        onTap: () {
          String email = sp.getString(AppConstSP.uaerEmail) ?? "";
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  sp: sl(),
                  sender: email.split('@')[0],
                  tableName: generateChatTableName(email, subTitleText),
                  // tableName: generateChatTableName("dfachara8", "dfachara8"),
                  reciverTocken: notificationTck,
                ),
              ));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
          child: Row(
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(photoUrl),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      Expanded(
                        child: Text(
                          titleText,
                          style: TextStyle(
                              color: ColorConst.getBlack(context),
                              fontFamily: FontFamily.robotoSimple,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: ColorConst.getBlack(context),
                        child: FittedBox(
                            child: Center(
                                child: Text(
                          "0",
                          style: TextStyle(color: ColorConst.getWhite(context)),
                        ))),
                      ),
                      Text(
                        "Yesterday",
                        style: TextStyle(
                            color: ColorConst.getSecondryWhite(context),
                            fontFamily: FontFamily.robotoSimple,
                            fontSize: 13),
                      )
                    ],
                  ),
                  Text(
                    subTitleText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: ColorConst.getBlack(context),
                        fontFamily: FontFamily.robotoSimple,
                        fontSize: 13),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

String generateChatTableName(String userId1, String userId2) {
  userId1 = userId1.split('@')[0];
  userId2 = userId2.split('@')[0];
  List<String> sortedIds = [userId1, userId2]..sort();
  return "${sortedIds[0]}_${sortedIds[1]}";
}
