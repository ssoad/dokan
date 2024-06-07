import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../common/widgets/custom_icon_button.dart';
import '../common/widgets/custom_text_field.dart';
import '../main_tab/main_tab.dart';
import '../main_tab/tabs/profile_tab.dart';
import '../sign_up/sign_up_screen.dart';
import 'sign_in_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final signInController = Get.put(SignInController());

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 45.w,
                  height: 20.h,
                  child: Image.asset("assets/resources/logo.png")),
              Text(
                "Sign In",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomTextField(
                controller: emailController,
                icons: FontAwesomeIcons.solidEnvelope,
                hint: "Email",
                isPassword: false,
                eyeVisibility: false,
              ),
              CustomTextField(
                controller: passwordController,
                icons: FontAwesomeIcons.lock,
                hint: "Password",
                isPassword: true,
                eyeVisibility: true,
              ),
              Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0),
                  child: TextButton(
                    onPressed: () async {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: const Color(0xFFA4A9AF),
                          fontSize: 12.sp,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal),
                    ),
                  )),
              SizedBox(
                height: 5.h,
              ),
              Container(
                  height: 7.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 3.5.h, vertical: 0),
                  child: CupertinoButton(
                      onPressed: () async {
                        showLoaderDialog(context);

                        String email = emailController.text;
                        String password = passwordController.text;
                        bool emailValid = email.isNotEmpty
                            ? true
                            : false; //RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
                        bool passValid = password.isNotEmpty ? true : false;

                        if (emailValid && passValid) {
                          String? error = await signInController.login(
                              email: email, password: password);

                          if (error != null) {
                            Get.back();
                            Get.defaultDialog(
                                title: "Oops!",
                                middleText: "Email/Password may incorrect!");
                          } else {
                            Get.back();
                            Get.offAll(MainPage());
                          }
                        } else {
                          Get.back();
                          Get.defaultDialog(
                              title: "Oops!", middleText: "Check Information");
                        }
                      },
                      color: const Color(0xFFF75F55),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal),
                      ))),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    icon: Icon(
                      FontAwesomeIcons.facebookF,
                      color: const Color(0xFF3B5998),
                      size: 14.sp,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomIconButton(
                    icon: Icon(
                      FontAwesomeIcons.google,
                      color: const Color(0xFFF14336),
                      size: 14.sp,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              TextButton(
                onPressed: () {
                  Get.offAll(SignUpPage());
                },
                child: Text(
                  "Create New Account",
                  style: TextStyle(
                      color: const Color(0xFF383C40),
                      fontSize: 14.sp,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
