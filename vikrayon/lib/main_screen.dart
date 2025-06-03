import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final PermissonController permissionController =
      Get.put(PermissonController());
  final Networkcontroller networkController = Get.put(Networkcontroller());

  List<Widget> navigationItemsms = [
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
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    networkController.checkInternetConnection();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_isDisposed) {
        permissionController.requestAllPermission();
      }
    });
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!networkController.isOnline.value) {
        return OfflineScreen();
      }
      return Scaffold(
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
                setState(() {
                  index = selectedIndex;
                });
              },
              items: navigationItemsms,
            ),
          ),
        ),
      );
    });
  }
}
