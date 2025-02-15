import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talksy/component/bordr_button.dart';
import 'package:talksy/component/material_button.dart';
import 'package:talksy/component/universal_appbar_view.dart';
import 'package:talksy/util/font_family.dart';
import 'package:talksy/util/images.dart';
import 'package:talksy/util/string_const.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: UniversalAppbarView.getAppBar(title: "Welcome", subTitle: "Choose how you want to continue"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 20,
              children: [
                SizedBox(
                  height: 53,
                  width: double.infinity,
                  child: MaterialButtonView(
                    text: "Sign up",
                    callbackAction: () {
                      Navigator.pushNamed(context, StringConst.routRegistraationScreen);
                    },
                  ),
                ),
                BordrButton(
                  btnChild: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  spacing: 5,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      "Or continue with",
                      style: TextStyle(color: Color(0xFF6B7280)),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                BordrButton(
                  btnChild:BordrButton.googleLoginButton(),
                  borderColor: Color(0xFFD1D5DB),
                ),

                Text.rich(
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12,color: Color(0xFF6B7280)),
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "By continuing, you agree to our ",
                      ),
                      TextSpan(
                        text: "Terms of Service",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                        )
                      ),
                      TextSpan(
                        text: " and ",
                      ),
                      TextSpan(
                        text: " Privacy Policy ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                          )
                      ),
                    ],
                  ),
                )


              ],
            ),
          )
        ],
      ),
    );
  }
}
