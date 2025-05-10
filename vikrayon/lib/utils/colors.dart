import 'package:flutter/material.dart';

class AppColors {
  // scaffold background color
  static const Color scaffoldBackground = Color(0xff000000);

  // bottom navigation bar color

  static const Color bottomNavigationBarColorMS =
      Color(0xff5271ff); // bottom navigation bar color of MS

  static const Color bottomNavigationBarColorFS =
      Color(0xff5ce1e6); // bottom navigation bar color of FS

  static const Color bottomNavigationBarColorLgS =
      Color(0xff4ce305); // bottom navigation bar color of LgS

  static const Color bottomNavigationBarColorFhS =
      Color(0xffe3a705); // bottom navigation bar color of Fhs

  static const Color bottomNavigationBarColorCvS =
      Color(0xff737373); // bottom navigation bar color of CvS

  // App bar colors

  static const Color transperent =
      Colors.transparent; // Bottom navigation bar color

  static const LinearGradient appBarColorMS = LinearGradient(
      colors: [Color(0xff3533cd), Color(0xff000000)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter); // App bar Color Of Ms

  static const LinearGradient appBarColorFS = LinearGradient(
      colors: [Color(0xff5ce1e6), Color(0XFF000000)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter); // App bar Color Of Fs

  static const LinearGradient appBarColorLgS = LinearGradient(
      colors: [Color(0xff4ce305), Color(0XFF000000)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter); // App bar Color Of LgS

  static const LinearGradient appBarColorFhs = LinearGradient(
      colors: [Color(0xffe3a705), Color(0xff000000)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter); // App bar Color Of Fhs

  static const LinearGradient appBarColorCvS = LinearGradient(
      colors: [Color(0xff737373), Color(0xff000000)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter); // App bar Color of CvS

// Product Screen Colors

  // product gradient colour of foods

  static const LinearGradient productscreencolourfsp = LinearGradient(
      colors: [Color(0xffffffff), Color(0xff5ce1e6)],
      stops: [0.5, 0.8],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  // product gradient colour of living generals

  static const LinearGradient productscreencolourlgsp = LinearGradient(
    colors: [Color(0xffffffff), Color(0xff4ce305)],
    stops: [0.5, 0.8],
    // begin: Alignment.bottomRight,
    // end: Alignment.topL);
  );
  // product gradient colour of fashions

  static const LinearGradient productscreencolourfhsp = LinearGradient(
      colors: [Color(0xffffffff), Color(0xffe3a705)],
      stops: [0.5, 0.8],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  // product gradient colour of

  static const LinearGradient productscreencolourcvsp = LinearGradient(
      colors: [Color(0xffffffff), Color(0xff737373)],
      stops: [0.5, 0.8],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  // Details Screen Colors

  static const LinearGradient detailsScreenColorVoI = LinearGradient(
      colors: [Color(0xffffffff), Color(0xff3533cd)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter); // Detail screen color of Voi

  static const LinearGradient detailsScreenColorFS = LinearGradient(
      colors: [Color(0xffffffff), Color(0xff5ce1e6)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter); // Detail screen color of Fs

  static const LinearGradient detailsScreenColorLgS = LinearGradient(
      colors: [Color(0xffffffff), Color(0xff4ce305)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter); // Detail screen color of LgS

  static const LinearGradient detailsScreenColorFhs = LinearGradient(
      colors: [Color(0xffffffff), Color(0xffe3a705)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const LinearGradient detailsScreenColorCvS = LinearGradient(
      colors: [Color(0xffffffff), Color(0xff737373)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter); // Detail screen color of CvS

  // colors

  static const Color colorms = Color(0xff3533cd); // color 1
  static const Color colorfs = Color(0xff5ce1e6); // color 2
  static const Color colorlgs = Color(0xff4ce305); // color 3
  static const Color colorfhs = Color(0xffe3a705); // color 4
  static const Color colorcvs = Color(0xff737373); // color 5
}

class Authcolors {
  // Auth Screen Background Colors

  static const Color backgrounColor = Color.fromRGBO(24, 24, 32, 1);
  static const Color gradient1 = Color.fromRGBO(187, 63, 221, 1);
  static const Color gradient2 = Color.fromRGBO(251, 109, 168, 1);
  static const Color gradient3 = Color.fromRGBO(255, 159, 124, 1);
  static const Color borederColor = Color.fromRGBO(52, 51, 67, 1);
  static const Color whiteColor = Colors.white;
}
