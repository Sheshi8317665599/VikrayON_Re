import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vikrayon/controllers/tear_drop_sub_controller.dart';
import 'package:vikrayon/utils/colors.dart';

Widget buildTearDropSection(BuildContext context,String sliderTag) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  final TearDropController controller = Get.put(TearDropController(subcategoryTag:sliderTag));

  return Obx((){
    if(controller.isLoading.value){
      return SizedBox(
        height: height * 0.1,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                children: [
                  Container(
                    height: height * 0.06,
                    width: width * 0.140,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        topLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),),
                    ),
               ), 
               const SizedBox(height: 2,),
               Container(
                height: height * 0.06,
                width: width * 0.12,color: Colors.white,),
               ],
              ),
            ));
          },
        )
      );
    }
    return SizedBox(
      height: height * 0.1,
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
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                height: height * 0.06,
                width: width * 0.0140,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor,width: 2),
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
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.error,
                    ),
                  ),
                ),
              ),
               SizedBox(height: 8.sp),
              Text(item.name,style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),),
            ],
          ))
        );
      }  
      ),
      );
  });
}