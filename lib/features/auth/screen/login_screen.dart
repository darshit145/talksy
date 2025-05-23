import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:talksy/component/bordr_button.dart';
import 'package:talksy/component/material_button.dart';
import 'package:talksy/component/universal_appbar_view.dart';
import 'package:talksy/features/auth/widget/conactivity_cheack.dart';
import 'package:talksy/main.dart';
import 'package:talksy/util/font_family.dart';
import 'package:talksy/util/images.dart';
import 'package:talksy/util/string_const.dart';

import '../controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    REMAINTODO();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: UniversalAppbarView.getAppBar(
          title: "Welcome", subTitle: "Choose how you want to continue"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 20,
              children: [
                // SizedBox(
                //   height: 53,
                //   width: double.infinity,
                //   child: MaterialButtonView(
                //     text: "Sign up",
                //     callbackAction: () {
                //       print("okokokookoko");
                //       Navigator.pushNamed(
                //           context, StringConst.routRegistraationScreen);
                //     },
                //   ),
                // ),
                // BordrButton(
                //   onPressed: () {
                //     Navigator.pushNamed(
                //         context, StringConst.routLoginScreenMail);
                //   },
                //   btnChild: Text(
                //     "Login",
                //     style: TextStyle(
                //       fontFamily: FontFamily.robotoSimple,
                //       color: Colors.black,
                //       fontSize: 14,
                //       fontWeight: FontWeight.w600,
                //     ),
                //   ),
                // ),
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
                  onPressed: () {
                    print("object");
                    context.read<AuthController>().loginViaGmail(context);
                  },
                  btnChild: BordrButton.googleLoginButton(),
                  borderColor: Color(0xFFD1D5DB),
                ),
                Text.rich(
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "By continuing, you agree to our ",
                      ),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context,
                                  StringConst.routTermAndConditionsScreen);
                            },
                          text: "Terms of Service",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      TextSpan(
                        text: " and ",
                      ),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context,
                                  StringConst.routTermAndConditionsScreen);
                            },
                          text: " Privacy Policy ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
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
void showCupertinoSnackbar(String message) {
  final snackbar = CupertinoPopupSurface(
    isSurfacePainted: true,
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        message,
        style: const TextStyle(
            color: Colors.white, fontFamily: FontFamily.robotoSimple),
      ),
    ),
  );

  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: const Duration(seconds: 2),
      content: snackbar,
    ),
  );
}