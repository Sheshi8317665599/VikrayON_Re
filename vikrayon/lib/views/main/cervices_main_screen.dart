import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vikrayon/ui_helper.dart';
import 'package:vikrayon/utils/colors.dart';

class CervcesMainScreen extends StatefulWidget {
  const CervcesMainScreen({super.key});

  @override
  State<CervcesMainScreen> createState() => _CervcesMainScreenState();
}

class _CervcesMainScreenState extends State<CervcesMainScreen> {
  int index = 0;

  List<Widget> navigationItemscvs = [
    const Icon(
      Icons.home_outlined,
      color: Authcolors.whiteColor,
      semanticLabel: "Home",
    ),
    const Icon(
      Icons.favorite_border_outlined,
      color: Authcolors.whiteColor,
      semanticLabel: "Favourites",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: cs_screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Authcolors.backgrounColor,
        color: AppColors.bottomNavigationBarColorCvS,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        items: navigationItemscvs,
      ),
    );
  }
}
