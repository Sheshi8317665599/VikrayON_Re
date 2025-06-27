import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vikrayon/controllers/product_controller.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/utils/controllere_initailizer.dart';
import 'package:vikrayon/views/screens/livingenerals/products/product_details_page.dart';

Widget buildplgpWidget(
    {required String sliderTag, required bool showOnlyFavourites}) {
  double height = MediaQuery.of(Get.context!).size.height;
  double width = MediaQuery.of(Get.context!).size.width;
  initProductController(sliderTag);
  final controller = Get.find<ProductController>(tag: sliderTag);

  return Obx(() {
    final isLoading = controller.isLoading.value;
    final products = showOnlyFavourites
        ? controller.products
            .where((p) => controller.isFavourite(p.id))
            .toList()
        : controller.products;

    final itemCount = isLoading ? 5 : products.length;

    if (showOnlyFavourites && products.isEmpty) {
      return Center(
          child: Text(
        "No Favourites",
        style: TextStyle(color: Authcolors.whiteColor, fontSize: 20.sp),
      ));
    }
    return ListView.builder(
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (isLoading) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: height * 0.3,
                  width: width * 0.425,
                  decoration: BoxDecoration(
                    color: Authcolors.whiteColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            );
          }

          final product = controller.products[index];

          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  height: height * 0.3,
                  width: width * 0.42,
                  // child: ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemCount: isLoading ? 5 : controller.products.length,
                  //   itemBuilder: (context, index) {
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        () => ProductDetailsPage(product: product),
                      );
                    },
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: height * 0.3,
                            width: width * 0.42,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: AppColors.detailsScreenColorLgS.colors,
                                stops: AppColors.detailsScreenColorLgS.stops,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              border: Border.all(
                                color: AppColors.bottomNavigationBarColorLgS,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Container(
                                      height: height * 0.15,
                                      width: width * 0.42,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(product.image),
                                          fit: BoxFit.contain,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        // Product Name
                                        Text(
                                          product.name,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.scaffoldBackground,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                    //Description
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * 0.038,
                                          width: width * 0.3,
                                          child: Text(
                                            product.description,
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Authcolors.whiteColor,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.5,
                                        ),
                                        Icon(
                                          Icons.shopping_bag,
                                          color: AppColors.scaffoldBackground,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        //Quantity
                                        Text(
                                          product.quantity.toString(),
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: AppColors.scaffoldBackground,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        bottom: 5.0,
                                        top: 5.0,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(
                                                Icons.currency_rupee,
                                                color: Colors.yellow,
                                                size: 15,
                                              ),
                                              // Price & discount
                                              Text(
                                                (product.price *
                                                        (1 -
                                                            product.discount /
                                                                100))
                                                    .toStringAsFixed(2),
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors
                                                      .scaffoldBackground,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              // Price
                                              Text(
                                                product.price.toString(),
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red,
                                                  decoration:
                                                      TextDecoration.combine([
                                                    TextDecoration.lineThrough,
                                                  ]),
                                                  decorationColor: Colors.red,
                                                  decorationThickness: 2.0,
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Obx(() {
                                                bool isInCart = controller
                                                    .isInCart(product.id);
                                                return InkWell(
                                                  onTap: () {
                                                    if (!isInCart) {
                                                      controller
                                                          .addToCart(product);
                                                      Get.snackbar(
                                                        "Added",
                                                        "Item added to cart",
                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM,
                                                        backgroundColor:
                                                            //product
                                                            //   .bordercolor,
                                                            AppColors
                                                                .bottomNavigationBarColorLgS,
                                                        colorText: Authcolors
                                                            .whiteColor,
                                                      );
                                                    } else {
                                                      controller.removeFromCart(
                                                          product.id);
                                                      Get.snackbar(
                                                        "Removed",
                                                        "Item removed from cart",
                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM,
                                                        backgroundColor:
                                                            //product
                                                            //  .bordercolor,
                                                            AppColors
                                                                .bottomNavigationBarColorLgS,
                                                        colorText: Authcolors
                                                            .whiteColor,
                                                      );
                                                    }
                                                  },
                                                  child: AnimatedContainer(
                                                    duration: Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.easeInOut,
                                                    height: 0.03.sp,
                                                    width: 0.13.sp,
                                                    decoration: BoxDecoration(
                                                      color: isInCart
                                                          ? Colors.amberAccent
                                                          : AppColors
                                                              .bottomNavigationBarColorLgS,
                                                      //product.bordercolor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.sp),
                                                      border: Border.all(
                                                        color: Authcolors
                                                            .whiteColor,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        isInCart
                                                            ? "Add+"
                                                            : "Add",
                                                        style: TextStyle(
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Authcolors
                                                              .whiteColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Obx(() {
                                bool isFav = controller
                                    .isFavourite(controller.products[index].id);
                                return GestureDetector(
                                    onTap: () {
                                      controller.toogleFavourite(
                                          controller.products[index].id);

                                      Get.snackbar(
                                        isFav
                                            ? "Removed from favourites"
                                            : " Added to Favourite",
                                        isFav
                                            ? "Item Removed from favourites"
                                            : " Item Added to Favourite",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: AppColors
                                            .bottomNavigationBarColorLgS,
                                        colorText: Authcolors.whiteColor,
                                      );
                                    },
                                    child: Icon(
                                      isFav
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isFav
                                          ? Colors.red
                                          : Authcolors.borederColor,
                                      size: 30.sp,
                                    ));
                              })),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  });
}
