import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vikrayon/controllers/product_controller.dart';
import 'package:vikrayon/models/product_model.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/utils/controllere_initailizer.dart';
import 'package:vikrayon/views/home/widgets/ps_rating.dart';
import 'package:vikrayon/views/screens/livingenerals/products/product_details_page.dart';

Widget buildpvgpWidget({required String sliderTag, required int batchindex}) {
  double height = MediaQuery.of(Get.context!).size.height;
  double width = MediaQuery.of(Get.context!).size.width;

  initProductController(sliderTag);
  final controller = Get.find<ProductController>(tag: sliderTag);

  final products = controller.products;

  return Obx(
    () {
      if (controller.isLoading.value) {
        return SizedBox(
          height: height * 0.7,
          width: width * 0.95,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.59,
            ),
            itemBuilder: (_, __) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            itemCount: 6,
          ),
        );
      }
      int startIndex = batchindex * 4;
      int endIndex =
          (startIndex + 4 > products.length) ? products.length : startIndex + 4;
      final productBatch = products.sublist(startIndex, endIndex);
      int rowsNeeded = (productBatch.length / 4).ceil();
      List<List<ProductModel>> productRooms = [];
      for (int i = 0; i < rowsNeeded; i++) {
        int start = i * 4;
        int end =
            (start + 4 > productBatch.length) ? productBatch.length : start + 4;
        productRooms.add(productBatch.sublist(start, end));
      }
      return SizedBox(
        height: 0.8.sh,
        width: 0.95.sw,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.59,
                ),
                itemCount: productBatch.length,
                itemBuilder: (context, index) {
                  final product = productBatch[index];

                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => ProductDetailsPage(product: product),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 0.5.sh,
                          width: 0.45.sw,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors:

                                  //  product.gradientColors
                                  AppColors.detailsScreenColorLgS.colors,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.2, 1],
                            ),
                            // border: Border.all(
                            //   color:
                            //       //product.bordercolor!
                            //       AppColors.bottomNavigationBarColorLgS,
                            //   width: 2.sp,
                            // ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(
                                    height: 0.22.sh,
                                    width: 0.42.sw,
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Product Name
                                        Text(
                                          products[index].name,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.scaffoldBackground,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          width: 2.sp,
                                        ),
                                        PSRating(
                                            rating: products[index].rating,
                                            size: 20.sp),
                                        SizedBox(
                                          width: 2,
                                        ),
                                      ],
                                    ),

                                    //Description
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 0.038.sh,
                                          width: 0.3.sw,
                                          child: Text(
                                            products[index].description,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Authcolors.whiteColor,
                                            ),
                                          ),
                                        ),

                                        Icon(
                                          Icons.shopping_bag,
                                          color: AppColors.scaffoldBackground,
                                          size: 20.sp,
                                        ),
                                        // //Quantity
                                        Text(
                                          products[index].quantity.toString(),
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: AppColors.scaffoldBackground,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.currency_rupee,
                                              color: Colors.yellow,
                                              size: 15,
                                            ),
                                            // Price & discount
                                            Text(
                                              '${product.discountPrice}',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors
                                                    .scaffoldBackground,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            // Price
                                            Text(
                                              '${product.price}',
                                              style: TextStyle(
                                                fontSize: 12.sp,
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
                                                          SnackPosition.BOTTOM,
                                                      backgroundColor:
                                                          // product
                                                          //bordercolor,
                                                          AppColors
                                                              .bottomNavigationBarColorLgS,
                                                      colorText:
                                                          Authcolors.whiteColor,
                                                    );
                                                  } else {
                                                    controller.removeFromCart(
                                                        product.id);
                                                    Get.snackbar(
                                                      "Removed",
                                                      "Item removed from cart",
                                                      snackPosition:
                                                          SnackPosition.BOTTOM,
                                                      backgroundColor:
                                                          //product
                                                          // .bordercolor,
                                                          AppColors
                                                              .bottomNavigationBarColorLgS,
                                                      colorText:
                                                          Authcolors.whiteColor,
                                                    );
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 100),
                                                  curve: Curves.easeInOut,
                                                  height: 0.03.sh,
                                                  width: 0.13.sw,
                                                  decoration: BoxDecoration(
                                                    color: isInCart
                                                        ? Colors.amberAccent
                                                        : AppColors
                                                            .bottomNavigationBarColorLgS,
                                                    // product.bordercolor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.sp),
                                                    border: Border.all(
                                                      color:
                                                          Authcolors.whiteColor,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      isInCart ? "Add+" : "Add",
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // if ((product.discount) > 0)
                        //   Align(
                        //     alignment: Alignment.topLeft,
                        //     child: Container(
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 6, vertical: 2),
                        //       decoration: BoxDecoration(
                        //           color: Colors.redAccent,
                        //           borderRadius: BorderRadius.circular(4)),
                        //       child: Text("${product.discount} % off",
                        //           style: TextStyle(
                        //             fontSize: 10.sp,
                        //             color: Authcolors.whiteColor,
                        //             fontWeight: FontWeight.bold,
                        //           )),
                        //     ),
                        //   ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if ((product.discount) > 0)
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Text("${product.discount} % off",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Authcolors.whiteColor,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Obx(() {
                                    bool isFav = controller.isFavourite(
                                        controller.products[index].id);
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
