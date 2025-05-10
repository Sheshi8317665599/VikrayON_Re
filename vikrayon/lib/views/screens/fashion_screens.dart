import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vikrayon/app_notification_Screen.dart';

import 'package:vikrayon/ui_helper.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/main/cervices_main_screen.dart';
import 'package:vikrayon/views/main/living_generals_main_screen.dart';
import 'package:vikrayon/widgets/app_bar_feild.dart';
import 'package:vikrayon/widgets/shimmer/shimmer_placeholder.dart';

class FashionScreens extends StatefulWidget {
  const FashionScreens({super.key});

  @override
  State<FashionScreens> createState() => _FashionScreensState();
}

class _FashionScreensState extends State<FashionScreens> {
  int _crossAxisCount = 2;

  double _aspectRatio = 1.5;

  ViewType _viewType = ViewType.grid;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isLoading = false;
    });
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarms(
            onPressedNotification: () => AppNotificationScreen(),
            onPressedSearchbar: () {},
            onPressedwathasapp: () {},
            imageLogo: 'assets/icons/VikrayON_Text_Logo.png',
            gradientcolourAppbar: AppColors.appBarColorFhs,
            colorsearchBorder: AppColors.bottomNavigationBarColorCvS),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.18,
              child: _isLoading
                  ? const ShimmerBanner(height: 150)
                  : CarouselSlider(
                      items: List.generate(
                        UiHelper.mainBanners.length,
                        (index) {
                          return InkWell(
                            onTap:
                                //() => getMainBanner(index),
                                // widget.onTap,
                                () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        getMainBanner(index)),
                              );
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        // widget.mbImages[index],
                                        UiHelper.mainBanners[index],
                                      ),
                                      fit: BoxFit.fill,
                                    ))),
                          );
                        },
                      ),
                      options: CarouselOptions(
                        height: height * 0.75,
                        aspectRatio: _aspectRatio,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      )),
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Categories",
                    // widget.titleCT,
                    style:  TextStyle(
                      color: Authcolors.whiteColor,
                      fontSize:  15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (_viewType == ViewType.list) {
                        _crossAxisCount = 2;
                        _aspectRatio = 1.5;
                        _viewType = ViewType.grid;
                      } else {
                        _crossAxisCount = 1;
                        _aspectRatio = 5;
                        _viewType = ViewType.list;
                      }
                    });
                  },
                  icon: _viewType == ViewType.grid
                      ? SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset(
                            "assets/icons/cateogrie_icon-removebg-preview.png",
                            fit: BoxFit.fill,
                          ))
                      : const Icon(Icons.list,
                          color: Authcolors.whiteColor, size: 40),
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: height * 0.3,
              child: _isLoading
                  ? _viewType == ViewType.grid
                      ? const ShimmerCategoryGrid(
                          crossAxisCount: 2, aspectRatio: 1.5)
                      : ShimmerCategoryList(height: height)
                  : Stack(
                      children: [
                        _viewType == ViewType.grid
                            ? Stack(
                                children: [
                                  GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: UiHelper.categoryIcons.length,
                                    //widget.itemCountci.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: _crossAxisCount,
                                      childAspectRatio: _aspectRatio,
                                    ),
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap:
                                                  //() => getCategoryIcon(index),
                                                  //widget.onTapci,
                                                  () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        getCategoryIcon(
                                                            index),
                                                  ),
                                                );
                                              },
                                              child: Center(
                                                child: Container(
                                                  height: height * 0.75,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            UiHelper.categoryIcons[
                                                                index]),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(30),
                                                      border: Border.all(
                                                          width: 3,
                                                          color: UiHelper
                                                                  .categoryColors[
                                                              index]
                                                          //widget.colorCi[index],
                                                          )),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Text(
                                                UiHelper.categoryNames[index],
                                                // widget.cNames[index],
                                                style: TextStyle(
                                                  color:
                                                      Authcolors.whiteColor,
                                                  fontSize:  15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  Center(
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.transperent,
                                              radius: 50,
                                              child: IconButton(
                                                  icon: Image.asset(UiHelper
                                                      .vonieImages[0]),
                                                  onPressed: () =>
                                                      getVonieImage(0)),
                                            ),
                                          )))
                                ],
                              )
                            : Stack(
                                children: [
                                  ListView.builder(
                                    itemCount: UiHelper.categoryIcons.length,
                                    itemBuilder: (context, index) {
                                      return Stack(children: [
                                        Stack(
                                          children: [
                                            InkWell(
                                              onTap:
                                                  //() => getCategoryIcon(index),
                                                  // widget.onTapci,
                                                  () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        getCategoryIcon(
                                                            index),
                                                  ),
                                                );
                                              },
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.vertical,
                                                child: Container(
                                                  height: height * 0.90,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 10),
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(UiHelper
                                                              .categoryIcons[
                                                          index]),
                                                      // widget.imageci[index]),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            UiHelper.categoryNames[index],
                                            //widget.cNames[index],
                                            style:  TextStyle(
                                              color: Authcolors.whiteColor,
                                              fontSize:  15.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ]);
                                    },
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.transperent,
                                      radius: 40,
                                      child: IconButton(
                                        icon: Image.asset(
                                          UiHelper.vonieImages[0],
                                          // widget.imageciVie[0]
                                        ),
                                        onPressed: () => getVonieImage(0),
                                        //widget.onpressedciVie
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
            ),
            // foods offers
            const SizedBox(height: 1),
            SizedBox(
              height: 20,
              width: width,
              child: _isLoading
                  ? const ShimmerSectionTitle()
                  : Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        UiHelper.categoryNames[0],
                        // widget.cNames[0],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:  15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 1),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                      _isLoading ? 6 : UiHelper.foodImages.length,
                      (index) => _isLoading
                          ? const ShimmerHorizontalItem(
                              height: 300,
                              width: 300,
                            )
                          : InkWell(
                              onTap: // () => getFoodImage(index),
                                  //widget.onTapFo,
                                  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => getFoodImage(index),
                                  ),
                                );
                              },
                              child: Container(
                                height: 150,
                                width: width - 50,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(//widget.imageFo[index]
                                        UiHelper.foodImages[index]),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => getFoodImage(0),
                          ),
                        );
                      },
                      //() => getFoodImage(0),
                      // widget.onTapFo,
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Livin generals offers
            const SizedBox(height: 1),
            SizedBox(
              height: 20,
              width: width,
              child: _isLoading
                  ? const ShimmerSectionTitle()
                  : Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        UiHelper.categoryNames[1],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:  15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 1),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                      _isLoading ? 6 : UiHelper.livingEssentailsImages.length,
                      // widget.imagelg.length,
                      (index) => _isLoading
                          ? const ShimmerHorizontalItem(
                              height: 300,
                              width: 300,
                            )
                          : InkWell(
                              onTap: // () => getLivinggeneralsImage(index),
                                  // widget.onTaplg,
                                  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        getLivinggeneralsImage(index),
                                  ),
                                );
                              },
                              child: Container(
                                height: 150,
                                width: width - 50,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      UiHelper.livingEssentailsImages[index],
                                      //widget.imagelg[index]
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LivingGeneralsMainScreen(),
                            ));
                      }, // () => getLivinggeneralsImage(0),
                      // widget.onTaplg,
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // fashion offers
            const SizedBox(height: 1),
            SizedBox(
              height: 20,
              width: width,
              child: _isLoading
                  ? const ShimmerSectionTitle()
                  : Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        UiHelper.categoryNames[2],
                        //widget.cNames[2],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:  15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 1),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                      _isLoading ? 6 : UiHelper.fashionImages.length,
                      // widget.imagefs.length,
                      (index) => _isLoading
                          ? const ShimmerHorizontalItem(
                              width: 300,
                              height: 300,
                            )
                          : InkWell(
                              onTap:
                                  // () => getFashionImage(index),
                                  // widget.onTapfs,
                                  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        getFashionImage(index),
                                  ),
                                );
                              },
                              child: Container(
                                height: 150,
                                width: width - 50,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      UiHelper.foodImages[index],
                                      //widget.imagefs[index]
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => getFashionImage(0),
                          ),
                        );
                      },
                      // widget.onTapfs,
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Cervces offers
            const SizedBox(height: 1),
            SizedBox(
              height: 20,
              width: width,
              child: _isLoading
                  ? const ShimmerSectionTitle()
                  : Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        UiHelper.categoryNames[3],
                        //widget.cNames[3],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:  15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 1),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                      _isLoading ? 6 : UiHelper.cervcesImages.length,
                      // widget.imageco.length,
                      (index) => _isLoading
                          ? const ShimmerHorizontalItem(
                              width: 300,
                              height: 300,
                            )
                          : InkWell(
                              onTap:
                                  //() => getCervcesImage(index),
                                  //widget.onTapco,
                                  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        getCervcesImage(index),
                                  ),
                                );
                              },
                              child: Container(
                                height: 150,
                                width: width - 50,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      UiHelper.cervcesImages[index],
                                      //  widget.imageco[index]
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CervcesMainScreen(),
                          ),
                        );
                      },

                      ///widget.onTapco,
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

enum ViewType { grid, list }
