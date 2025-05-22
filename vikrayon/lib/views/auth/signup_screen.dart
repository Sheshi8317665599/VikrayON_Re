import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/auth/login_screen.dart';
import 'package:vikrayon/views/auth/widgets_auth/login_feild.dart';
import 'package:vikrayon/views/auth/widgets_auth/sudmit_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupControler signupControler = Get.put(SignupControler());
  final _fromKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   super.initState();
  //   _checkLoginStatus();
  // }

  // Future<void> _checkLoginStatus() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  //   if (isLoggedIn) {
  //     Get.offAll(() => MainScreen());
  //   }
  // }
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
                    "Sign Up",
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
              // name feild
              LoginFeild(
                hintText: "User Name",
                controller: signupControler.namecontroller,
                keyboardType: TextInputType.text,
                suffixIcon: null,
                prefixIcon: Icon(Icons.person_outline,
                    size: width * 0.050, color: Authcolors.whiteColor),
                obscureText: false,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r"^(?=.*[A-Z])[a-zA-Z0-9._]{3,15}$")
                          .hasMatch(value)) {
                    return "Please enter a valid name(only alphabets and spaces)";
                  }
                  return null;
                },
                hintStyle: TextStyle(
                  color: Authcolors.whiteColor,
                  fontSize: width * 0.050,
                ),
              ),
    
              SizedBox(
                height: height * 0.02,
              ),
              // email feild
              LoginFeild(
                hintText: "Email",
                controller: signupControler.emailcontroller,
                keyboardType: TextInputType.emailAddress,
                suffixIcon: null,
                prefixIcon: Icon(Icons.email_outlined,
                    size: width * 0.050, color: Authcolors.whiteColor),
                obscureText: false,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.!#$%&'*|+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+")
                          .hasMatch(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
                hintStyle: TextStyle(
                  color: Authcolors.whiteColor,
                  fontSize: width * 0.050,
                ),
              ),
    
              SizedBox(
                height: height * 0.015,
              ),
              // password feild
              Obx(
                () => LoginFeild(
                  hintText: "Password",
                  controller: signupControler.passswordcontroller,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      signupControler.isPasswordVisible.value =
                          !signupControler.isPasswordVisible.value;
                    },
                    icon: Icon(
                      signupControler.isPasswordVisible.value
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
                  obscureText: signupControler.isPasswordVisible.value,
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
                  controller: signupControler.confirmpasswordcontroller,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      signupControler.isPasswordVisible.value =
                          !signupControler.isPasswordVisible.value;
                    },
                    icon: Icon(
                      signupControler.isPasswordVisible.value
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
                  obscureText: signupControler.isPasswordVisible.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter password";
                    } else {
                      if (value != signupControler.passswordcontroller.text) {
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
              SizedBox(
                height: height * 0.015,
              ),
              // phone number feild
              LoginFeild(
                hintText: "Country code + Phone Number",
                controller: signupControler.phonenumbercontroller,
                keyboardType: TextInputType.phone,
                suffixIcon: null,
                prefixIcon: Icon(Icons.phone_outlined,
                    size: width * 0.050, color: Authcolors.whiteColor),
                obscureText: false,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r"^\+?[0-9]{10,15}$").hasMatch(value)) {
                    return "Please enter a valid phone number";
                  }
                  return null;
                },
                hintStyle: TextStyle(
                  color: Authcolors.whiteColor,
                  fontSize: width * 0.035,
                ),
              ),
              // sign in text
              Column(
                children: [
                  SizedBox(
                    height: height * 0.015,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    child: Text(
                      "Already have an account? Sign in",
                      style: TextStyle(
                        color: Authcolors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.040,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.015,
              ),
              // signup button
              SudmitButton(
                  onPressed: () {
                    if (_fromKey.currentState!.validate()) {
                      signupControler.signup();
                    }
                  },
                  text: "Sign Up"),
              SizedBox(
                height: height * 0.015,
              ),
              Text(
                "By signing up you agree to our Terms of Service and Privacy Policy",
                style: TextStyle(
                  color: Authcolors.whiteColor,
                  fontSize: width * 0.025,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
