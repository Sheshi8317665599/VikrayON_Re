// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vikrayon/utils/colors.dart';

class Vendor {
  final String name;
  final double rating;
  final int reviewCount;
  final String location;
  final double distance;
  final String cuisine;
  final String priceForTwo;
  final String imageUrl;
  final String deliveryTime;
  final String discount;
  final String categoryvendorTag;

  Vendor(
      {required this.name,
      required this.rating,
      required this.reviewCount,
      required this.location,
      required this.distance,
      required this.cuisine,
      required this.priceForTwo,
      required this.imageUrl,
      required this.deliveryTime,
      required this.discount,
      required this.categoryvendorTag});

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      name: json['name'],
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      location: json['location'],
      distance: json['distance'].toDouble(),
      cuisine: json['cuisine'],
      priceForTwo: json['priceForTwo'],
      imageUrl: json['imageUrl'],
      deliveryTime: json['deliveryTime'],
      discount: json['discount'],
      categoryvendorTag: json['categoryvendorTag'] ?? '',
    );
  }
}

class VendorController extends GetxController {
  var vendor = <Vendor>[].obs;
  var isLoading = true.obs;

  final Dio dio = Dio();
  //   BaseOptions(
  //   baseUrl: 'https://run.mocky.io/v3/6afea1d1-d557-4fc5-abca-8d9259d8a78c',
  //   connectTimeout: const Duration(seconds: 5),
  //   receiveTimeout: const Duration(seconds: 5),
  // ));
  @override
  void onInit() {
    super.onInit();
    fetchVendor();
  }

  void fetchVendor() async {
    try {
      isLoading(true);
      final response = await dio
          .get('https://run.mocky.io/v3/6afea1d1-d557-4fc5-abca-8d9259d8a78c');
      if (response.statusCode == 200) {
        var list = response.data['vendors'] as List;
        vendor.value = list.map((e) => Vendor.fromJson(e)).toList();
      }
    } catch (e) {
      print("Fetch error: $e");
      Get.snackbar(
          'Network Error', 'Failed to fetch vendors. Please try again later.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    } finally {
      isLoading(false);
    }
  }
}

class VendorDetails extends StatelessWidget {
  final VendorController? vendorController;
  final Function(Vendor vendor) onVendorTap;
  final VoidCallback? onrespectivesectorTap;
  final String? categoryvendorTag;
  const VendorDetails(
      {super.key,
      required this.vendorController,
      required this.onVendorTap,
      required this.categoryvendorTag,
      required this.onrespectivesectorTap});

  @override
  Widget build(BuildContext context) {
    final VendorController controller =
        vendorController ?? Get.put(VendorController());
    return Obx(() {
      if (controller.isLoading.value) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 100.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.r)),
                    )),
              );
            });
      }
      // Filter vendors by categoryvendorTag if provided
      final filteredVendors = controller.vendor.where((v) {
        if (categoryvendorTag == null || categoryvendorTag!.isEmpty) {
          return true;
        }
        return v.categoryvendorTag.toLowerCase() ==
            categoryvendorTag!.toLowerCase();
      }).toList();
      if (filteredVendors.isEmpty) {
        return Center(
          child: Text(
            'No vendors found for this category',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
        );
      }
      return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: filteredVendors.length + 1,
        itemBuilder: (context, index) {
          if (index < filteredVendors.length) {
            final vendor = filteredVendors[index];
            return GestureDetector(
              onTap: () => onVendorTap(vendor),
              child: Container(
                height: 100.h,
                width: 200.w,
                decoration: BoxDecoration(
                  color: AppColors.colorms,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4.r,
                      spreadRadius: 2.r,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16.r)),
                          child: Image.network(
                            vendor.imageUrl,
                            height: 100.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 8.h,
                          right: 8.w,
                          child: Row(
                            children: [
                              Icon(Icons.favorite_border,
                                  color: Colors.white, size: 22.sp),
                              SizedBox(width: 5.w),
                              Icon(Icons.more_vert,
                                  color: Colors.white, size: 22.sp),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 8.h,
                          left: 8.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Text(
                              vendor.deliveryTime,
                              style: TextStyle(
                                color: Authcolors.whiteColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              vendor.name,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Authcolors.whiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.green,
                                  size: 14.sp,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  '${vendor.rating} (${vendor.reviewCount})',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Authcolors.borederColor),
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  '. ${vendor.location}, ${vendor.distance} km',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Authcolors.borederColor),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              '${vendor.cuisine}, ${vendor.priceForTwo} for two',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Authcolors.borederColor),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            if (vendor.discount.isNotEmpty)
                              Row(
                                children: [
                                  Icon(Icons.local_offer,
                                      color: Colors.deepOrange, size: 16.sp),
                                  SizedBox(width: 4.w),
                                  Text(
                                    vendor.discount,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.deepOrangeAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                          ],
                        )),
                  ],
                ),
              ),
            );
          }
          return null;
        },
      );
    });
  }
}

class VendorDetailsScreen extends StatelessWidget {
  final Vendor vendor;
  const VendorDetailsScreen({
    super.key,
    required this.vendor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vendor.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(vendor.imageUrl, height: 200.h, fit: BoxFit.cover),
            SizedBox(height: 10.h),
            Text(
              vendor.name,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.h),
            Text("${vendor.rating} (${vendor.reviewCount})"),
            SizedBox(height: 5.h),
            Text("Location: ${vendor.location}"),
            SizedBox(height: 5.h),
            Text("Distance: ${vendor.distance} km"),
            SizedBox(height: 5.h),
            Text("Cuisine: ${vendor.cuisine}"),
            SizedBox(height: 5.h),
            Text("Price for Two: ${vendor.priceForTwo}"),
            SizedBox(height: 5.h),
            if (vendor.discount.isNotEmpty)
              Text("Discount: ${vendor.discount}",
                  style: TextStyle(color: Colors.red)),
            SizedBox(height: 5.h),
            Text("Delivery Time: ${vendor.deliveryTime} mins"),
          ],
        ),
      ),
    );
  }
}
