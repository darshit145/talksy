import 'package:flutter/material.dart';
import 'package:talksy/features/chat/screen/chat_page.dart';
import 'package:talksy/util/color_const.dart';
import 'package:talksy/util/font_family.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: ColorConst.getDeviderColor(context),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(),));

        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 6),
          child: Row(
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 24,
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
                          "data",
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
                    "data",
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
