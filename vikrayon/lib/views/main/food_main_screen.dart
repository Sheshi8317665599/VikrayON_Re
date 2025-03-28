import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vikrayon/ui_helper.dart';
import 'package:vikrayon/utils/colors.dart';

class FoodMainScreen extends StatefulWidget {
  const FoodMainScreen({super.key});

  @override
  State<FoodMainScreen> createState() => _FoodMainScreenState();
}

class _FoodMainScreenState extends State<FoodMainScreen> {
  List<Widget> navigationItemsfs = [
    const Icon(
      Icons.home_outlined,
      color: Authcolors.whiteColor,
      semanticLabel: "Home",
    ),
    const Icon(
      Icons.favorite_border_outlined,
      color: Authcolors.whiteColor,
      semanticLabel: "Home",
    ),
    const Icon(
      Icons.shopping_cart_outlined,
      color: Authcolors.whiteColor,
      semanticLabel: "Home",
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
        children: fs_screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Authcolors.backgrounColor,
        color: AppColors.bottomNavigationBarColorFS,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        items: navigationItemsfs,
      ),
    );
  }
}
