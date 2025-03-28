import 'package:flutter/material.dart';
import 'package:vikrayon/app_notification_Screen.dart';
import 'package:vikrayon/main_screen.dart';
import 'package:vikrayon/ui_helper.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/home/widgets/category_feild.dart';
import 'package:vikrayon/views/main/cervices_main_screen.dart';
import 'package:vikrayon/views/main/fashion_main_screen.dart';
import 'package:vikrayon/views/main/food_main_screen.dart';
import 'package:vikrayon/views/main/living_generals_main_screen.dart';
import 'package:vikrayon/views/screens/voni_e_screens.dart';
import 'package:vikrayon/widgets/app_bar_feild.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarms(
            onPressedNotification: () => AppNotificationScreen(),
            onPressedSearchbar: () {},
            onPressedwathasapp: () {},
            imageLogo: 'assets/icons/vikray_logo.png',
            gradientcolourAppbar: AppColors.appBarColorMS,
            colorsearchBorder: AppColors.bottomNavigationBarColorCvS),
      ),
      body: CategoryFeild(
          itemCount: UiHelper.mainBanners,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => getMainBanner(index)));
          },
          // () => MainBanners(index),
          mbImages: UiHelper.mainBanners,
          titleCT: "Categories",
          imageci: UiHelper.categoryIcons,
          itemCountci: UiHelper.categoryIcons,
          onTapci: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => getCategoryIcon(index)));
          },
          // () => CategoryIcon(index),
          colorCi: UiHelper.categoryColors,
          cNames: UiHelper.categoryNames,
          onpressedciVie: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VoniEScreens()));
          },

          // () => VonieImage(index),
          imageciVie: UiHelper.vonieImages,
          fname: UiHelper.categoryNames,
          itemCountFo: UiHelper.foodImages,
          onTapFo: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FoodMainScreen()));
          },
          //() => FoodImage(index),
          imageFo: UiHelper.foodImages,
          lgname: UiHelper.categoryNames,
          itemCountlg: UiHelper.livingEssentailsImages,
          onTaplg: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LivingGeneralsMainScreen()));
          },
          // () => LivingEssentailsImage(index),
          imagelg: UiHelper.livingEssentailsImages,
          fsname: UiHelper.categoryNames,
          itemCountfs: UiHelper.fashionImages,
          onTapfs: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FashionMainScreen()));
          },
          // () => FashionImage(index),
          imagefs: UiHelper.fashionImages,
          coname: UiHelper.categoryNames,
          itemCountco: UiHelper.cervcesImages,
          onTapco: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CervcesMainScreen()));
          },

          //() => CervcesImage(index),
          imageco: UiHelper.cervcesImages),
    );
  }
}

Widget getCategoryIcon(int index) {
  switch (index) {
    case 0:
      return FoodMainScreen();
    case 1:
      return LivingGeneralsMainScreen();
    case 2:
      return FashionMainScreen();
    case 3:
      return CervcesMainScreen();
    default:
      return MainScreen();
  }
}
