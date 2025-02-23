import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talksy/util/images.dart';

import '../../../util/color_const.dart';
import '../../../util/font_family.dart';
import '../../../util/string_const.dart';

class UserProfile extends StatelessWidget {
    UserProfile({super.key});
   final List<ProfileModel> profileModel=[
    ProfileModel(title: "Personal Info", imagePath: Images.personIcon),
    ProfileModel(title: "Notifications", imagePath: Images.notificationIcon),
    ProfileModel(title: "Privacy", imagePath: Images.lockIcon),
    ProfileModel(title: "Appearance", imagePath: Images.colorPalletIcon),
    ProfileModel(title: "Help & Support", imagePath: Images.qnaIcon),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.getWhite(context),
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 43,
                backgroundColor: ColorConst.getBlack(context),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFF4B5563),
                ),
              ),
              Text("Alex Johnson",
                style: TextStyle(
                  fontSize: 20,
                  color: ColorConst.getBlack(context),
                  fontFamily: FontFamily.robotoSimple,
                  fontWeight: FontWeight.w600
                ),
              ),
              Text("Product Designer",
                style: TextStyle(
                    fontSize: 14,
                    color: ColorConst.getSecondryWhite(context),
                    fontFamily: FontFamily.robotoSimple,
                    fontWeight: FontWeight.w400
                ),
              )
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => SizedBox(
              height: 2,
              child: Divider(
                color: ColorConst.getDeviderColor(context),
                thickness: 1,
              ),
            ),
            itemCount: profileModel.length,
            itemBuilder: (context, index) => Container(
              height: 50,
              child: ListTile(
                onTap: () {},
                trailing: SvgPicture.string(
                    """<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="none" version="1.1" width="7" height="12.25" viewBox="0 0 7 12.25"><g transform="matrix(1,0,0,-1,0,24.5)"><g><path d="M6.75391,19.00391Q7,18.73047,7,18.375Q7,18.01953,6.75391,17.74609L1.50391,12.496094Q1.23047,12.25,0.875,12.25Q0.519531,12.25,0.246094,12.496094Q0,12.769531,0,13.125Q0,13.48047,0.246094,13.75391L4.89453,18.375L0.246094,22.9961Q0,23.2695,0,23.625Q0,23.9805,0.246094,24.2539Q0.519531,24.5,0.875,24.5Q1.23047,24.5,1.50391,24.2539L6.75391,19.00391Z" fill="#9CA3AF" fill-opacity="1" style="mix-blend-mode:passthrough"/></g></g></svg>""",
                ),
                title: Text(
                  profileModel[index].title,
                  style: TextStyle(
                      fontFamily: FontFamily.robotoSimple,
                      fontSize: 14,
                      color: ColorConst.getBlack(context),
                      fontWeight: FontWeight.w600),
                ),
                horizontalTitleGap: 10,
                leading: SvgPicture.asset(
                  profileModel[index].imagePath,
                  height: 16,
                  color: ColorConst.getBlack(context),
                ),
              ),
            ),
          ),
          SizedBox()
        ],
      ),
    );
  }
}
class ProfileModel{
  String title;
  String imagePath;
  ProfileModel({required this.title,required this.imagePath});
}
