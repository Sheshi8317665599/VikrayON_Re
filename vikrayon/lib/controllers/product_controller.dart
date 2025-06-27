import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/api/api_client.dart';
import 'package:vikrayon/models/product_model.dart';

class ProductController extends GetxController {
  final String? sliderTag;
  ProductController({this.sliderTag});
  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxInt currentIndex = 0.obs;
  final RxMap<int, ProductModel> cartItems = <int, ProductModel>{}.obs;
  final RxSet<int> favourite = <int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts(sliderTag);
  }

  Future<void> fetchProducts(String? sliderTag) async {
    try {
      isLoading.value = true;

    
      final response = await ApiClient.get('getProductsUrl',
      queryParameters:
         sliderTag != null ? {'slider_tag': sliderTag} : null);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final List data = response.data;
        print(data);
        products.value =
            data.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load items');
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

  // Future<void> fetchProductBYSliderTag(String sliderTag) async {
  //   try {
  //     isLoading.value = true;
  //     final dio = await ApiClient.getDio();
  //     final response = await dio.get(ApiClient.getProductsUrl,
  //         queryParameters: {'slider_tag': sliderTag});

  //     if (response.statusCode == 200) {
  //       final List data = response.data;
  //       products.value =
  //           data.map((json) => ProductModel.fromJson(json)).toList();
  //     } else {
  //       Get.snackbar('Error', 'Failed to load items');
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //         'Network Error', 'Failed to fetch products. Please try again later.',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.redAccent,
  //         colorText: Colors.white);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  void loadProductDetails(ProductModel product) {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }

  void addToCart(ProductModel product) => cartItems[product.id] = product;

  void removeFromCart(int productId) => cartItems.remove(productId);

  void toogleCart(ProductModel product) =>
      isInCart(product.id) ? removeFromCart(product.id) : addToCart(product);

  bool isInCart(int productId) => cartItems.containsKey(productId);

  double get carttotal =>
      cartItems.values.fold(0.0, (sum, item) => sum + item.discountPrice);

  void clearcart() => cartItems.clear();

  void toogleFavourite(int productId) => favourite.contains(productId)
      ? favourite.remove(productId)
      : favourite.add(productId);

  bool isFavourite(int productId) => favourite.contains(productId);

  double get favouriteiteTotal => favourite.fold(
        0.0,
        (sum, id) =>
            sum +
            (products.firstWhereOrNull((p) => p.id == id)?.discountPrice ?? 0),
      );

  void clearfavourite() => favourite.clear();
}
// how to use example
// Pgp(
//   sliderTag: 'exclusive_offer',
//   colorb: Colors.orange,
//   gradient: LinearGradient(
//     colors: [Colors.deepOrange, Colors.amber],
//   ),
// ),
