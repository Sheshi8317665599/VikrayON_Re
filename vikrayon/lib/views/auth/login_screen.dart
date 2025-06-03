import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/auth/signup_screen.dart';
import 'package:vikrayon/views/auth/widgets_auth/login_feild.dart';
import 'package:vikrayon/views/auth/widgets_auth/social_button.dart';
import 'package:vikrayon/views/auth/widgets_auth/sudmit_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final AuthController authController = Get.find<AuthController>();
  final LoginControler loginControler = Get.put(LoginControler());
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Authcolors.backgrounColor,
      body: Form(
        key: _fromKey,
        child: SingleChildScrollView(
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
                    "Log In",
                    style: TextStyle(
                      color: Authcolors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.09,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SocialButton(
                iconPath: "assets/icons/svgs/g_logo.svg",
                label: "Continue with Google",
                horizontalPadding: 15,
                verticalPadding: 5,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'or',
                style: TextStyle(
                    color: Authcolors.whiteColor, fontSize: width * 0.04),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              // email feild
              LoginFeild(
                hintText: "Email",
                controller: loginControler.emailController,
                keyboardType: TextInputType.emailAddress,
                suffixIcon: null,
                prefixIcon: Icon(Icons.email_outlined,
                    size: width * 0.050, color: Authcolors.whiteColor),
                obscureText: false,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.!#$%&'*|+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+")
                          .hasMatch(value)) {
                    Get.snackbar(
                      "Error",
                      "Please enter a valid email address",
                      backgroundColor: Authcolors.whiteColor,
                      colorText: Authcolors.backgrounColor,
                      duration: Duration(seconds: 2),
                    );
                    return "Please enter a valid email address";
                  }
                  return null;
                },
                hintStyle: TextStyle(
                    color: Authcolors.whiteColor, fontSize: width * 0.050),
              ),

              SizedBox(
                height: height * 0.015,
              ),
              // password feild
              Obx(
                () => LoginFeild(
                  hintText: "Password",
                  controller: loginControler.passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      loginControler.isPasswordVisible.value =
                          !loginControler.isPasswordVisible.value;
                    },
                    icon: Icon(
                      loginControler.isPasswordVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: width * 0.050,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Authcolors.whiteColor,
                    size: width * 0.050,
                  ),
                  obscureText: loginControler.isPasswordVisible.value,
                  validator: (value) {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                    if (value!.isEmpty) {
                      return "Please enter password";
                    } else {
                      if (!regex.hasMatch(value)) {
                        return "Enter a valid password";
                      } else {
                        return null;
                      }
                    }
                  },
                  hintStyle: TextStyle(
                    color: Authcolors.whiteColor,
                    fontSize: width * 0.050,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.010,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => SignupScreen());
                    },
                    child: Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(
                        color: Authcolors.whiteColor,
                        fontSize: width * 0.045,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.010,
                  ),
                  SudmitButton(
                      onPressed: () async {
                        if (_fromKey.currentState!.validate()) {
                          await loginControler.login();
                        }
                      },
                      text: "Log In"),
                  InkWell(
                    onTap: () {
                      Get.to(() => ForgotPassword());
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Authcolors.whiteColor,
                        fontSize: width * 0.045,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final ForgotPasswordController controller =
      Get.put(ForgotPasswordController());
  final _fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Authcolors.backgrounColor,
        body: Form(
          key: _fromkey,
          child: SingleChildScrollView(
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
                      "Forgot Password",
                      style: TextStyle(
                        color: Authcolors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.07,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: height * 0.02,
                ),
                // email feild
                Obx(
                  () => LoginFeild(
                    hintText: "Password",
                    controller: controller.newPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.isPasswordVisible.value =
                            !controller.isPasswordVisible.value;
                      },
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: width * 0.050,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Authcolors.whiteColor,
                      size: width * 0.050,
                    ),
                    obscureText: controller.isPasswordVisible.value,
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      } else {
                        if (!regex.hasMatch(value)) {
                          return "Enter a valid password";
                        }
                      }
                      return null;
                    },
                    hintStyle: TextStyle(
                      color: Authcolors.whiteColor,
                      fontSize: width * 0.050,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                // confirm password feild
                Obx(
                  () => LoginFeild(
                    hintText: "Confirm Password",
                    controller: controller.confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.isPasswordVisible.value =
                            !controller.isPasswordVisible.value;
                      },
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: width * 0.050,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Authcolors.whiteColor,
                      size: width * 0.050,
                    ),
                    obscureText: controller.isPasswordVisible.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      } else {
                        if (value != controller.newPasswordController.text) {
                          return "Password does not match";
                        }
                      }
                      return null;
                    },
                    hintStyle: TextStyle(
                      color: Authcolors.whiteColor,
                      fontSize: width * 0.045,
                    ),
                  ),
                ),
                SudmitButton(
                    onPressed: () async {
                      if (_fromkey.currentState!.validate()) {
                        await controller.resetPassword();
                      }
                    },
                    text: "Send OTP"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final ForgotPasswordController controller =
      Get.put(ForgotPasswordController());
  final _fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Authcolors.backgrounColor,
        body: Form(
          key: _fromkey,
          child: SingleChildScrollView(
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
                      "Forgot Password",
                      style: TextStyle(
                        color: Authcolors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.07,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: height * 0.02,
                ),
                // email feild
                LoginFeild(
                  hintText: "Email",
                  controller: controller.emailControllers,
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: null,
                  prefixIcon: Icon(Icons.email_outlined,
                      size: width * 0.050, color: Authcolors.whiteColor),
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.!#$%&'*|+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+")
                            .hasMatch(value)) {
                      Get.snackbar(
                        "Error",
                        "Please enter a valid email address",
                        backgroundColor: Authcolors.whiteColor,
                        colorText: Authcolors.backgrounColor,
                        duration: Duration(seconds: 2),
                      );
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                  hintStyle: TextStyle(
                      color: Authcolors.whiteColor, fontSize: width * 0.050),
                ),
                SudmitButton(
                    onPressed: () async {
                      if (_fromkey.currentState!.validate()) {
                        await controller.sendOtp();
                      }
                    },
                    text: "Validate OTP"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreen();
}

class _OtpScreen extends State<OtpScreen> {
  final ForgotPasswordController controller =
      Get.put(ForgotPasswordController());

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
                    "Otp Verification",
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
                    'Please enter the OTP sent to your Email id ${hideEmail(controller.emailControllers.text.trim())}',
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
                    controller: controller.otpController,
                    keyboardType: TextInputType.number,
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.otpController.clear();
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
                    if (controller.canResendOtp.value) {
                      return TextButton(
                        onPressed: () {
                          controller.resendForgotOtp();
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
                        "You can resend OTP after ${controller.otpCountdown.value} seconds",
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

                  SizedBox(
                    height: height * 0.02,
                  ),

                  // conformed button

                  SudmitButton(
                    text: "Conform",
                    onPressed: () {
                      controller.resetPassword();
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
