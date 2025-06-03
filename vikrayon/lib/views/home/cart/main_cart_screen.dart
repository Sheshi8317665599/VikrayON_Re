import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:vikrayon/utils/colors.dart';

class MainCart_screen extends StatefulWidget {
  const MainCart_screen({super.key});

  @override
  State<MainCart_screen> createState() => _MainCart_screenState();
}

class _MainCart_screenState extends State<MainCart_screen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackground,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              const Text("Shopping Cart",
                  style: TextStyle(color: Authcolors.whiteColor)),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_checkout_outlined,
                  color: Authcolors.whiteColor,
                ),
                onPressed: () {},
              )
            ],
          ),
          // bottom: const TabBar(
          //   indicatorColor: Authcolors.whiteColor,
          //   tabs: [
          //     Tab(icon: Icon(Icons.food_bank, color: Authcolors.whiteColor), text: "Food"),
          //     Tab(icon: Icon(Icons.living, color: Authcolors.whiteColor), text: "Living Generals"),
          //     Tab(icon: Icon(Icons.watch, color: Authcolors.whiteColor), text: "fashion"),
          //     Tab(icon: Icon(Icons.supervised_user_circle_sharp, color: Authcolors.whiteColor), text: "cervces"),
          //   ]
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SegmentedTabControl(
                tabs: [
                  // Fruits Tasb
                  SegmentTab(
                    label: 'Food',
                    color: AppColors.bottomNavigationBarColorMS,
                    textColor: AppColors.scaffoldBackground,
                    selectedTextColor: Authcolors.whiteColor,
                  ),
                  // Vegetables Tab
                  SegmentTab(
                    label: 'Living Generals',
                    color: AppColors.bottomNavigationBarColorMS,
                    textColor: AppColors.scaffoldBackground,
                    selectedTextColor: Authcolors.whiteColor,
                  ),

                  SegmentTab(
                    label: 'Fashion',
                    color: AppColors.bottomNavigationBarColorMS,
                    textColor: AppColors.scaffoldBackground,
                    selectedTextColor: Authcolors.whiteColor,
                  ),

                  SegmentTab(
                    label: 'Cervces',
                    color: AppColors.bottomNavigationBarColorMS,
                    textColor: AppColors.scaffoldBackground,
                    selectedTextColor: Authcolors.whiteColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: TabBarView(
                controller: TabController(length: 4, vsync: this),
                children: [
                  Center(),
                  Center(),
                  Center(),
                  Center(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
