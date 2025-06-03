import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/app_notification_Screen.dart';
import 'package:vikrayon/models/category_model.dart';
import 'package:vikrayon/ui_helper.dart';

class CategoryFeildController extends GetxController {
  final String categoryTag;
  CategoryFeildController({required this.categoryTag});

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://run.mocky.io/v3/96ccc2b8-1279-4529-bff5-2bad4e14f2d3',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  @override
  void onInit() {
    super.onInit();
    fetchCategoryData();
  }

  final Rx<CategoryModel?> categoryModel = Rx<CategoryModel?>(null);

  final RxBool isLoading = false.obs;

  Future<void> fetchCategoryData() async {
    try {
      isLoading.value = true;
      final response = await dio.get(categoryTag);
      if (response.statusCode == 2000) {
        categoryModel.value = CategoryModel.fromJson(response.data);
      } else {
        Get.snackbar('Error', 'Failed to load Data',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar(
          'Network Error', 'Failed to fetch products. Please try again later.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  // Optional tap Handelers
  // notificationscreen
  void onPressedNotification() {
    Get.to(() => AppNotificationScreen());
  }

  // searchbar
  void onPressedSearchbar() {
    // Implement search bar tap logic here
    print('Search bar tapped');
  }

  // social app
  void onPressedSocaialapp() {
    // Implement social app tap logic here
    print('Social app tapped');
  }

  // Banner tap handler

  void onBannerSelected(int index) {
    Get.to(mainBannerindex(index));
    return;
  }

  // Category tap handler
  void onCategorySelected(int index) {
    Get.to(() => categoryIconindex(index));
  }

// foodImageindex
  void onFoodVendorSelected(int index) {
    Get.to(() => foodImageindex(index));
  }

// livinggeneralsImageindex
  void onLivingGeneralVendorSelected(int index) {
    Get.to(() => livinggeneralsImageindex(index));
  }

// fashionImageindex
  void onFashionVendorSelected(int index) {
    Get.to(() => fashionImageindex(index));
  }

// cervcesImageindex
  void oncervcesVendorSelected(int index) {
    Get.to(() => cervcesImageindex(index));
  }
}
