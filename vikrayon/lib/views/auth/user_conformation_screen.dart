import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/auth/widgets_auth/login_feild.dart';
import 'package:vikrayon/views/auth/widgets_auth/sudmit_button.dart';

class UserConformationScreen extends StatefulWidget {
  const UserConformationScreen({super.key});

  @override
  State<UserConformationScreen> createState() => _UserConformationScreenState();
}

class _UserConformationScreenState extends State<UserConformationScreen> {
  final UserConformationControler userConformationControler =
      Get.find<UserConformationControler>();

  String hideEmail(String email) {
    // Hide the first part of the email
    int atIndex = email.indexOf('@');
    if (atIndex > 2) {
      return '*' * (atIndex + 2) + email.substring(atIndex - 2);
    }
    return email; // Return as is if not enough characters
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Authcolors.backgrounColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/icons/signin_balls (Small).png"),
              SizedBox(
                height: height * 0.02,
              ),
              Column(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/icons/VikrayON_Text_Logo (Small).png",
                      height: height * 0.1,
                      width: width * 0.8,
                    ),
                  ),
                  Text(
                    "User Conformation",
                    style: TextStyle(
                      color: Authcolors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.065,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),

                  Text(
                    'Please enter the OTP sent to your Email id ${hideEmail(userConformationControler.email)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Authcolors.whiteColor, fontSize: width * 0.04),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),

                  // // email otp feild
                  LoginFeild(
                    hintText: "Enter email otp ",
                    controller: userConformationControler.emailotpcontroller,
                    keyboardType: TextInputType.number,
                    suffixIcon: IconButton(
                        onPressed: () {
                          userConformationControler.emailotpcontroller.clear();
                        },
                        icon: Icon(
                          Icons.cancel,
                          size: width * 0.050,
                          color: Authcolors.whiteColor,
                        )),
                    prefixIcon: Icon(
                      Icons.email,
                      size: width * 0.050,
                      color: Authcolors.whiteColor,
                    ),
                    obscureText: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email otp';
                      } else if (value.length != 6) {
                        return 'Please enter valid email 6-digit otp';
                      }
                      return null;
                    },
                    hintStyle: TextStyle(
                      color: Authcolors.whiteColor,
                      fontSize: width * 0.050,
                    ),
                  ),
                  Obx(() {
                    if (userConformationControler.canResendOtp.value) {
                      return TextButton(
                        onPressed: () {
                          userConformationControler.resendOtp();
                        },
                        child: Text(
                          "Resend OTP",
                          style: TextStyle(
                            color: Authcolors.whiteColor,
                            fontSize: width * 0.04,
                          ),
                        ),
                      );
                    } else {
                      return Text(
                        "You can resend OTP after ${userConformationControler.otpCountdown.value} seconds",
                        style: TextStyle(
                          color: Authcolors.whiteColor,
                          fontSize: width * 0.04,
                        ),
                      );
                    }
                  }),
                  SizedBox(
                    height: height * 0.02,
                  ),

                  // phone otp feild
                  // Text(
                  //   'Please enter the OTP sent to your Phone',
                  //   style: TextStyle(
                  //       color: Authcolors.whiteColor, fontSize: width * 0.04),
                  // ),
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  // LoginFeild(
                  //   hintText: "Enter Phone Otp",
                  //   controller: userConformationControler.phoneotpcontroller,
                  //   keyboardType: TextInputType.number,
                  //   suffixIcon: IconButton(
                  //     onPressed: () {
                  //       userConformationControler.phoneotpcontroller.clear();
                  //     },
                  //     icon: Icon(Icons.cancel,
                  //         size: width * 0.050, color: Authcolors.whiteColor),
                  //   ),
                  //   prefixIcon: Icon(
                  //     Icons.phone,
                  //     color: Authcolors.whiteColor,
                  //     size: width * 0.050,
                  //   ),
                  //   obscureText: false,
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return "please enter phone otp";
                  //     } else if (value.length != 6) {
                  //       return "please enter valid 6-digit phone otp";
                  //     }
                  //     return null;
                  //   },
                  //   hintStyle: TextStyle(
                  //       color: Authcolors.whiteColor, fontSize: width * 0.050),
                  // ),

                  SizedBox(
                    height: height * 0.02,
                  ),

                  // conformed button

                  SudmitButton(
                    text: "Conform",
                    onPressed: () {
                      userConformationControler.confirmOtp();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
