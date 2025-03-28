import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/discount_page.dart';
import 'package:vikrayon/main_screen.dart';
import 'package:vikrayon/profile_screen.dart';
import 'package:vikrayon/views/home/cart/cervices_cart_screen.dart';
import 'package:vikrayon/views/home/cart/fashoin_cart_screen.dart';
import 'package:vikrayon/views/home/cart/foods_cart_screen.dart';
import 'package:vikrayon/views/home/cart/living_generals_cart_screen.dart';
import 'package:vikrayon/views/home/cart/main_cart_screen.dart';
import 'package:vikrayon/views/home/favourite/cervces_favourite_screen.dart';
import 'package:vikrayon/views/home/favourite/fashion_favourite_screen.dart';
import 'package:vikrayon/views/home/favourite/food_favourite_screen.dart';
import 'package:vikrayon/views/home/favourite/living_generals__favourite_screen.dart';
import 'package:vikrayon/views/home/favourite/main_favourite_screen.dart';
import 'package:vikrayon/views/home/home_screen/home_screen.dart';
import 'package:vikrayon/views/main/cervices_main_screen.dart';
import 'package:vikrayon/views/main/fashion_main_screen.dart';
import 'package:vikrayon/views/main/food_main_screen.dart';
import 'package:vikrayon/views/main/living_generals_main_screen.dart';
import 'package:vikrayon/views/screens/cevices_screen.dart';
import 'package:vikrayon/views/screens/fashion_screens.dart';
import 'package:vikrayon/views/screens/foods_screens.dart';
import 'package:vikrayon/views/screens/living_generals.dart';
import 'package:vikrayon/views/screens/voni_e_screens.dart';

class UiHelper {
  // MAIN page Banners

  static List<String> mainBanners = [
    "assets/img/main_screen/vonc_main_banner.jpg",
    "assets/img/main_screen/vonc food banner.png",
    "assets/img/main_screen/Green And Gold Overlay Fresh Foods Email Header.png",
    "assets/img/main_screen/Fashion Sale Landscape Banner.png",
    "assets/img/main_screen/VOnc_Mechanic Shop Services Banner.png",
  ];

  // cateogry icons

  static List<String> categoryIcons = [
    "assets/icons/food .png",
    "assets/icons/grocerys.png",
    "assets/icons/fashion.png",
    "assets/icons/cervices.png",
  ];

  // Category names

  static List<String> categoryNames = [
    "Food",
    "Living Generals",
    "Fashion",
    "Cervces",
  ];

  // Category Colors

  static List<Color> categoryColors = [
    Color(0xff5ce1e6),
    Color(0xff4ce305),
    Color(0xffe3a705),
    Color(0xff737373),
  ];

  // Foods Section Images

  static List<String> foodImages = [
    "assets/img/foods/vonc_m_f_1.png",
    "assets/img/foods/vonc_m_f_2.png",
    "assets/img/foods/vonc_m_f_3 .png",
    "assets/img/foods/vonc_m_f_4.png",
  ];

  // Living Essentails Images

  static List<String> livingEssentailsImages = [
    "assets/img/living_generals/VOnC LE EGGS.png",
    "assets/img/living_generals/VOnC LE Chicken.png",
    "assets/img/living_generals/VOnC LE FLESH.png",
    "assets/img/living_generals/VOnC LE FISH.png",
  ];

  // Fashion Section Images

  static List<String> fashionImages = [
    "assets/img/fashion/vonc clothes Fashion.png",
    "assets/img/fashion/vonc_L-E_P.png",
    "assets/img/fashion/vonc_l-e_s.png",
    "assets/img/fashion/VONC_L-E.png",
  ];

  // Cervces Section Images

  static List<String> cervcesImages = [
    "assets/img/cervces/cervices ad-min.png",
    "assets/img/cervces/VONC D CERVICES-min.png",
    "assets/img/cervces/VONC MOTOR CERVICES-min.png",
    "assets/img/cervces/VONC CAR CERVICES-min.png",
  ];

  // VONI&E Section Images

  static List<String> vonieImages = [
    "assets/icons/vonc_io_main-removebg-preview edited.png",
  ];
}
// // RxInt of main banner index

final RxInt selectedmainBannersIndex = 0.obs;

// // RxInt of category icons index

final RxInt selectedCategoryIconsIndex = 0.obs;
// // RxInt of Food images index

final RxInt selectedFoodImagesIndex = 0.obs;

// // RxInt of Living Essentails images index

final RxInt selectedLivingEssentailsImagesIndex = 0.obs;

// // RxInt of Fashion images index

final RxInt selectedFashionImagesIndex = 0.obs;

// // RxInt of Cervces images index

final RxInt selectedCervcesImagesIndex = 0.obs;

// RxInt of VONI&E images index

final RxInt selectedVonieImagesIndex = 0.obs;

// getMainBanner

Widget getMainBanner(int index) {
  switch (index) {
    case 0:
      return DiscountPage();
    case 1:
      return FoodMainScreen();
    case 2:
      return LivingGeneralsMainScreen();
    case 3:
      return FashionMainScreen();
    case 4:
      return CervcesMainScreen();
    default:
      return MainScreen();
  }
}

// getCategoryIcon

Widget getCategoryIcon(int index) {
  switch (index) {
    case 0:
      return FoodsScreens();
    case 1:
      return LivingGenerals();
    case 2:
      return FashionScreens();
    case 3:
      return CervicesCartScreen();
    default:
      return MainScreen();
  }
}

// getFoodImage

Widget getFoodImage(index) {
  switch (index) {
    default:
      return FoodMainScreen();
  }
}

// getLivingEssentailsImage

Widget getLivinggeneralsImage(index) {
  switch (index) {
    default:
      return LivingGeneralsMainScreen();
  }
}

// getFashionImage

Widget getFashionImage(index) {
  switch (index) {
    default:
      return FashionMainScreen();
  }
}

// getCervcesImage

Widget getCervcesImage(index) {
  switch (index) {
    default:
      return CervcesMainScreen();
  }
}

// getVonieImage

Widget getVonieImage(index) {
  switch (index) {
    default:
      return VoniEScreens();
  }
}

// Main Screens bn
List<Widget> ms_screens = [
  HomeScreen(),
  MainFavouriteScreen(),
  MainCart_screen(),
  ProfileScreen(),
];

// Foods Screensbn
List<Widget> fs_screens = [
  FoodsScreens(),
  FoodFavouriteScreen(),
  FoodsCartScreen(),
  ProfileScreen(),
];

// Living Generals Screensbn
List<Widget> lgs_screens = [
  LivingGenerals(),
  LivingGeneralsFavouriteScreen(),
  LivingGeneralsCartScreen(),
  ProfileScreen(),
];

// Fashion Screensbn
List<Widget> fhs_screens = [
  FashionScreens(),
  FashionFavouriteScreen(),
  FashoinCartScreen(),
  ProfileScreen(),
];

// Cervces Screensbn
List<Widget> cs_screens = [
  CevicesScreen(),
  CervcesFavouriteScreen(),
  CervicesCartScreen(),
  ProfileScreen(),
];

// navigation items
