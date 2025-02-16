import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talksy/features/auth/controller/auth_controller.dart';
import 'package:talksy/features/auth/widget/text_field_view.dart';
import 'package:talksy/util/font_family.dart';

import '../../../component/bordr_button.dart';
import '../../../component/material_button.dart';
import '../../../component/universal_appbar_view.dart';
import '../../../util/string_const.dart';
import '../widget/conactivity_cheack.dart';
import '../widget/custom_text_field.dart';

class RegistraationScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  RegistraationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: UniversalAppbarView.getAppBar(
            title: "Register", subTitle: "Create an account to get started"),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Consumer<AuthController>(
                    builder: (context, value, child) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 25,
                      children: [
                        TextFieldView(
                          title: "Full Name",
                          hintText: "Enter your full name",
                          controller: value.controllerForName,
                        ),
                        TextFieldView(
                          title: "Email",
                          hintText: "Enter your email",
                          controller: value.controllerForMail,
                        ),
                        TextFieldView(
                          title: "Password",
                          hintText: "Create a password",
                          controller: value.controllerForPass,
                        ),
                        TextFieldView(
                          title: "Confirm Password",
                          hintText: "Confirm your password",
                          controller: value.controllerForRePass,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.38,
                  child: SafeArea(
                    child: Column(
                      spacing: 10,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 53,
                          width: double.infinity,
                          child: MaterialButtonView(
                            text: "Sign up",
                            callbackAction: ()  {
                              Navigator.pushReplacementNamed(context, StringConst.routMobileAuthScreen);

                            },
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
                          onPressed: ()  {

                          },
                          btnChild: BordrButton.googleLoginButton(),
                          borderColor: Color(0xFFD1D5DB),
                        ),
                        Text.rich(
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account? ",
                              ),
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pop(context);
                                    },
                                  text: "Sign in",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        Text.rich(
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "By signing up, you agree to our ",
                              ),
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(
                                          context,
                                          StringConst
                                              .routTermAndConditionsScreen);
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
                                      Navigator.pushNamed(
                                          context,
                                          StringConst
                                              .routTermAndConditionsScreen);
                                    },
                                  text: " Privacy Policy ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
