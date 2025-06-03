import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/models/tear_sub_model.dart';

class TearDropController extends GetxController {
  final String subcategoryTag;
  TearDropController({required this.subcategoryTag});
  var tearDropProduct = <TearDropProduct>[].obs;
  var isLoading = true.obs;

  final Dio dio = AuthController.to.dio;

  @override
  void onInit() {
    super.onInit();
    fetchTearDropItems();
  }

  Future<void> fetchTearDropItems() async {
    try {
      isLoading.value = true;
      final response = await dio.get('/subcategory', queryParameters: {
        "tag": subcategoryTag,
      });
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        tearDropProduct.value = data.map((item)=> TearDropProduct.fromJson(item)).toList();
      } else {
        Get.snackbar('Network Error', 'Failed to Fetch Items. Try again later.', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent, colorText: Colors.white);
      } 
    } catch (e) {
      Get.snackbar('Network Error', 'Failed to Fetch Items. Try again later.', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  void toogleFavourite(int id) {
    final index = tearDropProduct.indexWhere((item) => item.id == id);
    if (index != -1) {
      tearDropProduct[index].isFavourite = !tearDropProduct[index].isFavourite;
      tearDropProduct.refresh();
    }
  }

  void toogleCart(int id) {
    final index = tearDropProduct.indexWhere((item) => item.id == id);
    if (index != -1) {
      tearDropProduct[index].isInCart = !tearDropProduct[index].isInCart;
      tearDropProduct.refresh();
    }
  }
}