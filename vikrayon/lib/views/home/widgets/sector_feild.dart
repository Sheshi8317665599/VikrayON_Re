
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vikrayon/controllers/location_controller.dart';
import 'package:vikrayon/ui_helper.dart';
import 'package:vikrayon/utils/colors.dart';

enum ViewType { grid, list }

class SectorFeild extends StatefulWidget {
  final String socialapplogo;
  final String searchText;
  final VoidCallback? onPressedNotification;
  final VoidCallback? onPressedSearchbar;
  final VoidCallback? onPressedwathasapp;
  final String imageLogo;
  final LinearGradient? gradientcolourAppbar;
  final Color colorsearchBorder;
  final List<String> mainBanners;
  final String titleCt;
  final List<String> categoryIcons;
  final List<Color> categoryColors;
  final List<String> categoryNames;
  final List<String> vonieImages;
  final List<String> foodimages;
  final List<String> livingEssentailsImages;
  final List<String> fashionImages;
  final List<String> cervcesImages;
  final Function(int)? onBannerTap;
  final Function(int)? onCategoryTap;
  final Function(int)? onVonieTap;
  final Function(int)? onFoodTap;
  final Function(int)? onFoodpageTap;
  final Function(int)? onLivingTap;
  final Function(int)? onLivingpageTap;
  final Function(int)? onFashionTap;
  final Function(int)? onFashionpageTap;
  final Function(int)? onCervcesTap;
  final Function(int)? onCervcespageTap;
  const SectorFeild({
    super.key,
    required this.searchText,
    required this.socialapplogo,
    required this.onPressedNotification,
    required this.onPressedSearchbar,
    required this.onPressedwathasapp,
    required this.imageLogo,
    required this.gradientcolourAppbar,
    required this.colorsearchBorder,
    required this.mainBanners,
    required this.titleCt,
    required this.categoryIcons,
    required this.categoryColors,
    required this.categoryNames,
    required this.vonieImages,
    required this.foodimages,
    required this.livingEssentailsImages,
    required this.fashionImages,
    required this.cervcesImages,
    required this.onBannerTap,
    required this.onCategoryTap,
    required this.onVonieTap,
    required this.onFoodTap,
    required this.onFoodpageTap,
    required this.onLivingTap,
    required this.onLivingpageTap,
    required this.onFashionTap,
    required this.onFashionpageTap,
    required this.onCervcesTap,
    required this.onCervcespageTap,
  });

  @override
  State<SectorFeild> createState() => _SectorFeildState();
}

class _SectorFeildState extends State<SectorFeild> {
  int _crossAxisCount = 2;

  double _aspectRatio = 1.5;

  ViewType _viewType = ViewType.grid;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            gradient: widget.gradientcolourAppbar,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
                image: AssetImage(widget.imageLogo),
                height: 100.sp,
                width: 100.sp),
            SizedBox(width: 1.sp),
            Expanded(
              child: Container(
                height: height * 0.045,
                width: width * 0.55,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SearchBar(
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                  elevation: WidgetStateProperty.all(0),
                  side: WidgetStateProperty.all(
                      BorderSide(color: widget.colorsearchBorder, width: 2)),
                  leading: Icon(
                    Icons.search,
                    color: Authcolors.whiteColor,
                    size: 20,
                  ),
                  hintText: widget.searchText,
                  hintStyle: WidgetStateProperty.all(
                      TextStyle(color: Authcolors.whiteColor, fontSize: 12.sp)),
                  textStyle: WidgetStateProperty.all(
                    TextStyle(
                      color: Authcolors.whiteColor,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 2),
            InkWell(
              onTap: widget.onPressedNotification,
              child: Icon(
                Icons.notifications_none,
                size: 30.sp,
                color: Authcolors.whiteColor,
              ),
            ),
            const SizedBox(width: 2),
            InkWell(
              onTap: widget.onPressedwathasapp,
              child: SizedBox(
                height: 20.sp,
                width: 20.sp,
                child: Image.asset(
                  widget.socialapplogo,
                  height: 20.sp,
                  width: 20.sp,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
              width: width,
              child: LocationInfoWidget(),
            ),
            SizedBox(
              height: height * 0.18,
              child: CarouselSlider(
                  items: List.generate(
                    widget.mainBanners.length,
                    (index) {
                      return InkWell(
                        onTap: () => widget.onBannerTap?.call(index),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: AssetImage(
                                    widget.mainBanners[index],
                                  ),
                                  fit: BoxFit.cover,
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
                    //  "Categories",
                    widget.titleCt,
                    style: TextStyle(
                      color: Authcolors.whiteColor,
                      fontSize: 15.sp,
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
                          width: 30.sp,
                          height: 30.sp,
                          child: Image.asset(
                            "assets/icons/cateogrie_icon-removebg-preview (Small).png",
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
              child: Stack(
                children: [
                  _viewType == ViewType.grid
                      ? Stack(
                          children: [
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: //UiHelper.categoryIcons.length,
                                  widget.categoryIcons.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: _crossAxisCount,
                                childAspectRatio: _aspectRatio,
                              ),
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () =>
                                            widget.onCategoryTap?.call(index),
                                        child: Center(
                                          child: Container(
                                            height: height * 0.75,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(widget
                                                      .categoryIcons[index]),
                                                  fit: BoxFit.fill,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  width: 3,
                                                  color: widget
                                                      .categoryColors[index],
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text(
                                          widget.categoryNames[index],
                                          style: TextStyle(
                                            color: Authcolors.whiteColor,
                                            fontSize: 15.sp,
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
                                        backgroundColor: AppColors.transperent,
                                        radius: 50,
                                        child: IconButton(
                                            icon: Image.asset(
                                                UiHelper.vonieImages[0]),
                                            onPressed: () =>
                                                widget.onVonieTap?.call(0)),
                                      ),
                                    )))
                          ],
                        )
                      : Stack(
                          children: [
                            ListView.builder(
                              itemCount: widget.categoryIcons.length,
                              itemBuilder: (context, index) {
                                return Stack(children: [
                                  Stack(
                                    children: [
                                      InkWell(
                                        onTap: () =>
                                            widget.onCategoryTap?.call(index),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Container(
                                            height: height * 0.90,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(widget
                                                    .categoryIcons[index]),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      widget.categoryNames[index],
                                      style: TextStyle(
                                        color: Authcolors.whiteColor,
                                        fontSize: 15.sp,
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
                                  icon: Image.asset(widget.vonieImages[0]),
                                  onPressed: () => widget.onVonieTap?.call(0),
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
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  // UiHelper.fieldsName[0],
                  widget.categoryNames[0],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
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
                      widget.foodimages.length,
                      (index) => InkWell(
                        onTap: () => widget.onFoodTap?.call(index),
                        child: Container(
                          height: 150,
                          width: width - 50,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.foodimages[index]
                                  //UiHelper.fiImages[index]
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
                      onPressed: () => // foodImageindex(0),
                          widget.onFoodpageTap?.call(0),
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
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  UiHelper.categoryNames[1],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
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
                      widget.livingEssentailsImages.length,
                      (index) => InkWell(
                        onTap: () => widget.onLivingTap?.call(index),
                        child: Container(
                          height: 150,
                          width: width - 50,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  widget.livingEssentailsImages[index]),
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
                      onPressed: () => widget.onLivingpageTap?.call(0),
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
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  //UiHelper.fieldsName[2],
                  widget.categoryNames[2],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
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
                      widget.fashionImages.length,
                      // widget.imagefs.length,
                      (index) => InkWell(
                        onTap: () => widget.onFashionTap?.call(index),
                        child: Container(
                          height: 150,
                          width: width - 50,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  // UiHelper.foodImages[index],
                                  widget.fashionImages[index]),
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
                      onPressed: () => widget.onFashionpageTap?.call(0),
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
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  widget.categoryNames[3],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
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
                      widget.cervcesImages.length,
                      (index) => InkWell(
                        onTap: () => widget.onCervcesTap?.call(index),
                        child: Container(
                          height: 150,
                          width: width - 50,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                widget.cervcesImages[index],
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
                      onPressed: () => widget.onCervcespageTap?.call(0),
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
      ),
    );
  }
}
