import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vikrayon/controllers/pvb_controllers.dart';
import 'package:vikrayon/utils/controllere_initailizer.dart';
Widget buildPvbWidget({required String slidertag}) {
  double height = MediaQuery.of(Get.context!).size.height;
  double width = MediaQuery.of(Get.context!).size.width;

  initpvbcontroller(slidertag);
  final controller = Get.find<PvbController>(tag: slidertag);
  final pvbdata = controller.pvbItems;
  return  Obx(
      () {
        if (pvbdata.isEmpty && controller.isLoading.value) {
          return SizedBox(
            height: height * 0.15,
            width: width*0.95,
            child: CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: (context, index, _) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: double.infinity * 0.15,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
            ),
          );
        }

        return SizedBox(
          height: height * 0.15,
          child: CarouselSlider(
            items: List.generate(pvbdata.length, (index) {
              final item = pvbdata[index];
              return InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: NetworkImage(item.pvbanners[index]),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(
                      width: 2.sp,
                      color: item.pvbordercolor,
                    ),
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: double.infinity * 0.15,
              aspectRatio: 1.5,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 500),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged:controller.onPageChanged,
            ),
          ),
        );
      },
    );
  }
