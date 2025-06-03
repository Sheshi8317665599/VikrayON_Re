import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/ui_helper.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/home/widgets/sector_feild.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SectorFeild(
        searchText: "Search",
        socialapplogo: "assets/icons/vonc wathsapp logo crop (Small).png",
        onPressedNotification: () {},
        onPressedSearchbar: () {},
        onPressedwathasapp: () {},
        imageLogo: "assets/icons/VikrayON_Text_Logo (Small).png",
        gradientcolourAppbar: AppColors.appBarColorMS,
        colorsearchBorder: AppColors.bottomNavigationBarColorCvS,
        mainBanners: UiHelper.mainBanners,
        titleCt: "Categories",
        categoryIcons: UiHelper.categoryIcons,
        categoryColors: UiHelper.categoryColors,
        categoryNames: UiHelper.categoryNames,
        vonieImages: UiHelper.vonieImages,
        foodimages: UiHelper.foodImages,
        livingEssentailsImages: UiHelper.livingEssentailsImages,
        fashionImages: UiHelper.fashionImages,
        cervcesImages: UiHelper.cervcesImages,
        onBannerTap: (index) => Get.to(() => mainBannerindex(index)),
        onCategoryTap: (index) => Get.to(() => categoryIconindex(index)),
        onVonieTap: (index) => Get.to(() => vonieImageindex(0)),
        onFoodTap: (index) => Get.to(() => foodImageindex(index)),
        onFoodpageTap: (index) => Get.to(() => foodImageindex(0)),
        onLivingTap: (index) => Get.to(() => livinggeneralsImageindex(index)),
        onLivingpageTap: (index) => Get.to(() => livinggeneralsImageindex(0)),
        onFashionTap: (index) => Get.to(() => fashionImageindex(index)),
        onFashionpageTap: (index) => Get.to(() => fashionImageindex(0)),
        onCervcesTap: (index) => Get.to(() => cervcesImageindex(index)),
        onCervcespageTap: (index) => Get.to(() => cervcesImageindex(0)),
      ),
    );
  }
}

enum ViewType { grid, list }
