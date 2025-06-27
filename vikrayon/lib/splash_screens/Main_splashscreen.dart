import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/main_screen.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/auth/login_screen.dart';
import 'package:vikrayon/views/auth/signup_screen.dart';

class SplashController extends GetxController {
  final AuthController authController = Get.find<AuthController>();
  @override
  void onReady() {
    super.onReady();
    navigatetoAppRoute();
  }

  Future<void> navigatetoAppRoute() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final route = await authController.getIntialRoute();
      switch (route) {
        case 'main':
          Get.offAll(
            () => MainScreen(),
            predicate: (route) => false,
          );

          break;
        case 'login':
          Get.offAll(() => LoginScreen());
          break;
        case 'signup':
          Get.offAll(() => SignupScreen());
          break;
        default:
          Get.offAll(() => LoginScreen());
          break;
      }
    } catch (e) {
      print("Error during splash: $e");
      Get.offAll(() => LoginScreen());
    }
  }
}
//   bool _isDisposed = false;

//   @override
//   void onInit() {
//     super.onInit();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       startSplash();
//     });
//   }

//   @override
//   void onClose() {
//     _isDisposed = true;
//     super.onClose();
//   }

//   void startSplash() async {
//     await Future.delayed(Duration(seconds: 2));

//     if (_isDisposed) return;
//     try {
//       final route = await authController.getIntialRoute();
//       if (_isDisposed) return;
//       switch (route) {
//         case 'main':
//           if (!_isDisposed) Get.to(() => MainScreen());
//           break;
//         case 'login':
//           if (!_isDisposed) Get.to(() => LoginScreen());
//           break;
//         case 'signup':
//           if (!_isDisposed) {
//             await Get.to(() => SignupScreen());
//           }
//           break;
//         default:
//           if (!_isDisposed) Get.to(() => LoginScreen());
//           break;
//       }
//     } catch (e) {
//       if (!_isDisposed) {
//         print("Eroor during splash: $e");
//         Get.to(() => LoginScreen());
//       }
//     }
//   }
// }

class MainSplashscreen extends StatefulWidget {
  const MainSplashscreen({super.key});

  @override
  State<MainSplashscreen> createState() => _MainSplashscreenState();
}

class _MainSplashscreenState extends State<MainSplashscreen> {
  late SplashController splashController;

  @override
  void initState() {
    super.initState();
    splashController = Get.put(SplashController(), permanent: false);
  }

  @override
  void dispose() {
    super.dispose();
    // splashController.onClose();
  }

  @override
  Widget build(BuildContext context) {
    // double screenheight = MediaQuery.of(context).size.height;
    // double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SizedBox.expand(
        child: Image.asset(
          'assets/gifs/vikrayON_Mss - Copy.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
