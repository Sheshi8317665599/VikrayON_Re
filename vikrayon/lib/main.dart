import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/controllers/widget_controller.dart';

import 'package:vikrayon/splash_screens/Main_splashscreen.dart';
import 'package:vikrayon/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthController('http://127.0.0.1:8000' ));
  Get.lazyPut(() => ProductController());
  Get.lazyPut(() => CategoryController());
  

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
        home: const MainSplashscreen(),
      ),
    );
  }
}
