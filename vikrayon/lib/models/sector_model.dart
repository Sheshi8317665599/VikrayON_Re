// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class SectorModel {
  final LinearGradient gradientcolourAppbar;
  final String socialapplogo;
  final Color  colorsearchBorder;
  final Color colorsearchIcon;
  final String searchText;
  final String imageLogo;
  final List<String> mainBanners;
  final String titleCt;
  final List<String> categoryIcons;
  final List<String> categoryTitle;
  final List<Color> categoryColor;
  final List<String> vonieImages;
  final List<String> foodvendorbanner;
  final List<String> livinggeneralsvendorbanner;
  final List<String> fashionvendorbanner;
  final List<String> cervcesvendorbanner;
  SectorModel( { 
    required this.gradientcolourAppbar,
    required this.socialapplogo,
    required this.colorsearchBorder,
    required this.colorsearchIcon,
    required this.searchText,
    required this.imageLogo,
    required this.mainBanners,
    required this.titleCt,
    required this.categoryIcons,
    required this.categoryTitle,
    required this.categoryColor,
    required this.vonieImages,
    required this.foodvendorbanner,
    required this.livinggeneralsvendorbanner,
    required this.fashionvendorbanner,
    required this.cervcesvendorbanner,
  });

  factory SectorModel.fromJson(Map<String, dynamic> json) {
    return SectorModel(
      socialapplogo: json['socialapplogo'] ?? '',
      searchText: json['searchText'] ?? '',
      imageLogo: json['imageLogo'] ?? '',
       gradientcolourAppbar: LinearGradient(colors:(json['gradientcolourAppbar'] as List)
         .map((color) => Color(int.parse(color)))
         .toList(),),
       colorsearchBorder: Color(int.parse(json['colorsearchBorder'] ?? '')),
       colorsearchIcon: Color(int.parse(json['colorsearchIcon'] ?? '')),
      mainBanners: List<String>.from(json['mainBanners'] ?? []),
      titleCt: json['titleCt'] ?? '',
      categoryIcons: List<String>.from(json['categoryIcons'] ?? []),
       categoryColor: (json['categoryColor'] as List)
         .map((color) => Color(int.parse(color)))
         .toList(),
      categoryTitle: List<String>.from(json['categoryTitle'] ?? []),
      vonieImages: List<String>.from(json['vonieImages'] ?? []),
      foodvendorbanner: List<String>.from(json['foodvendorbanner'] ?? []),
      livinggeneralsvendorbanner:
          List<String>.from(json['livinggeneralsvendorbanner'] ?? []),
      fashionvendorbanner: List<String>.from(json['fashionvendorbanner'] ?? []),
      cervcesvendorbanner: List<String>.from(json['cervcesvendorbanner'] ?? []),
    );
  }
}

final sectorModel = SectorModel.fromJson({
  'socialapplogo':
      'https://res.cloudinary.com/ddlyhla10/image/upload/v1748401325/vonc_wathsapp_logo_crop_Small_htntsv.png',
  'searchText': 'Search for your services',
  'imageLogo':
      'https://res.cloudinary.com/ddlyhla10/image/upload/v1748401323/VikrayON_Text_Logo_Small_uq3o5d.png',
  'mainBanners': [
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748401487/vonc_main_banner_Small_kulhgv.jpg',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748401481/vonc_food_banner_Small_smyhma.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748401475/Green_And_Gold_Overlay_Fresh_Foods_Email_Header_Small_qqx7y0.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748401474/Fashion_Sale_Landscape_Banner_Small_p4zs34.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748401489/VOnc_Mechanic_Shop_Services_Banner_Small_gso1af.png',
  ],
  'titleCt': 'Sectors',
  'categoryIcons': [
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748401313/food_Small_gycdqx.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748401317/grocerys_Small_x0odhd.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748401312/fashion_Small_u1ptlk.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748401310/cervices_Small_r7no7l.png',
  ],
  'category Title': [
    'Foods',
    'LivingGenerals',
    'Fashion',
    'Cervces',
  ],
  'vonieImages': [
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748401332/vonc_io_main-removebg-preview_edited_Small_hbcasw.png',
  ],
  'foodvendorbanner': [
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748402362/vonc_m_f_1_Small_fcibym.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748402364/vonc_m_f_2_Small_yavtdc.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748402366/vonc_m_f_3_Small_oy3qcu.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748402368/vonc_m_f_4_Small_kwlcdp.png',
  ],
  'livinggeneralsvendorbanner': [
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748402295/rv_1_Small_yk9gty.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748402289/re_2_Small_rgjcsy.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748402291/re_3_Small_ky69bu.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748402293/RE-4_Small_gt71sd.png',
  ],
  'fashionvendorbanner': [
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748402412/vonc_clothes_Fashion_Small_encgcu.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748402416/vonc_L-E_P_Small_y96rmg.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748402414/VONC_L-E_Small_r5nfj1.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748402418/vonc_l-e_s_Small_kgzmhe.png',
  ],
  'cervcesvendorbanner': [
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748402439/cervices_ad-min_Small_mfkpfb.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748402442/Electronic_Service_Banner_app-min_Small_zdax9e.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748402442/Electronic_Service_Banner_app-min_Small_zdax9e.png',
    'https://res.cloudinary.com/ddlyhla10/image/upload/v1748402444/VONC_CAR_CERVICES-min_Small_bnn8ft.png',
  ],
});
