import 'package:get/get.dart';
import 'package:vikrayon/controllers/category_controller.dart';
import 'package:vikrayon/controllers/product_controller.dart';
import 'package:vikrayon/controllers/pvb_controllers.dart';
import 'package:vikrayon/controllers/sector_controller.dart';
import 'package:vikrayon/controllers/tear_drop_sub_controller.dart';
import 'package:vikrayon/controllers/vb_controller.dart';

// sector controller
void initSectorController(String sectorTag) {
  Get.lazyPut(()=>SectorController(sectorTag: sectorTag), tag: sectorTag);
}
// initSectorController(sectorTag);

// category controller

void initCategoryController(String categoryTag) {
  if(!Get.isRegistered<CategoryFeildController>(tag: categoryTag)){
    Get.lazyPut(() => CategoryFeildController(categoryTag: categoryTag), tag: categoryTag);
  }
}
// initCategoryController(categoryTag); 

// initTearDropController
void initTearDropController(String subcategoryTag) {
  if(!Get.isRegistered<TearDropController>(tag: subcategoryTag)){
    Get.lazyPut(()=> TearDropController(subcategoryTag: subcategoryTag), tag: subcategoryTag);
  }
}
// initTearDropController(subcategoryTag);

// initpvbcontroller
void initpvbcontroller(String sliderTag) {
  if(!Get.isRegistered<PvbController>(tag: sliderTag)){
    Get.lazyPut(() => PvbController(sliderTag: sliderTag), tag: sliderTag);
  }
}
// initpvbcontroller(sliderTag);

// initvbcontroller

void initvbcontroller(String sliderTag) {
  if(!Get.isRegistered<VbController>(tag: sliderTag)){
    Get.lazyPut(() => VbController(sliderTag: sliderTag), tag: sliderTag);
  }
}
// initvbcontroller(sliderTag);

// initProductController
void initProductController(String sliderTag) {
  if(!Get.isRegistered<ProductController>(tag:sliderTag)){ 
  Get.lazyPut(() => ProductController(sliderTag: sliderTag), tag: sliderTag);
  }
}
// initProductController(sliderTag);