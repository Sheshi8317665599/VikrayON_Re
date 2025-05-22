import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/controllers/widget_controller.dart';

import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/auth/signup_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController('https://dca9-223-230-113-217.ngrok-free.app/auth'));
  Get.lazyPut(() => ProductController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VikrayOn',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.bottomNavigationBarColorMS),
          useMaterial3: true,
        ),
        home: SignupScreen(),
      ),
    );
  }
}
