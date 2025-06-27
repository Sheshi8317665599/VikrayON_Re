import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/api/api_client.dart';
import 'package:vikrayon/app_notification_Screen.dart';
import 'package:vikrayon/models/sector_model.dart';
import 'package:vikrayon/ui_helper.dart';

class SectorController extends GetxController {
  final String? sectorTag;
  SectorController({this.sectorTag});

  // final Dio dio = Dio(
  //   BaseOptions(
  //     baseUrl: 'https://run.mocky.io/v3/96ccc2b8-1279-4529-bff5-2bad4e14f2d3',
  //     connectTimeout: const Duration(seconds: 5),
  //     receiveTimeout: const Duration(seconds: 5),
  //   ),
  // );

  @override
  void onInit() {
    super.onInit();
    fetchSectorData();
  }

  final Rx<SectorModel?> sectorModel = Rx<SectorModel?>(null);

  final RxBool isLoading = false.obs;
  Future<void> onRefresh() async {
    isLoading.value = true;
    try {
      await fetchSectorData();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products. Please try again later.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchSectorData() async {
    try {
      isLoading.value = true;
      
      final response = await ApiClient
          .get('getsectorsUrl', queryParameters: {'Slider_tag': sectorTag!});
      if (response.statusCode == 200) {
        sectorModel.value = SectorModel.fromJson(response.data);
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
    final image = sectorModel.value?.mainBanners[index];
    if (image != null) {
      Get.to(() =>navigateToCategory('category'));
    //Get.to(mainBannerindex(imageUrl: [image], index: index));
    }
  }

  // Category tap handler
  void onCategorySelected(int index) {
    final image = sectorModel.value?.categoryIcons[index];
    if (image != null){
    Get.to(() => categoryIconindex(imageUrl: [image], index: index));
    }
  }

// foodImageindex
  void onFoodVendorSelected(int index) {
    final image = sectorModel.value?.foodvendorbanner[index];
    if (image != null){
    Get.to(() => foodImageindex(imageUrl: [image], index: index));
    }
  }

// livinggeneralsImageindex
  void onLivingGeneralVendorSelected(int index) {
    final image = sectorModel.value?.livinggeneralsvendorbanner[index];
    if (image != null){
    Get.to(() => livinggeneralsImageindex(imageUrl: [image], index: index));
    }
  }

// fashionImageindex
  void onFashionVendorSelected(int index) {
    final image = sectorModel.value?.fashionvendorbanner[index];
    if(image != null) {
    Get.to(() => fashionImageindex(imageUrl: [image], index: index));
    }
  }

// cervcesImageindex
  void oncervcesVendorSelected(int index) {
    final image = sectorModel.value?.cervcesvendorbanner[index];
    if(image != null) { 
    Get.to(() => cervcesImageindex(imageUrl: [image], index: index));
    }
  }

  void onvoniesetected(int index) {
    final image = sectorModel.value?.vonieImages[index];
    if(image != null) { 
    Get.to(() => vonieImageindex( imageUrl: [image], index: index));
    }
  }

  
}
