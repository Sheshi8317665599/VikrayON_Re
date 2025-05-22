import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:vikrayon/controllers/product_model.dart';

// class AppBarController extends GetxController {
//   final Dio _dio = Dio(BaseOptions(
//     baseUrl: 'https://vikrayon.com',
//   ));

//   final RxMap<String, AppBarModel> appBarModel = <String, AppBarModel>{}.obs;
//   final RxBool isLoading = true.obs;

//   Future<void> fetchAllAppBarModel() async {
//     try {
//       isLoading.value = true;
//       final response = await _dio.get('/appbar/model');
//       final List data = response.data['appbars'];
//       for (var item in data) {
//         final model = AppBarModel.fromJson(item);
//         appBarModel[model.id] = model;
//       }
//     } catch (e) {
//       Get.snackbar('Network Error', e.toString());
//     } finally {
//       isLoading.value = false;
//     }

//     AppBarModel? getmodelById(String id) => AppBarModel[id];

//     @override
//     void onInit() {
//       super.onInit();
//       fetchAllAppBarModel();
//     }

//   }
// }

class TearDropController extends GetxController {
  final String subcategoryTag;

  TearDropController({required this.subcategoryTag});
  var tearDropItems = <TearDropItem>[].obs;
  var isLoading = true.obs;

  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://run.mocky.io/v3/96ccc2b8-1279-4529-bff5-2bad4e14f2d3',
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


// category controller
 
class PvbController extends GetxController {
  final String sliderTag;
  PvbController({required this.sliderTag});
  var pvbItems = <Pvb>[].obs;
  var isLoading = true.obs;
  var currentIndex = 0.obs;

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://dca9-223-230-113-217.ngrok-free.app/',
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
      baseUrl: 'https://dca9-223-230-113-217.ngrok-free.app/',
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
      final response = await dio.get('products');

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
