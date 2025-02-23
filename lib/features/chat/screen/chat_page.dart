import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talksy/features/auth/widget/custom_text_field.dart';
import 'package:talksy/features/chat/widget/reciver_chat.dart';
import 'package:talksy/features/chat/widget/sender_chat.dart';
import 'package:talksy/features/remoteuser/screen/remote_user.dart';
import 'package:talksy/util/color_const.dart';
import 'package:talksy/util/images.dart';

import '../../../util/font_family.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.getWhite(context),
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: ColorConst.getWhite(context),
        automaticallyImplyLeading: false,
        title: SafeArea(
          child: Text(
            "ChatApp",
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 10,
              children: [
                SvgPicture.asset(
                  Images.videoCallIcon,
                  height: 20,
                  width: 20,
                ),
                SvgPicture.asset(
                  Images.callIcon,
                  height: 20,
                  width: 20,
                ),
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
                    Navigator.push(context,MaterialPageRoute(builder: (context) => RemoteUser(),));
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFD1D5DB),
                    radius: 17,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          spacing: 3,
          children: [
            Expanded(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 5,);
                    },
                                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    return ReciverChat();
                  }
                  return SenderChat();
                                },
                                itemCount: 10,
                              ),
                )),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                        child: MyTextField(
                            obscureText: false,
                            hintText: "Send..",
                            controller: TextEditingController())),
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: ColorConst.getBlack(context),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(Images.sendIcon,
                              color: ColorConst.getWhite(context)),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
