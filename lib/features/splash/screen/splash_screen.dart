import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:talksy/component/dev.dart';
import 'package:talksy/util/font_family.dart';
import 'package:talksy/util/images.dart';
import 'package:talksy/util/string_const.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../controller/splash_screen_controller.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<SplashScreenController>().splashScreen(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(Images.splashBackground,fit: BoxFit.fill,),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color(0xFF0189BD)],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                WidgetAnimator(
                  // incomingEffect: WidgetTransitionEffects.defaultDuration(),
                  atRestEffect: WidgetRestingEffects.bounce(),
                  child:  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(Images.appLogo))
                    ),

                  ),
                ),

                Text(StringConst.appName,style: TextStyle(fontFamily: FontFamily.schyler,color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                Text(StringConst.splashTagLine_1,style: TextStyle(fontFamily: FontFamily.roboto,fontSize: 18,color: Colors.white),),
                Text(StringConst.splashTagLine_2,style: TextStyle(fontFamily: FontFamily.roboto,fontSize: 14,color: Colors.white),),

              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
              child: SafeArea(child: Text("Version 1.0.0",style: TextStyle(color: Colors.white),),),)
        ],
      ),
    );
  }
}
