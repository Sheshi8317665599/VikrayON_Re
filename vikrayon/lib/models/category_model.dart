// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/widgets.dart';

class CategoryModel {
  final String socialapplogo;
  final String searchText;
  final String imageLogo;
  final List<Color> gradientcolourAppbar;
  final Color colorsearchBorder;
  final Color colorsearchIcon;
  final List<String> mainBanners;
  final String titleCt;
  final List<String> categoryIcons;
  final List<Color> categoryColor;
  final List<String> categoryTitle;
  final List<String> vonieImages;
  final List<String> foodvendorbanner;
  final List<String> livinggeneralsvendorbanner;
  final List<String> fashionvendorbanner;
  final List<String> cervcesvendorbanner;
  CategoryModel({
    required this.socialapplogo,
    required this.searchText,
    required this.imageLogo,
    required this.gradientcolourAppbar,
    required this.colorsearchBorder,
    required this.colorsearchIcon,
    required this.mainBanners,
    required this.titleCt,
    required this.categoryIcons,
    required this.categoryColor,
    required this.categoryTitle,
    required this.vonieImages,
    required this.foodvendorbanner,
    required this.livinggeneralsvendorbanner,
    required this.fashionvendorbanner,
    required this.cervcesvendorbanner,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      socialapplogo: json['socialapplogo'] ?? '',
      searchText: json['searchText'] ?? '',
      imageLogo: json['imageLogo'] ?? '',
      gradientcolourAppbar: (json['gradientcolourAppbar'] as List)
          .map((color) => Color(int.parse(color)))
          .toList(),
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
