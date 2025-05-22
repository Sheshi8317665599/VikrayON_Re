import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikrayon/main_screen.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/auth/signup_screen.dart';

class MainSplashscreen extends StatefulWidget {
  const MainSplashscreen({super.key});

  @override
  State<MainSplashscreen> createState() => _MainSplashscreenState();
}

class _MainSplashscreenState extends State<MainSplashscreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  void startSplashScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final email = prefs.getString('email') ?? '';
    final userToken = prefs.getString('token') ?? '';
    if (isLoggedIn && (email.isNotEmpty || userToken.isNotEmpty)) {
      Get.offAll(() => MainScreen());
    } else {
      Get.offAll(() => SignupScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/gifs/VOnC ss.gif',
                height: screenheight,
                width: screenwidth,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
