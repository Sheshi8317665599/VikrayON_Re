import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/api/api_client.dart';
import 'package:vikrayon/models/pvb_model.dart';

class PvbController extends GetxController {
  final String? sliderTag;
  PvbController({ this.sliderTag});

  final RxBool isLoading = true.obs;
  final RxList<PvbModel> pvbItems = <PvbModel>[].obs;
  final RxInt currentIndex = 0.obs;

  @override

  void onInit() { 
    super.onInit();
    fetchPvbData();
  }

  void fetchPvbData() async {
    try{
      isLoading.value = true;
      final response = await ApiClient.get('getpvbUrl',
      queryParams: {
        'tag': sliderTag!,
      },
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> data = response.data;
        final items = data.map((item) => PvbModel.fromJson(item)).toList();
        pvbItems.assignAll(items);
      } else {
        Get.snackbar('Error', 'Failed to load Pvb items', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent, colorText: Colors.white);
      }
    } catch(e){
      Get.snackbar('Network Error', 'Failed to fetch PVBanners. Please try again later.', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }
}