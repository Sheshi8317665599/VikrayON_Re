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
  // final AuthController authController = Get.find<AuthController>();
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
              Image.asset("assets/icons/signin_balls.png"),
              SizedBox(
                height: height * 0.02,
              ),
              Column(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/icons/VikrayON_Text_Logo.png",
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
                    onTap: () {},
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
