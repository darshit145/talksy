import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talksy/component/dev.dart';
import 'package:talksy/features/home/widget/custom_tile.dart';
import 'package:talksy/features/userprofile/screen/user_profile.dart';
import 'package:talksy/util/color_const.dart';
import 'package:talksy/util/font_family.dart';
import 'package:talksy/util/images.dart';
import 'package:talksy/util/string_const.dart';

class HomePage extends StatelessWidget {
 final FocusNode focusNode=FocusNode();
    HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // focusNode.unfocus();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorConst.getWhite(context),
        floatingActionButton: globalFloat(context),
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
                CupertinoSearchTextField(
                  focusNode: focusNode,
                  itemColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                SizedBox(height: 5,),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 28,
                                      backgroundColor: ColorConst.getBlack(context),
                                      child: CircleAvatar(
                                        radius: 26,
                                        backgroundColor: Colors.white,
                                        backgroundImage:
                                            AssetImage(Images.onboarding_3),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: ColorConst.getBlack(context),
                                        child: Center(
                                          child: Icon(Icons.add,size: 15,weight: 10,color: ColorConst.getWhite(context),),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 2),
                                  child: Text(
                                    "Your Story",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: FontFamily.robotoSimple,
                                        color: ColorConst.getBlack(context)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: Color(0xFFD1D5DB),
                              child: CircleAvatar(
                                radius: 26,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(Images.onboarding_3),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Text(
                                  "M.R.Darshit Fachara",
                                  overflow: TextOverflow.fade,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: FontFamily.robotoSimple,
                                      color: ColorConst.getBlack(context)),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: 15,
                    physics: BouncingScrollPhysics(),
                  ),
                ),
                ListView.separated(
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
                  return CustomTile();
                },itemCount: 15,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
