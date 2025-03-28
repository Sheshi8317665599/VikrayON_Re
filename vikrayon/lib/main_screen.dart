import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vikrayon/ui_helper.dart';
import 'package:vikrayon/utils/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: ms_screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Authcolors.backgrounColor,
        color: AppColors.bottomNavigationBarColorMS,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        items: navigationItemsms,
      ),
      //  BootombarFeild(
      //   backgroundColor: AppColors.transperent,
      //   backgroundColorbn: Colors.black,
      //   bnviewcolour: AppColors.bottomNavigationBarColorMS,
      //   currentIndex: index,
      //   screens: ms_screens,
      //   bnitems: navigationItems,
      //   onItemTapped: (selectedIndex) {
      //     setState(() {
      //       index = selectedIndex;
      //     });
      //   },
      // ),
    );
  }
}
