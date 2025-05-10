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
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      Timer(const Duration(seconds: 2), () {
        Get.off(() => MainScreen());
      });
    } else {
      Timer(const Duration(seconds: 2), () {
        Get.off(() => const SignupScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
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
