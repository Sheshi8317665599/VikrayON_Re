
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/api/api_client.dart';
import 'package:vikrayon/models/vb_model.dart';

class VbController  extends GetxController{
  final String? sliderTag;
  VbController({
    this.sliderTag});

  final RxList<VbModel> vbItems = <VbModel>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchvbData();
  }

  void fetchvbData() async {
    try{
      isLoading.value = true;
      final response = await ApiClient.get('getvbUrl',
        queryParameters: {
          'tag': sliderTag!,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> data = response.data;
        final items = data.map((item) => VbModel.fromJson(item)).toList();
        vbItems.assignAll(items);
      } else {
        Get.snackbar('Error', 'Failed to load Vb items', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent, colorText: Colors.white);
      }
    } catch(e){
      Get.snackbar('Network Error', 'Failed to fetch Vbanners. Please try again later.', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}