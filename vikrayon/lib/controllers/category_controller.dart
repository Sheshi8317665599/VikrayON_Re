import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/api/api_client.dart';
import 'package:vikrayon/app_notification_Screen.dart';
import 'package:vikrayon/models/category_model.dart';
import 'package:vikrayon/ui_helper.dart';

class CategoryFeildController extends GetxController {
  final String? categoryTag;
  CategoryFeildController({ this.categoryTag});

  

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

  
      final response = await ApiClient.get('getCategoriesUrl',
          queryParams: {'tag': categoryTag});
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
    final image = categoryModel.value?.mainBanners[index];
    if (image != null) {
    Get.to(() => lgsmainbannere(imageUrl: [image], index: index));
    }
  }

  // Category tap handler
  void onCategorySelected(int index) {
    final image = categoryModel.value?.categorygl[index];
    if (image != null){
    Get.to(() => lgsCategoryIcon(imageUrl: [image], index: index));
    }
  }

// vonieImageindex
  void onvoniesetected(int index) {
    final image = categoryModel.value?.vonieImages[index];
    if (image != null) {
    Get.to(() => vonieImageindex(imageUrl: [image], index: index));
    }
  }
}
