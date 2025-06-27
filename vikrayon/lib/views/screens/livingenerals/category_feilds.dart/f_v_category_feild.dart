import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/app_notification_Screen.dart';
import 'package:vikrayon/controllers/product_controller.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/home/widgets/pvb_feild.dart';
import 'package:vikrayon/views/home/widgets/pvgp_feild.dart';
import 'package:vikrayon/views/home/widgets/vb_feild.dart';
import 'package:vikrayon/widgets/app_bar_feild.dart';
import 'package:vikrayon/widgets/cart_item.dart';
import 'package:vikrayon/widgets/favourite_item.dart';

class FVCategoryFeild extends StatefulWidget {
  const FVCategoryFeild({super.key});

  @override
  State<FVCategoryFeild> createState() => _FVCategoryFeildState();
}

class _FVCategoryFeildState extends State<FVCategoryFeild>
    with TickerProviderStateMixin {
  @override
  // void initState() {
  //   super.initState();
  //   _hideBottomNavController.addListener(() {
  //     if (_hideBottomNavController.position.userScrollDirection ==
  //         ScrollDirection.reverse) {
  //       setState(() {
  //         _showBottomNav = false;
  //       });
  //     } else {
  //       setState(() {
  //         _showBottomNav = true;
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBarsbs(
            onPressedNotification: () => AppNotificationScreen(),
            onPressedSearchbar: () {},
            onPressedwathasapp: () {},
            imageLogo: "assets/icons/VFruits-LETTER (Small).png",
            gradientcolourAppbar: AppColors.appBarColorLgS,
            colorsearchBorder: AppColors.bottomNavigationBarColorCvS,
            onPressedfavourite: () async {
              Get.to(() => FavouriteItem());
            },
            onPressedCartPge: () async {
              Get.to(() => CartItem());
            },
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SegmentedTabControl(
                tabs: [
                  // Fruits Tasb
                  SegmentTab(
                    label: 'Fruits',
                    color: AppColors.bottomNavigationBarColorLgS,
                    textColor: AppColors.scaffoldBackground,
                    selectedTextColor: Authcolors.whiteColor,
                  ),
                  // Vegetables Tab
                  SegmentTab(
                    label: 'Vegetables',
                    color: AppColors.bottomNavigationBarColorLgS,
                    textColor: AppColors.scaffoldBackground,
                    selectedTextColor: Authcolors.whiteColor,
                  ),

                  SegmentTab(
                    label: 'Meat & Sea Fopods',
                    color: AppColors.bottomNavigationBarColorLgS,
                    textColor: AppColors.scaffoldBackground,
                    selectedTextColor: Authcolors.whiteColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: TabBarView(
                children: [
                  Fruits(),
                  Vegetables(),
                  MeatSeafood(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Fruits extends StatefulWidget {
  const Fruits({super.key});

  @override
  State<Fruits> createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {
  void initProductController(String sliderTag) {
    if (!Get.isRegistered<ProductController>(tag: sliderTag)) {
      Get.lazyPut(() => ProductController(sliderTag: sliderTag),
          tag: sliderTag);
    }
  }
  // final ScrollController _hideBottomNavController = ScrollController();
  // bool _showBottomNav = true;
  // @override
  // void initState() {
  //   super.initState();
  //   _hideBottomNavController.addListener(() {
  //     if (_hideBottomNavController.position.userScrollDirection ==
  //         ScrollDirection.reverse) {
  //       setState(() {
  //         _showBottomNav = false;
  //       });
  //     } else {
  //       setState(() {
  //         _showBottomNav = true;
  //       });
  //     }
  //   });
  // }

  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(10),
      //     child: buildTearDropSection(context, 'Fruits')),
      // appBar: AppBar(
      //   backgroundColor: AppColors.scaffoldBackground,
      //   automaticallyImplyLeading: false,
      //   leading: SizedBox(
      //     height: height * 0.1,
      //     width: width * 0.9,
      //     child: buildTearDropSection(context, 'Fruits'),
      //   ),
      // ),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(50),
      //   child: AppBarsbs(
      //     onPressedNotification: () => AppNotificationScreen(),
      //     onPressedSearchbar: () {},
      //     onPressedwathasapp: () {},
      //     imageLogo: "assets/icons/VFruits-LETTER (Small).png",
      //     gradientcolourAppbar: AppColors.appBarColorLgS,
      //     colorsearchBorder: AppColors.bottomNavigationBarColorCvS,
      //     onPressedfavourite: () async {
      //       Get.to(() => FavouriteItem());
      //     },
      //     onPressedCartPge: () async {
      //       Get.to(() => CartItem());
      //     },
      //   ),
      // ),
      // body: ListView.builder(

      //     scrollDirection: Axis.vertical,
      //     itemBuilder: (context, index) {
      //       return Column(children: [

      //           SizedBox.expand(
      //             child: buildpvgpWidget(
      //                   sliderTag: 'Fruits', batchindex: index),
      //           ),
      //         // SizedBox(
      //         //     height: height * 0.15,
      //         //     width: width * 0.95,
      //         //     child: buildvbWidget(slidertag: 'Fruits')),

      //           SizedBox.expand(
      //                child: buildpvgpWidget(
      //                   sliderTag: 'Fruits', batchindex: index),
      //              ),
      //       ]);
      //     })
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Column(children: [
                buildPvbWidget(slidertag: 'Products'),
                buildpvgpWidget(sliderTag: 'Products', batchindex: index),
                buildvbWidget(slidertag: 'Products'),
                buildpvgpWidget(sliderTag: 'Products', batchindex: index),
              ]);
            }),
          )
        ],
      ),
    );
  }
}

class Vegetables extends StatefulWidget {
  const Vegetables({super.key});

  @override
  State<Vegetables> createState() => _VegetablesState();
}

class _VegetablesState extends State<Vegetables> {
  void initProductController(String sliderTag) {
    if (!Get.isRegistered<ProductController>(tag: sliderTag)) {
      Get.lazyPut(() => ProductController(sliderTag: sliderTag),
          tag: sliderTag);
    }
  }

  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    //  double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(50),
      //   child: AppBarsbs(
      //     onPressedNotification: () => AppNotificationScreen(),
      //     onPressedSearchbar: () {},
      //     onPressedwathasapp: () {},
      //     imageLogo: "assets/icons/VFruits-LETTER (Small).png",
      //     gradientcolourAppbar: AppColors.appBarColorLgS,
      //     colorsearchBorder: AppColors.bottomNavigationBarColorCvS,
      //     onPressedfavourite: () async {
      //       Get.to(() => FavouriteItem());
      //     },
      //     onPressedCartPge: () async {
      //       Get.to(() => CartItem());
      //     },
      //   ),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Column(children: [
                buildPvbWidget(slidertag: 'Fruits'),
                buildpvgpWidget(sliderTag: 'Fruits', batchindex: index),
                buildvbWidget(slidertag: 'Fruits'),
                buildpvgpWidget(sliderTag: 'Fruits', batchindex: index),
              ]);
            }),
          )
        ],
      ),
    );
  }
}

class MeatSeafood extends StatelessWidget {
  const MeatSeafood({super.key});
  void initProductController(String sliderTag) {
    if (!Get.isRegistered<ProductController>(tag: sliderTag)) {
      Get.lazyPut(() => ProductController(sliderTag: sliderTag),
          tag: sliderTag);
    }
  }

  @override
  Widget build(BuildContext context) {
    //  double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(50),
      //   child: buildTearDropSection(context, 'Meat Seafood'),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Column(children: [
                buildPvbWidget(slidertag: 'Fruits'),
                buildpvgpWidget(sliderTag: 'Fruits', batchindex: index),
                buildvbWidget(slidertag: 'Fruits'),
                buildpvgpWidget(sliderTag: 'Fruits', batchindex: index),
              ]);
            }),
          )
        ],
      ),
    );
  }
}

class Grocerys extends StatelessWidget {
  const Grocerys({super.key});
  void initProductController(String sliderTag) {
    if (!Get.isRegistered<ProductController>(tag: sliderTag)) {
      Get.lazyPut(() => ProductController(sliderTag: sliderTag),
          tag: sliderTag);
    }
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(50),
      //   child: buildTearDropSection(context, 'Meat Seafood'),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Column(children: [
                buildPvbWidget(slidertag: 'Fruits'),
                buildpvgpWidget(sliderTag: 'Fruits', batchindex: index),
                buildvbWidget(slidertag: 'Fruits'),
                buildpvgpWidget(sliderTag: 'Fruits', batchindex: index),
              ]);
            }),
          )
        ],
      ),
    );
  }
}


