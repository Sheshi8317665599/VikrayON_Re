// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'package:vikrayon/controllers/tear_drop_sub_controller.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/utils/controllere_initailizer.dart';

Widget buildTearDropSection(BuildContext context, String sliderTag) {
  initTearDropController(sliderTag);
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  final TearDropController controller =
      Get.find<TearDropController>(tag: sliderTag);

  return Obx(() {
    if (controller.isLoading.value) {
      return SizedBox(
          height: height * 0.1,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Column(
                      children: [
                        Container(
                          height: height * 1,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              topLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Container(
                          height: height * 0.06,
                          width: width * 0.140,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ));
            },
          ));
    }
    return SizedBox(
      height: height * 0.2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.tearDropProduct.length,
          itemBuilder: (context, index) {
            final item = controller.tearDropProduct[index];
            final borderColor = hexToColor(item.borderColor);
            return GestureDetector(
                onTap: () {
                  //   final target = getDynamicPage(item.targetPage, item.targetIndex);
                  //   if (target != null) {
                  //     Get.to(() => target);
                  //   } else {
                  //     Get.snackbar('Navigation Error', 'Page not defined');
                  //   }
                },
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.06,
                          width: width * 0.0140,
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColor, width: 2),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              topLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              topLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                            child: Image.network(
                              item.logo,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                Icons.error,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.sp),
                        Text(
                          item.name,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )));
          }),
    );
  });
}

// class SubCategory extends StatelessWidget {
//   final String sliderTag;
//    SubCategory({
//     Key? key,
//     required this.sliderTag,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
    
//     return Scaffold(
//       appBar:  AppBar(
//           automaticallyImplyLeading: false,
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(0),
//               gradient: categorydata.gradientcolourAppbar,
//             ),
//           ),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Image(
//                   image: AssetImage(categorydata.imageLogo),
//                   height: 100.sp,
//                   width: 100.sp),
//               SizedBox(width: 1.sp),
//               Expanded(
//                 child: Container(
//                   height: height * 0.045,
//                   width: width * 0.55,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade900.withOpacity(0.5),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: SearchBar(
//                     backgroundColor:
//                         WidgetStateProperty.all(Colors.transparent),
//                     elevation: WidgetStateProperty.all(0),
//                     side: WidgetStateProperty.all(BorderSide(
//                         color: categorydata.colorsearchBorder, width: 2)),
//                     leading: Icon(
//                       Icons.search,
//                       color: Authcolors.whiteColor,
//                       size: 20,
//                     ),
//                     hintText: categorydata.searchText,
//                     hintStyle: WidgetStateProperty.all(TextStyle(
//                         color: Authcolors.whiteColor, fontSize: 12.sp)),
//                     textStyle: WidgetStateProperty.all(
//                       TextStyle(
//                         color: Authcolors.whiteColor,
//                         fontSize: 15.sp,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 2),
//               InkWell(
//                 onTap: controller.onPressedNotification,
//                 child: Icon(
//                   Icons.notifications_none,
//                   size: 30.sp,
//                   color: Authcolors.whiteColor,
//                 ),
//               ),
//               const SizedBox(width: 2),
//               InkWell(
//                 onTap: controller.onPressedSocaialapp,
//                 child: SizedBox(
//                   height: 20.sp,
//                   width: 20.sp,
//                   child: Image.asset(
//                     categorydata.socialapplogo,
//                     height: 20.sp,
//                     width: 20.sp,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: ListView.builder(
//             itemCount: 10,
//             scrollDirection: Axis.vertical,
//             itemBuilder: (context, index) {
//               return Column(children: [
//                 SizedBox(
//                     height: height * 0.15,
//                     width: width * 0.45,
//                     child: buildPvbWidget(slidertag: 'Vegetables')),
//                 SizedBox(
//                     height: height * 0.80,
//                     width: width * 0.95,
//                     child: buildpvgpWidget(sliderTag: 'Vegetables')),
//                 SizedBox(
//                     height: height * 0.15,
//                     width: width * 0.45,
//                     child: buildvbWidget(slidertag: 'Vegetables')),
                
//             ]);}));
    
//   }
// }
