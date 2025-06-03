import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/main_screen.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/auth/login_screen.dart';
import 'package:vikrayon/views/auth/signup_screen.dart';

class SplashController extends GetxController {
  final AuthController authController = Get.find<AuthController>();

  bool _isDisposed = false;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startSplash();
    });
  }

  @override
  void onClose() {
    _isDisposed = true;
    super.onClose();
  }

  void startSplash() async {
    await Future.delayed(Duration(seconds: 2));

    if (_isDisposed) return;

    final route = await authController.getIntialRoute();
    if (_isDisposed) return;
    switch (route) {
      case 'main':
      if(!_isDisposed)  Get.off(() => MainScreen());
        break;
      case 'login':
      if(!_isDisposed)  Get.off(() => LoginScreen());
        break;
      default:
      if(!_isDisposed)  Get.off(() => SignupScreen());
        break;
    }
  }
}

class MainSplashscreen extends StatefulWidget {
  const MainSplashscreen({super.key});

  @override
  State<MainSplashscreen> createState() => _MainSplashscreenState();
}

class _MainSplashscreenState extends State<MainSplashscreen> {
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/gifs/vikrayON_Mss - Copy.gif',
              height: screenheight,
              width: screenwidth,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
