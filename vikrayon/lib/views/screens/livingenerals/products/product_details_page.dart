// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vikrayon/controllers/product_controller.dart';
import 'package:vikrayon/models/product_model.dart';
import 'package:vikrayon/utils/colors.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    RxInt quantity = 1.obs;
    final controller = Get.find<ProductController>();

    List<String> carouselImages = [product.image, ...product.relatedImages];
    if (carouselImages.length < 3) {
      carouselImages.addAll(
          List.generate(3 - carouselImages.length, (_) => product.image));
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          product.name,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Obx(() {
            bool isFav = controller.isFavourite(product.id);
            return IconButton(
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                controller.toogleFavourite(product.id);
              },
            );
          }),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return buidShimmer(height);
          }

          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: AppColors.detailsScreenColorLgS,
            ),
            child: Column(
              children: [
                buildCarosel(controller, product , height),
                buildDotIndicator(controller, product),
                buildProductInfo(product , quantity),
                buildBottomBar(controller, product ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget buidShimmer(double height) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(height: height * 0.3, color: Colors.white),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: List.generate(
                  6,
                  (index) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                            height: height * 0.08, color: Colors.white),
                      )),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCarosel(
      ProductController controller, ProductModel product, double height) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height * 0.3,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
        onPageChanged: (index, _) => controller.currentIndex.value = index,
      ),
      items: [product.image, ...product.relatedImages].map((imageUrl) {
        return Builder(builder: (_) {
          return Container(
            height: height * 0.25,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          );
        });
      }).toList(),
    );
  }

  Widget buildDotIndicator(ProductController controller, ProductModel product) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [product.image, ...product.relatedImages]
              .asMap()
              .entries
              .map(
                (entry) => Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.currentIndex.value == entry.key
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
              )
              .toList(),
        ));
  }

  Widget buildProductInfo(ProductModel product, RxInt quantity) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Obx(
                  () => Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (quantity.value > 0.5) quantity.value--;
                        },
                      ),
                      Text("${quantity.value}kg",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          quantity.value++;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              product.description,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 80.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: product.relatedImages.map(
                  (imageUrl) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(imageUrl));
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomBar(ProductController controller, ProductModel product) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Price: ${product.price}/kg",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                )),
            Obx(
              () {
                final isInCart = controller.isInCart(product.id);
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isInCart ? Colors.red : Colors.green,
                  ),
                  onPressed: () {
                    if (!isInCart) {
                      controller.addToCart(product  );
                      Get.snackbar("Added", "Item added to cart",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green);
                    } else {
                      controller.removeFromCart(product.id);
                      Get.snackbar("Removed", "Item removed from cart",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red);
                    }
                  },
                  child: Text(
                    isInCart ? "Remove" : "Add to cart",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


