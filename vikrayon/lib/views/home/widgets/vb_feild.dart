import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vikrayon/controllers/vb_controller.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/utils/controllere_initailizer.dart';

Widget buildvbWidget({required String slidertag}) {
  double height = MediaQuery.of(Get.context!).size.height;
  double width = MediaQuery.of(Get.context!).size.width;
  initvbcontroller(slidertag);
  final controller = Get.find<VbController>(tag: slidertag);
  final vbdata = controller.vbItems;

  return Obx(
    () {
      if (controller.isLoading.value) {
        return SizedBox(
          height: height * 0.15,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                        width: width * 0.45,
                        height: height * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(30),
                        )));
              }),
        );
      }
      return Container(
        height: height * 0.15,
        color: AppColors.scaffoldBackground,
        child: Row(
          children: [
            SizedBox(
              width: width * 0.05,
              height: height * 0.15,
              child: ListView.builder(
                itemCount: vbdata.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final item = vbdata[index];
                  if (index == vbdata.length - 1) {
                    return IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_sharp,
                          color: Colors.white),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                image: NetworkImage(
                                  item.image[index],
                                ),
                                fit: BoxFit.fill),
                            border:
                                Border.all(color: item.borderColor, width: 2),
                          ),
                          height: height * 0.15,
                          width: width * 0.45,
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
