import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/ui_helper.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/home/widgets/category_feild.dart';
import 'package:vikrayon/views/screens/voni_e_screens.dart';

class LivingGenerals extends StatefulWidget {
  const LivingGenerals({super.key});

  @override
  State<LivingGenerals> createState() => _LivingGeneralsState();
}

class _LivingGeneralsState extends State<LivingGenerals> {
  int index = 0;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: CategoryFeild1(
        searchText: 'Living Generals',
        socialapplogo: 'assets/icons/vonc wathsapp logo crop (Small).png',
        onPressedNotification: () {},
        onPressedSearchbar: () {},
        onPressedwathasapp: () {},
        imageLogo: 'assets/icons/VikrayON_Text_Logo (Small).png',
        gradientcolourAppbar: AppColors.appBarColorLgS,
        colorsearchBorder: Authcolors.borederColor,
        mainBanners: UiHelper.livingGeneralsMainBanners,
        titleCt: 'Categories',
        categoryIcons: UiHelper.livingGeneralsCategoryIcons,
        categoryColors: UiHelper.livingGeneralsCategoryColors,
        categoryNames: UiHelper.livingGeneralsCategoryNames,
        fieldsName: UiHelper.fieldsName,
        vonieImages: UiHelper.vonieImages,
        onBannerTap: (int index) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => lgsCategoryIcon(imageUrl: [], index: index),
              ));
        },
        onCategoryTap: (int index) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => lgsCategoryIcon(imageUrl: [], index: index),
              ));
        },
        onVonieTap: (int index) {
          Get.to(() => const VoniEScreens());
        },
      ),
    );
  }
}

// body: CategoryFeild1(
//   searchText: 'Living Generals',
//   socialapplogo: 'assets/icons/vonc wathsapp logo crop (Small).png',
//   onPressedNotification: () {},
//   onPressedSearchbar: () {},
//   onPressedwathasapp: () {},
//   imageLogo: 'assets/icons/VikrayON_Text_Logo (Small).png',
//   gradientcolourAppbar: AppColors.appBarColorLgS,
//   colorsearchBorder: Authcolors.borederColor,
//   mainBanners: UiHelper.livingGeneralsMainBanners,
//   titleCt: 'Categories',
//   categoryIcons: UiHelper.livingGeneralsCategoryIcons,
//   categoryColors: UiHelper.livingGeneralsCategoryColors,
//   categoryNames: UiHelper.livingGeneralsCategoryNames,
//   fieldsName: UiHelper.fieldsName,
//   vonieImages: UiHelper.vonieImages,
//   onBannerTap: () {
//     print('index: $index');
//     Get.to(() => LivingGenerals());
//   },
//   onCategoryTap: () {
//     print('index: $index');
//     Get.to(() => livingeneralsCategoryIcon(index));
//   },
//   onVonieTap: () {
//     print('index: $index');
//     Get.to(() => VoniEScreens());
//   },
// ),

enum ViewType { grid, list }
