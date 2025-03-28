import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/splash_screens/Main_splashscreen.dart';
import 'package:vikrayon/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthController(""));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VikrayOn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.bottomNavigationBarColorMS),
        useMaterial3: true,
      ),
      home: const MainSplashscreen(),
    );
  }
}
