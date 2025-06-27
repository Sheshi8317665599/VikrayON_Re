import 'package:get/get.dart';
import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/controllers/location_controller.dart';
import 'package:vikrayon/controllers/product_controller.dart';


class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.lazyPut(()=>LocationController());
    Get.lazyPut(()=>ForgotPasswordController());
    Get.lazyPut(()=> ProductController());

  }
}
