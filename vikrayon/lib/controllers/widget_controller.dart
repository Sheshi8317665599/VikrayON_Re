import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:vikrayon/controllers/product_model.dart';

class TearDropController extends GetxController {
  final String subcategoryTag;

  TearDropController({required this.subcategoryTag});
  var tearDropItems = <TearDropItem>[].obs;
  var isLoading = true.obs;

  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://run.mocky.io/v3/e233275e-7561-4fa6-884f-0201167f5dda',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  ));

  @override
  void onInit() {
    super.onInit();
    fetchTearDropItems();
  }

  Future<void> fetchTearDropItems() async {
    try {
      isLoading.value = true;
      final response = await dio.get('/subcategory/$subcategoryTag');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        tearDropItems.value =
            data.map((item) => TearDropItem.fromJson(item)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load items');
      }
    } catch (e) {
      Get.snackbar('Network Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

// vb controllere

class VbController extends GetxController {
  final String sliderTag;

  VbController({required this.sliderTag});
  var vbItems = <Vb>[].obs;
  var isLoading = true.obs;

  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://run.mocky.io/v3/e233275e-7561-4fa6-884f-0201167f5dda',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  ));

  @override
  void onInit() {
    super.onInit();
    fetchVbItems();
  }

  Future<void> fetchVbItems() async {
    try {
      isLoading.value = true;
      final response = await dio.get('/api/vb-slider/$sliderTag');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        vbItems.value = data.map((item) => Vb.fromJson(item)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load items');
      }
    } catch (e) {
      Get.snackbar('Network Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

class CategoryController extends GetxController {
  var mainBanners = <String>[].obs;
  var categoryicons = <String>[].obs;
  var categoryColors = <Color>[].obs;
  var categoryNames = <String>[].obs;
  var voineimages = <String>[].obs;
  var foodimages = <String>[].obs;
  var livingGeneralsimages = <String>[].obs;
  var fashionimages = <String>[].obs;
  var cervcesImages = <String>[].obs;

  var isLoading = true.obs;

  final Dio dio = Dio();
  Future<void> fetchCategoryData(
      {required String apiUrl,
      required Map<String, dynamic> responseFeilds}) async {
    try {
      isLoading.value = true;

      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        var data = response.data;
        mainBanners.value =
            List<String>.from(data[responseFeilds['mainBanners']]);
        categoryicons.value =
            List<String>.from(data[responseFeilds['categoryIcons']]);
        categoryColors.value = List<Color>.from(
            data[responseFeilds['categoryColors']]
                .map((color) => Color(int.parse(color))));
        categoryNames.value =
            List<String>.from(data[responseFeilds['categoryNames']]);
        voineimages.value =
            List<String>.from(data[responseFeilds['voineImages']]);
        foodimages.value =
            List<String>.from(data[responseFeilds['foodImages']]);
        livingGeneralsimages.value =
            List<String>.from(data[responseFeilds['livingGeneralsImages']]);
        fashionimages.value =
            List<String>.from(data[responseFeilds['fashionImages']]);
        cervcesImages.value =
            List<String>.from(data[responseFeilds['cervcesImages']]);
      } else {
        print('failed to load data : ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class PvbController extends GetxController {
  final String sliderTag;
  PvbController({required this.sliderTag});
  var pvbItems = <Pvb>[].obs;
  var isLoading = true.obs;
  var currentIndex = 0.obs;

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://run.mocky.io/v3/e233275e-7561-4fa6-884f-0201167f5dda',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  @override
  void onInit() {
    super.onInit();
    fetchPVbItems();
  }

  void fetchPVbItems() async {
    try {
      isLoading.value = true;
      final response = await dio.get('/api/pvb-slider/$sliderTag');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        pvbItems.value = data.map((item) => Pvb.fromJson(item)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load items');
      }
    } catch (e) {
      Get.snackbar('Network Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }
}

// product controller
class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;
  var currentIndex = 0.obs;
  var cartItems = <int, Product>{}.obs; // RxMap<int, Product>
  var favourites = <int>{}.obs; // RxMap<int, Product>

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://run.mocky.io/v3/e233275e-7561-4fa6-884f-0201167f5dda',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      final response = await dio.get('/api/products');

      if (response.statusCode == 200) {
        final List data = response.data;
        products.value = data.map((json) => Product.fromJson(json)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load items');
      }
    } catch (e) {
      Get.snackbar('Network Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // loding for product details page 

  void loadProdutDetails(Product product) {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }

  // cart Methods
  void addToCart(Product product) => cartItems[product.id] = product;

  void removeFromCart(int productId) => cartItems.remove(productId);

  void toogleCart(Product product) =>
      isInCart(product.id) ? removeFromCart(product.id) : addToCart(product);

  bool isInCart(int productId) => cartItems.containsKey(productId);

  double get carttotal =>
      cartItems.values.fold(0.0, (sum, item) => sum + item.discountPrice);

  void clearcart() => cartItems.clear();

  // favourite methods
  void toogleFavourite(int productId) => favourites.contains(productId)
      ? favourites.remove(productId)
      : favourites.add(productId);

  bool isFavourite(int productId) => favourites.contains(productId);

  double get favouriteiteTotal => favourites.fold(
        0.0,
        (sum, id) =>
            sum +
            (products.firstWhereOrNull((p) => p.id == id)?.discountPrice ?? 0),
      );

  void clearfavourite() => favourites.clear();
}

// class ProductController extends GetxController {
//   final RxList<Product> _products = <Product>[].obs;
//   final RxList<Product> _favouriteItemsList = <Product>[].obs;
//   final RxMap<int, Product> _cartItems = <int, Product>{}.obs;

//   List<Product> get products => _products.toList();
//   List<int> get favouriteItems =>
//       _favouriteItemsList.map((product) => product.id).toList();
//   Map<int, Product> get cartItems => _cartItems;

//   final Dio dio = Dio();

//   Future<void> loadProductsFromApi() async {
//     try {
//       final response = await dio.get('https//your-api-endpoint.com/products');
//       if (response.statusCode == 200) {
//         List<Product> loadProducts = (response.data as List)
//             .map((json) => Product.fromJson(json))
//             .toList();
//         _products.assignAll(loadProducts);
//       } else {
//         Get.snackbar('Error',
//             'Failed to load products: ${response.statusCode}'); // orginal file name('Failed to load products: ${response.statusCode}');
//       }
//     } catch (e) {
//       Get.snackbar('Error',
//           'Failed to load products: $e'); // orginal file name('Failed to load products: $e');}
//     }
//   }

//   void loadProducts(List<Product> products) {
//     _products.assignAll(products);
//   }

//   void toogleFavourite(int productId) {
//     if (_favouriteItemsList.any((product) => product.id == productId)) {
//       _favouriteItemsList.removeWhere((product) => product.id == productId);
//     } else {
//       final product = _products.firstWhere((product) => product.id == productId,
//           orElse: () => throw Exception('Product not found'));
//       _favouriteItemsList.add(product);
//     }
//   }

//   void addToCart(Product product) {
//     if (_cartItems.containsKey(product.id)) {
//       _cartItems[product.id] = product;
//     } else {
//       _cartItems[product.id] = product;
//     }
//   }

//   void removeFromCart(int productId) {
//     _cartItems.remove(productId);
//   }

//   bool isInCart(int productId) => _cartItems.containsKey(productId);
//   bool isFavourite(int productId) =>
//       _favouriteItemsList.any((product) => product.id == productId);
// }
