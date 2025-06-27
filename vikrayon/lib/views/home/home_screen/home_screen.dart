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
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: 
      // SectorFeild(
      //   sectorTag: "/Home",
      // ),
      SFeild(
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
        onBannerTap: (index) => Get.to(() => mainBannerindex( imageUrl: [], index: index)),
        onCategoryTap: (index) => Get.to(() => categoryIconindex(imageUrl: [], index: index)),
        onVonieTap: (index) => Get.to(() => vonieImageindex(imageUrl: [], index: 0)),
        onFoodTap: (index) => Get.to(() => foodImageindex(imageUrl: [], index: index)),
        onFoodpageTap: (index) => Get.to(() => foodImageindex(imageUrl: [], index: 0)),
        onLivingTap: (index) => Get.to(() => livinggeneralsImageindex(imageUrl: [], index: index)),
        onLivingpageTap: (index) => Get.to(() => livinggeneralsImageindex(imageUrl: [], index: 0)),
        onFashionTap: (index) => Get.to(() => fashionImageindex(imageUrl: [], index: index)),
        onFashionpageTap: (index) => Get.to(() => fashionImageindex(imageUrl: [], index: 0)),
        onCervcesTap: (index) => Get.to(() => cervcesImageindex(imageUrl: [], index: index)),
        onCervcespageTap: (index) => Get.to(() => cervcesImageindex(imageUrl: [], index: 0)),
      ),
     );
  }
}

enum ViewType { grid, list }

