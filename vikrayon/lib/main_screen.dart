import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vikrayon/controllers/location_controller.dart';
import 'package:vikrayon/controllers/network_controller.dart';
import 'package:vikrayon/ui_helper.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/utils/utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  //   @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     permissionController.requestAllPermission();
  //   });
  // }


  final LocationController locationController = Get.put(LocationController());
  final PermissonController permissionController =
      Get.put(PermissonController());
  final Networkcontroller networkController = Get.put(Networkcontroller());

  DateTime? lastBackPressed;

  Future<bool> onWiillPop() async {
    final now = DateTime.now();
    if (lastBackPressed == null ||
        now.difference(lastBackPressed!) > const Duration(seconds: 2)) {
      lastBackPressed = now;
      Get.snackbar(
        "Exit",
        "Press back again to exit",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.bottomNavigationBarColorMS,
        colorText: Authcolors.whiteColor,
      );
      return false; // Do not exit the app
    }
    SystemNavigator.pop(); // Exit the app
    return true;
  }

  final List<Widget> navigationItemsms = [
    const Icon(
      Icons.home_outlined,
      color: Authcolors.whiteColor,
      semanticLabel: "Home",
    ),
    const Icon(
      Icons.favorite_border_outlined,
      color: Authcolors.whiteColor,
      semanticLabel: "Favourite",
    ),
    const Icon(
      Icons.shopping_cart_outlined,
      color: Authcolors.whiteColor,
      semanticLabel: "Shopping",
    ),
    const Icon(
      Icons.person_outline_rounded,
      color: Authcolors.whiteColor,
      semanticLabel: "Profile",
    ),
  ];

  int index = 0;

  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      permissionController.requestAllPermission();
    });
    networkController.checkInternetConnection();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onWiillPop();
      },
      child: Obx(() {
        if (!networkController.isOnline.value) {
          return OfflineScreen();
        }
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          extendBody: true,
          body: IndexedStack(
            index: index,
            children: ms_screens,
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(color: AppColors.transperent, boxShadow: [
              BoxShadow(
                color: AppColors.transperent,
                spreadRadius: 0,
                blurRadius: 20,
                offset: const Offset(0, 20),
              ),
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CurvedNavigationBar(
                height: 60,
                backgroundColor: AppColors.transperent,
                color: AppColors.bottomNavigationBarColorMS,
                index: index,
                onTap: (selectedIndex) {
                  if (mounted) {
                    setState(() {
                      index = selectedIndex;
                    });
                  }
                },
                items: navigationItemsms,
              ),
            ),
          ),
        );
      }),
    );
  }
}
