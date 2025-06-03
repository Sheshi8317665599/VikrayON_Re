import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikrayon/app_notification_Screen.dart';
import 'package:vikrayon/controllers/widget_controller.dart';
import 'package:vikrayon/ui_helper.dart';
import 'package:vikrayon/utils/colors.dart';
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
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        automaticallyImplyLeading: false,
        leading: SizedBox(
          height: height * 0.1,
          child: TearDropWidget(
            colorb: AppColors.bottomNavigationBarColorLgS,
            subcategoryTag: '',
          ),
        ),
      ),
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
      body: LayoutBuilder(builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: ListView(
            //controller: _hideBottomNavController,
            children: <Widget>[
              // const SizedBox(
              //   height: 10,
              // ),
              // SizedBox(
              //   height: height * 0.1,
              //   child: TearDropWidget(
              //     colorb: AppColors.bottomNavigationBarColorLgS,
              //     subcategoryTag: '',
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: height * 0.15,
                child: Pvb(
                  colorb: AppColors.bottomNavigationBarColorLgS,
                  sliderTag: '',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: height * 0.76,
                child: Pvgp(
                  controller: Get.put(ProductController()),
                  colorb: AppColors.bottomNavigationBarColorLgS,
                  gradient: AppColors.productscreencolourlgsp,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: height * 0.15,
                child: Vb(
                  controller: Get.put(VbController(sliderTag: '')),
                  colorb: AppColors.bottomNavigationBarColorLgS,
                  sliderTag: '',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Pvgp(
                controller: Get.put(ProductController()),
                colorb: AppColors.bottomNavigationBarColorLgS,
                gradient: AppColors.productscreencolourlgsp,
              ),
              Vb(
                colorb: AppColors.bottomNavigationBarColorLgS,
                controller: Get.put(VbController(sliderTag: '')),
                sliderTag: '',
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Plgp(
              //   controller: Get.put(ProductController()),
              //   colorb: AppColors.bottomNavigationBarColorLgS,
              //   gradient: AppColors.productscreencolourlgsp,
              // ),
            ],
          ),
        );
      }),
      //   bottomNavigationBar: AnimatedContainer(
      //     duration: const Duration(seconds: 1),
      //     height: _showBottomNav ? 0 : 70,
      //     child: IconButton(
      //         onPressed: () {},
      //         icon: Icon(
      //           Icons.arrow_drop_up_rounded,
      //           size: 80.sp,
      //           color: Authcolors.whiteColor,
      //         )),
      //   ),
      // );
    );
  }
}

class Vegetables extends StatefulWidget {
  const Vegetables({super.key});

  @override
  State<Vegetables> createState() => _VegetablesState();
}

class _VegetablesState extends State<Vegetables> {
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: height * 0.1,
                      child: TearDropWidget(
                        colorb: AppColors.bottomNavigationBarColorLgS,
                        subcategoryTag: '',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: height * 0.15,
                      child: Pvb(
                        colorb: AppColors.bottomNavigationBarColorLgS,
                        sliderTag: '',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: height * 0.8,
                      child: Pvgp(
                        controller: Get.put(ProductController()),
                        colorb: AppColors.bottomNavigationBarColorLgS,
                        gradient: AppColors.productscreencolourlgsp,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: height * 0.15,
                      child: Vb(
                        controller: Get.put(VbController(sliderTag: '')),
                        colorb: AppColors.bottomNavigationBarColorLgS,
                        sliderTag: '',
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: height * 0.8,
                      child: Pvgp(
                        controller: Get.put(ProductController()),
                        colorb: AppColors.bottomNavigationBarColorLgS,
                        gradient: AppColors.productscreencolourlgsp,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.15,
                      child: Vb(
                        colorb: AppColors.bottomNavigationBarColorLgS,
                        controller: Get.put(VbController(sliderTag: '')),
                        sliderTag: '',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: height * 0.3,
                      width: width * 0.95,
                      child: Plgp(
                        controller: Get.put(ProductController()),
                        colorb: AppColors.bottomNavigationBarColorLgS,
                        gradient: AppColors.productscreencolourlgsp,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

class MeatSeafood extends StatelessWidget {
  const MeatSeafood({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: height * 0.1,
                  child: TearDropWidget(
                    colorb: AppColors.bottomNavigationBarColorLgS,
                    subcategoryTag: '',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: height * 0.15,
                  child: Pvb(
                    colorb: AppColors.bottomNavigationBarColorLgS,
                    sliderTag: '',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: height * 0.72,
                  child: Pvgp(
                    controller: Get.put(ProductController()),
                    colorb: AppColors.bottomNavigationBarColorLgS,
                    gradient: AppColors.productscreencolourlgsp,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: height * 0.15,
                  child: Vb(
                    controller: Get.put(VbController(sliderTag: '')),
                    colorb: AppColors.bottomNavigationBarColorLgS,
                    sliderTag: '',
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: height * 0.72,
                  child: Pvgp(
                    controller: Get.put(ProductController()),
                    colorb: AppColors.bottomNavigationBarColorLgS,
                    gradient: AppColors.productscreencolourlgsp,
                  ),
                ),
                SizedBox(
                  height: height * 0.15,
                  child: Vb(
                    colorb: AppColors.bottomNavigationBarColorLgS,
                    controller: Get.put(VbController(sliderTag: '')),
                    sliderTag: '',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: height * 0.3,
                  width: width * 0.95,
                  child: Plgp(
                    controller: Get.put(ProductController()),
                    colorb: AppColors.bottomNavigationBarColorLgS,
                    gradient: AppColors.productscreencolourlgsp,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
