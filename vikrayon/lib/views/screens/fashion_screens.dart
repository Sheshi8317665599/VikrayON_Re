import 'package:flutter/material.dart';
import 'package:vikrayon/app_notification_Screen.dart';
import 'package:vikrayon/ui_helper.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/home/widgets/category_feild.dart';
import 'package:vikrayon/widgets/app_bar_feild.dart';

class FashionScreens extends StatefulWidget {
  const FashionScreens({super.key});

  @override
  State<FashionScreens> createState() => _FashionScreensState();
}

class _FashionScreensState extends State<FashionScreens> {
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
            gradientcolourAppbar: AppColors.appBarColorFS,
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
