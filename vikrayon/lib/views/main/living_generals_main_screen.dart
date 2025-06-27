import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vikrayon/ui_helper.dart';
import 'package:vikrayon/utils/colors.dart';

class LivingGeneralsMainScreen extends StatefulWidget {
  const LivingGeneralsMainScreen({super.key});

  @override
  State<LivingGeneralsMainScreen> createState() =>
      _LivingGeneralsMainScreenState();
}
class _LivingGeneralsMainScreenState extends State<LivingGeneralsMainScreen> {


  

  List<Widget> navigationItemslgs = [
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
        children: lgs_screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.sp,
        backgroundColor: Authcolors.backgrounColor,
        color: AppColors.bottomNavigationBarColorLgS,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        items: navigationItemslgs,
      ),
    );
  }
}
