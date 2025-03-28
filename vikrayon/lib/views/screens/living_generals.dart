import 'package:flutter/material.dart';
import 'package:vikrayon/app_notification_Screen.dart';
import 'package:vikrayon/ui_helper.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/home/widgets/category_feild.dart';
import 'package:vikrayon/widgets/app_bar_feild.dart';

class LivingGenerals extends StatefulWidget {
  const LivingGenerals({super.key});

  @override
  State<LivingGenerals> createState() => _LivingGeneralsState();
}

class _LivingGeneralsState extends State<LivingGenerals> {
  List<Widget> navigationItems = [
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarms(
            onPressedNotification: () => AppNotificationScreen(),
            onPressedSearchbar: () {},
            onPressedwathasapp: () {},
            imageLogo: 'assets/icons/vikray_logo.png',
            gradientcolourAppbar: AppColors.appBarColorLgS,
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
                MaterialPageRoute(builder: (context) => getVonieImage(index)));
          },

          // () => VonieImage(index),
          imageciVie: UiHelper.vonieImages,
          fname: UiHelper.categoryNames,
          itemCountFo: UiHelper.foodImages,
          onTapFo: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => getFoodImage(index)));
          },
          //() => FoodImage(index),
          imageFo: UiHelper.foodImages,
          lgname: UiHelper.categoryNames,
          itemCountlg: UiHelper.livingEssentailsImages,
          onTaplg: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => getLivinggeneralsImage(index)));
          },
          // () => LivingEssentailsImage(index),
          imagelg: UiHelper.livingEssentailsImages,
          fsname: UiHelper.categoryNames,
          itemCountfs: UiHelper.fashionImages,
          onTapfs: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => getFashionImage(index)));
          },
          // () => FashionImage(index),
          imagefs: UiHelper.fashionImages,
          coname: UiHelper.categoryNames,
          itemCountco: UiHelper.cervcesImages,
          onTapco: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => getCervcesImage(index)));
          },

          //() => CervcesImage(index),
          imageco: UiHelper.cervcesImages),
    );
  }
}
