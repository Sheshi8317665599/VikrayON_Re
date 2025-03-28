import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vikrayon/ui_helper.dart';
import 'package:vikrayon/utils/colors.dart';

class FashionMainScreen extends StatefulWidget {
  const FashionMainScreen({super.key});

  @override
  State<FashionMainScreen> createState() => _FashionMainScreenState();
}

class _FashionMainScreenState extends State<FashionMainScreen> {

  List<Widget> navigationItemsfhs = [
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
    return  Scaffold(
      
      body: IndexedStack(
        index: index,
        children: fhs_screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Authcolors.backgrounColor,
        color: AppColors.bottomNavigationBarColorFhS,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        items: navigationItemsfhs,
      ),
    );
  }
}