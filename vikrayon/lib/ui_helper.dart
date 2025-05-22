// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'package:vikrayon/controllers/widget_controller.dart';
import 'package:vikrayon/discount_page.dart';
import 'package:vikrayon/main_screen.dart';
import 'package:vikrayon/profile_screen.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/home/cart/cervices_cart_screen.dart';
import 'package:vikrayon/views/home/cart/fashoin_cart_screen.dart';
import 'package:vikrayon/views/home/cart/foods_cart_screen.dart';
import 'package:vikrayon/views/home/cart/living_generals_cart_screen.dart';
import 'package:vikrayon/views/home/cart/main_cart_screen.dart';
import 'package:vikrayon/views/home/favourite/cervces_favourite_screen.dart';
import 'package:vikrayon/views/home/favourite/fashion_favourite_screen.dart';
import 'package:vikrayon/views/home/favourite/food_favourite_screen.dart';
import 'package:vikrayon/views/home/favourite/living_generals__favourite_screen.dart';
import 'package:vikrayon/views/home/favourite/main_favourite_screen.dart';
import 'package:vikrayon/views/home/home_screen/home_screen.dart';
import 'package:vikrayon/views/main/cervices_main_screen.dart';
import 'package:vikrayon/views/main/fashion_main_screen.dart';
import 'package:vikrayon/views/main/food_main_screen.dart';
import 'package:vikrayon/views/main/living_generals_main_screen.dart';
import 'package:vikrayon/views/screens/cevices_screen.dart';
import 'package:vikrayon/views/screens/fashion_screens.dart';
import 'package:vikrayon/views/screens/foods_screens.dart';
import 'package:vikrayon/views/screens/living_generals.dart';
import 'package:vikrayon/views/screens/livingenerals/category_feilds.dart/f_v_category_feild.dart';
import 'package:vikrayon/views/screens/livingenerals/products/product_details_page.dart';
import 'package:vikrayon/views/screens/voni_e_screens.dart';

class UiHelper {
  // MAIN page Banners

  static List<String> mainBanners = [
    "assets/img/main_screen/vonc_main_banner (Small).jpg",
    "assets/img/main_screen/vonc food banner (Small).png",
    "assets/img/main_screen/Green And Gold Overlay Fresh Foods Email Header (Small).png",
    "assets/img/main_screen/Fashion Sale Landscape Banner (Small).png",
    "assets/img/main_screen/VOnc_Mechanic Shop Services Banner (Small).png",
  ];

  // cateogry icons

  static List<String> categoryIcons = [
    "assets/icons/food .png",
    "assets/icons/grocerys.png",
    "assets/icons/fashion.png",
    "assets/icons/cervices.png",
  ];

  // Category names

  static List<String> categoryNames = [
    "Food",
    "Living Generals",
    "Fashion",
    "Cervces",
  ];

  // Category Colors

  static List<Color> categoryColors = [
    Color(0xff5ce1e6),
    Color(0xff4ce305),
    Color(0xffe3a705),
    Color(0xff737373),
  ];

  // Foods Section Images

  static List<String> foodImages = [
    "assets/img/foods/vonc_m_f_1.png",
    "assets/img/foods/vonc_m_f_2.png",
    "assets/img/foods/vonc_m_f_3 .png",
    "assets/img/foods/vonc_m_f_4.png",
  ];

  // Living Essentails Images

  static List<String> livingEssentailsImages = [
    "assets/img/living_generals/VOnC LE EGGS.png",
    "assets/img/living_generals/VOnC LE Chicken.png",
    "assets/img/living_generals/VOnC LE FLESH.png",
    "assets/img/living_generals/VOnC LE FISH.png",
  ];

  // Fashion Section Images

  static List<String> fashionImages = [
    "assets/img/fashion/vonc clothes Fashion.png",
    "assets/img/fashion/vonc_L-E_P.png",
    "assets/img/fashion/vonc_l-e_s.png",
    "assets/img/fashion/VONC_L-E.png",
  ];

  // Cervces Section Images

  static List<String> cervcesImages = [
    "assets/img/cervces/cervices ad-min.png",
    "assets/img/cervces/VONC D CERVICES-min.png",
    "assets/img/cervces/VONC MOTOR CERVICES-min.png",
    "assets/img/cervces/VONC CAR CERVICES-min.png",
  ];

  // VONI&E Section Images

  static List<String> vonieImages = [
    "assets/icons/vonc_io_main-removebg-preview edited.png",
  ];

  // feilds name in main screen
  static List<String> fieldsName = [
    "Recently Viewed",
    "Trending Offers",
    "Best Sellers",
    "Popular Items",
  ];

  // foods main screen banners

  static List<String> foodMainBanners = [];

  // foods category icons

  static List<String> foodCategoryIcons = [];
  // foods category names

  static List<String> foodCategoryNames = [];
  // foods category colors

  static List<Color> foodCategoryColors = [
    Color(0xff5ce1e6),
  ];

//

  // livingenerals main screen banners

  static List<String> livingGeneralsMainBanners = [
    "assets/img/living_generals/vonc_Le.png",
    "assets/img/living_generals/vonc_le_f_banner.png",
    "assets/img/living_generals/vonc_le_ vegetables banners.png",
    "assets/img/living_generals/vonc-ie_le_ Meat banner.png",
    "assets/img/living_generals/Vonc_le_Grains_banner.png",
  ];

  static List<String> livingGeneralsBanners = [
    "assets/img/living_generals/rv 1.png",
    "assets/img/living_generals/re 2.png",
    "assets/img/living_generals/re 3.png",
    "assets/img/living_generals/RE-4.png",
  ];

  // livingenerals category icons
  static List<String> livingGeneralsCategoryIcons = [
    "assets/img/living_generals/fruits_icon-removebg-preview.png",
    "assets/img/living_generals/vegetables_icon-removebg-preview.png",
    "assets/img/living_generals/meat_ivon-removebg-preview.png",
    "assets/img/living_generals/grains_icon_img-removebg-preview.png",
  ];

  // livingenerals category names
  static List<String> livingGeneralsCategoryNames = [
    "Fruits",
    "Vegetables",
    "Meat",
    "Grains",
  ];

  // livingenerals category colors
  static List<Color> livingGeneralsCategoryColors = [
    Color(0xff4ce305),
  ];

//

  // fashion main screen banners
  static List<String> fashionMainBanners = [];

  // fashion category icons
  static List<String> fashionCategoryIcons = [];

  // fashion category names
  static List<String> fashionCategoryNames = [];

  // fashion category colors
  static List<Color> fashionCategoryColors = [
    Color(0xffe3a705),
  ];
}
//

// // RxInt of main banner index

final RxInt selectedmainBannersIndex = 0.obs;
// // RxInt of category icons index

final RxInt selectedCategoryIconsIndex = 0.obs;
// // RxInt of Food images index

final RxInt selectedFoodImagesIndex = 0.obs;

// // RxInt of Living Essentails images index

final RxInt selectedLivingEssentailsImagesIndex = 0.obs;

// // RxInt of Fashion images index

final RxInt selectedFashionImagesIndex = 0.obs;

// // RxInt of Cervces images index

final RxInt selectedCervcesImagesIndex = 0.obs;

// RxInt of VONI&E images index

final RxInt selectedVonieImagesIndex = 0.obs;

// mainBannerindex

Widget mainBannerindex(int index) {
  switch (index) {
    case 0:
      return DiscountPage();
    case 1:
      return FoodMainScreen();
    case 2:
      return LivingGeneralsMainScreen();
    case 3:
      return FashionMainScreen();
    case 4:
      return CervcesMainScreen();
    default:
      return MainScreen();
  }
}

// categoryIconindex

Widget categoryIconindex(int index) {
  switch (index) {
    case 0:
      return FoodMainScreen();
    case 1:
      return LivingGeneralsMainScreen();
    case 2:
      return FashionMainScreen();
    case 3:
      return CervcesMainScreen();
    default:
      return MainScreen();
  }
}

// foodImageindex

Widget foodImageindex(index) {
  switch (index) {
    default:
      return FoodMainScreen();
  }
}

// getLivingEssentailsImage

Widget livinggeneralsImageindex(index) {
  switch (index) {
    default:
      return LivingGeneralsMainScreen();
  }
}

// fashionImageindex

Widget fashionImageindex(index) {
  switch (index) {
    default:
      return FashionMainScreen();
  }
}

// cervcesImageindex

Widget cervcesImageindex(index) {
  switch (index) {
    default:
      return CervcesMainScreen();
  }
}

// vonieImageindex

Widget vonieImageindex(index) {
  switch (index) {
    default:
      return VoniEScreens();
  }
}

// get livinggenerals category icons screens
Widget livingeneralsCategoryIconindex(int index) {
  switch (index) {
    case 0:
      return FVCategoryFeild();
    case 1:
      return Vegetables();
    case 2:
      return FashionMainScreen();
    case 3:
      return CervcesFavouriteScreen();
    default:
      return MainScreen();
  }
}

// Main Screens bn
List<Widget> ms_screens = [
  HomeScreen(),
  MainFavouriteScreen(),
  MainCart_screen(),
  ProfileScreen(),
];

// Foods Screensbn
List<Widget> fs_screens = [
  FoodsScreens(),
  FoodFavouriteScreen(),
  FoodsCartScreen(),
  ProfileScreen(),
];

// Living Generals Screensbn
List<Widget> lgs_screens = [
  LivingGenerals(),
  LivingGeneralsFavouriteScreen(),
  LivingGeneralsCartScreen(),
  ProfileScreen(),
];

// Fashion Screensbn
List<Widget> fhs_screens = [
  FashionScreens(),
  FashionFavouriteScreen(),
  FashoinCartScreen(),
  ProfileScreen(),
];

// Cervces Screensbn
List<Widget> cs_screens = [
  CevicesScreen(),
  CervcesFavouriteScreen(),
  CervicesCartScreen(),
  ProfileScreen(),
];

// navigation items
// tear drops imases and names
List<String> teardropFImages = [
  "assets/img/living_generals/fruits/apples-removebg-preview.png",
  "assets/img/living_generals/fruits/bannas-removebg-preview.png",
  "assets/img/living_generals/fruits/cherrys-removebg-preview.png",
  "assets/img/living_generals/fruits/dates-removebg-preview.png",
  "assets/img/living_generals/fruits/Elderberrys-removebg-preview.png",
  "assets/img/living_generals/fruits/Figs-removebg-preview.png",
  "assets/img/living_generals/fruits/Grapes-removebg-preview.png",
  "assets/img/living_generals/fruits/Guavas-removebg-preview.png",
  "assets/img/living_generals/fruits/Jackfruits-removebg-preview.png",
  "assets/img/living_generals/fruits/Kiwi-removebg-preview.png",
];

final List<String> categoryNamest = [
  "apples",
  "bannas",
  "cherrys",
  "dates",
  "Elderberrys",
  "Figs",
  "Grapes",
  "Guavas",
  "Jackfruits",
  "Kiwi",
];

class TearDropWidget extends StatefulWidget {
  final String subcategoryTag;
  final Color colorb;

  const TearDropWidget({
    super.key,
    required this.colorb,
    required this.subcategoryTag,
  });

  @override
  State<TearDropWidget> createState() => _TearDropWidgetState();
}

class _TearDropWidgetState extends State<TearDropWidget> {
  @override
  Widget build(BuildContext context) {
    final TearDropController controller = Get.put(
        TearDropController(subcategoryTag: widget.subcategoryTag),
        tag: widget.subcategoryTag);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Obx(
      () {
        if (controller.isLoading.value) {
          return SizedBox(
            height: height * 0.1,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.06,
                            width: width * 0.140,
                            decoration: BoxDecoration(
                              color: Authcolors.whiteColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            height: 10,
                            width: width * 0.12,
                            color: Authcolors.whiteColor,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        }
        return SizedBox(
          height: height * 0.1,
          child: GestureDetector(
            onTap: () {},
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.tearDropItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Container(
                        height: height * 0.06,
                        width: width * 0.140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              topLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                            border: Border.all(
                              width: 3.sp,
                              color: widget.colorb,
                            )),
                        child: Container(
                          height: height * 0.058,
                          width: width * 0.139,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: const Radius.circular(25),
                              topLeft: const Radius.circular(25),
                              bottomRight: const Radius.circular(25),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                  controller.tearDropItems[index].image),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        controller.tearDropItems[index].name,
                        style: TextStyle(
                            color: widget.colorb,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

// premium vendor banner

class Pvb extends StatelessWidget {
  final String sliderTag;
  final Color colorb;
  const Pvb({
    super.key,
    required this.colorb,
    required this.sliderTag,
  });

  @override
  Widget build(BuildContext context) {
    final PvbController controller =
        Get.put(PvbController(sliderTag: sliderTag), tag: sliderTag);
    double height = MediaQuery.of(context).size.height;
    return Obx(
      () {
        if (controller.isLoading.value) {
          return SizedBox(
            height: height * 0.75,
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
                height: height * 0.75,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
            ),
          );
        }

        return SizedBox(
          height: height * 0.75,
          child: CarouselSlider(
            items: List.generate(controller.pvbItems.length, (index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: NetworkImage(controller.pvbItems[index].image),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(
                      width: 2.sp,
                      color: colorb,
                    ),
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: height * 0.75,
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
              onPageChanged: controller.onPageChanged,
            ),
          ),
        );
      },
    );
  }
}

// vendor banner

class Vb extends StatelessWidget {
  final String sliderTag;
  final VbController controller;
  final Color colorb;
  const Vb({
    super.key,
    required this.controller,
    required this.colorb,
    required this.sliderTag,
  });

  @override
  Widget build(BuildContext context) {
    final VbController controller = Get.put(VbController(sliderTag: sliderTag));
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Obx(
      () {
        if (controller.isLoading.value) {
          return ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                        width: width * 0.35,
                        height: height * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(30),
                        )));
              });
        }
        return Container(
          height: height * 0.15,
          color: AppColors.scaffoldBackground,
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.vbItems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == controller.vbItems.length - 1) {
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
                                    controller.vbItems[index].image,
                                  ),
                                  fit: BoxFit.fill),
                              border: Border.all(color: colorb, width: 2),
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
}
// pvgp Premium vendor grid products

class Pgp extends StatefulWidget {
  final ProductController controller;
  final Color colorb;
  final LinearGradient gradient;
  const Pgp({
    super.key,
    required this.controller,
    required this.colorb,
    required this.gradient,
  });

  @override
  State<Pgp> createState() => _PgpState();
}

class _PgpState extends State<Pgp> {
  final ProductController controller = Get.put(ProductController());

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Obx(
      () {
        if (controller.isLoading.value) {
          return SizedBox(
            height: height * 0.8,
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
        return SizedBox(
          height: height * 0.80,
          width: width * 0.95,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.59,
                  ),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];

                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => ProductDetailsPage(product: product),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: height * 0.5,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: widget.gradient
                                    .colors, //AppColors.detailsScreenColorLgS.colors
                              ),
                              border: Border.all(
                                color: widget
                                    .colorb, //AppColors.bottomNavigationBarColorLgS,
                                width: 2.sp,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Container(
                                      height: height * 0.22,
                                      width: width * 0.42,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(widget
                                              .controller
                                              .products[
                                                  (index * 4 + currentIndex) %
                                                      widget.controller.products
                                                          .length]
                                              .image),
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
                                          widget
                                              .controller
                                              .products[
                                                  (index * 4 + currentIndex) %
                                                      widget.controller.products
                                                          .length]
                                              .name,
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
                                            widget
                                                .controller
                                                .products[
                                                    (index * 4 + currentIndex) %
                                                        widget.controller
                                                            .products.length]
                                                .description,
                                            style: TextStyle(
                                              fontSize: 12.sp,
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
                                          widget
                                              .controller
                                              .products[
                                                  (index * 4 + currentIndex) %
                                                      widget.controller.products
                                                          .length]
                                              .quantity
                                              .toString(),
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
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.currency_rupee,
                                                color: Colors.yellow,
                                                size: 15,
                                              ),
                                              // Price & discount
                                              Text(
                                                '${widget.controller.products[(index * 4 + currentIndex) % widget.controller.products.length].price * (1 - (widget.controller.products[(index * 4 + currentIndex) % widget.controller.products.length].discount / 100))}'
                                                    .toString(),
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
                                                '${widget.controller.products[(index * 4 + currentIndex) % widget.controller.products.length].price}'
                                                    .toString(),
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
                                                bool isInCart = widget
                                                    .controller
                                                    .isInCart(product.id);
                                                return InkWell(
                                                  onTap: () {
                                                    if (!isInCart) {
                                                      widget.controller
                                                          .addToCart(product);
                                                      Get.snackbar(
                                                        "Added",

                                                        "Item added to cart",

                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM,
                                                        backgroundColor: widget
                                                            .colorb, //AppColors
                                                        //  .bottomNavigationBarColorLgS,
                                                        colorText: Authcolors
                                                            .whiteColor,
                                                      );
                                                    } else {
                                                      widget.controller
                                                          .removeFromCart(
                                                              product.id);
                                                      Get.snackbar(
                                                        "Removed",

                                                        "Item removed from cart",

                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM,
                                                        backgroundColor: widget
                                                            .colorb, //AppColors
                                                        //  .bottomNavigationBarColorLgS,
                                                        colorText: Authcolors
                                                            .whiteColor,
                                                      );
                                                    }
                                                  },
                                                  child: AnimatedContainer(
                                                    duration: Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.easeInOut,
                                                    height: height * 0.03.sp,
                                                    width: width * 0.13.sp,
                                                    decoration: BoxDecoration(
                                                      color: isInCart
                                                          ? Colors
                                                              .amberAccent //  AppColors
                                                          //     .bottomNavigationBarColorLgS
                                                          : widget.colorb,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Obx(() {
                                  bool isFav = widget.controller.isFavourite(
                                      widget.controller.products[index].id);
                                  return GestureDetector(
                                      onTap: () {
                                        widget.controller.toogleFavourite(widget
                                            .controller.products[index].id);

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
}

class Pvgp extends StatefulWidget {
  final ProductController controller;
  final Color colorb;
  final LinearGradient gradient;
  const Pvgp({
    super.key,
    required this.controller,
    required this.colorb,
    required this.gradient,
  });

  @override
  State<Pvgp> createState() => _PvgpState();
}

class _PvgpState extends State<Pvgp> {
  final ProductController controller = Get.find<ProductController>();

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Obx(
      () {
        if (controller.isLoading.value) {
          return SizedBox(
            height: height * 0.8,
            width: width * 0.95,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
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
        return SizedBox(
          height: height * 0.80,
          width: width * 0.95,
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
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];

                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => ProductDetailsPage(product: product),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: height * 0.5,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: widget.gradient.colors,
                                //AppColors.detailsScreenColorLgS.colors
                                stops: [0.5, 0.8],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              border: Border.all(
                                color: widget
                                    .colorb, //AppColors.bottomNavigationBarColorLgS,
                                width: 2.sp,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Container(
                                      height: height * 0.22,
                                      width: width * 0.42,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              controller.products[index].image),
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
                                          widget
                                              .controller
                                              .products[
                                                  
                                                      
                                                          index]
                                              .name,
                                          style: TextStyle(
                                            fontSize: 18.sp.sp,
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
                                            widget.controller.products[index]
                                                .description,
                                            style: TextStyle(
                                              fontSize: 12.sp,
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
                                          widget.controller.products[index]
                                              .quantity
                                              .toString(),
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
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.currency_rupee,
                                                color: Colors.yellow,
                                                size: 15,
                                              ),
                                              // Price & discount
                                              Text(
                                                '${widget.controller.products[index].price * (1 - (widget.controller.products[index].discount / 100))}'
                                                    .toString(),
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
                                                '${widget.controller.products[index].price}'
                                                    .toString(),
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
                                                bool isInCart = widget
                                                    .controller
                                                    .isInCart(product.id);
                                                return InkWell(
                                                  onTap: () {
                                                    if (!isInCart) {
                                                      widget.controller
                                                          .addToCart(product);
                                                      Get.snackbar(
                                                        "Added",

                                                        "Item added to cart",

                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM,
                                                        backgroundColor: widget
                                                            .colorb, //AppColors
                                                        //  .bottomNavigationBarColorLgS,
                                                        colorText: Authcolors
                                                            .whiteColor,
                                                      );
                                                    } else {
                                                      widget.controller
                                                          .removeFromCart(
                                                              product.id);
                                                      Get.snackbar(
                                                        "Removed",

                                                        "Item removed from cart",

                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM,
                                                        backgroundColor: widget
                                                            .colorb, //AppColors
                                                        //  .bottomNavigationBarColorLgS,
                                                        colorText: Authcolors
                                                            .whiteColor,
                                                      );
                                                    }
                                                  },
                                                  child: AnimatedContainer(
                                                    duration: Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.easeInOut,
                                                    height: height * 0.03.sp,
                                                    width: width * 0.13.sp,
                                                    decoration: BoxDecoration(
                                                      color: isInCart
                                                          ? Colors
                                                              .amberAccent //  AppColors
                                                          //     .bottomNavigationBarColorLgS
                                                          : widget.colorb,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Obx(() {
                                  bool isFav = widget.controller.isFavourite(
                                      widget.controller.products[index].id);
                                  return GestureDetector(
                                      onTap: () {
                                        widget.controller.toogleFavourite(widget
                                            .controller.products[index].id);

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
}

// Product List

class Plgp extends StatefulWidget {
  final ProductController controller;

  final Color colorb;
  final LinearGradient gradient;
  const Plgp({
    super.key,
    required this.controller,
    required this.colorb,
    required this.gradient,
  });

  @override
  State<Plgp> createState() => _PlgpState();
}

class _PlgpState extends State<Plgp> {
  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
        height: height * 0.35,
        width: width * 0.95,
        child: Obx(() {
          final isLoading = controller.isLoading.value;

          return ListView.builder(
              itemCount: isLoading ? 5 : controller.products.length,
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
                        width: width * 0.42,
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
                        width: width * 0.425,
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
                                      colors: widget.gradient.colors,
                                      stops: [0.5, 0.8],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      //AppColors.detailsScreenColorLgS.colors
                                    ),
                                    border: Border.all(
                                      color: widget
                                          .colorb, //AppColors.bottomNavigationBarColorLgS,
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
                                                image:
                                                    NetworkImage(product.image),
                                                fit: BoxFit.contain,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              // Product Name
                                              Text(
                                                product.name,
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors
                                                      .scaffoldBackground,
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
                                                    color:
                                                        Authcolors.whiteColor,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.5,
                                              ),
                                              Icon(
                                                Icons.shopping_bag,
                                                color: AppColors
                                                    .scaffoldBackground,
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
                                                  color: AppColors
                                                      .scaffoldBackground,
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
                                                      MainAxisAlignment
                                                          .spaceAround,
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.red,
                                                        decoration:
                                                            TextDecoration
                                                                .combine([
                                                          TextDecoration
                                                              .lineThrough,
                                                        ]),
                                                        decorationColor:
                                                            Colors.red,
                                                        decorationThickness:
                                                            2.0,
                                                        decorationStyle:
                                                            TextDecorationStyle
                                                                .solid,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Obx(() {
                                                      bool isInCart = widget
                                                          .controller
                                                          .isInCart(product.id);
                                                      return InkWell(
                                                        onTap: () {
                                                          if (!isInCart) {
                                                            widget.controller
                                                                .addToCart(
                                                                    product);
                                                            Get.snackbar(
                                                              "Added",

                                                              "Item added to cart",

                                                              snackPosition:
                                                                  SnackPosition
                                                                      .BOTTOM,
                                                              backgroundColor:
                                                                  widget
                                                                      .colorb, //AppColors
                                                              //  .bottomNavigationBarColorLgS,
                                                              colorText:
                                                                  Authcolors
                                                                      .whiteColor,
                                                            );
                                                          } else {
                                                            widget.controller
                                                                .removeFromCart(
                                                                    product.id);
                                                            Get.snackbar(
                                                              "Removed",

                                                              "Item removed from cart",

                                                              snackPosition:
                                                                  SnackPosition
                                                                      .BOTTOM,
                                                              backgroundColor:
                                                                  widget
                                                                      .colorb, //AppColors
                                                              //  .bottomNavigationBarColorLgS,
                                                              colorText:
                                                                  Authcolors
                                                                      .whiteColor,
                                                            );
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  100),
                                                          curve:
                                                              Curves.easeInOut,
                                                          height:
                                                              height * 0.03.sp,
                                                          width:
                                                              width * 0.13.sp,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: isInCart
                                                                ? Colors
                                                                    .amberAccent //  AppColors
                                                                //     .bottomNavigationBarColorLgS
                                                                : widget.colorb,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                                    FontWeight
                                                                        .bold,
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
                                      bool isFav = widget.controller
                                          .isFavourite(widget
                                              .controller.products[index].id);
                                      return GestureDetector(
                                          onTap: () {
                                            widget.controller.toogleFavourite(
                                                widget.controller
                                                    .products[index].id);

                                            Get.snackbar(
                                              isFav
                                                  ? "Removed from favourites"
                                                  : " Added to Favourite",
                                              isFav
                                                  ? "Item Removed from favourites"
                                                  : " Item Added to Favourite",
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
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
        }));
  }
}
