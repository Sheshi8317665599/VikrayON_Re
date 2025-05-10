import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vikrayon/app_notification_Screen.dart';
import 'package:vikrayon/utils/colors.dart';

class AppBarms extends StatefulWidget {
  final VoidCallback? onPressedNotification;
  final VoidCallback? onPressedSearchbar;
  final VoidCallback? onPressedwathasapp;
  final String imageLogo;
  final LinearGradient? gradientcolourAppbar;
  final Color colorsearchBorder;
  const AppBarms(
      {super.key,
      required this.onPressedNotification,
      required this.onPressedSearchbar,
      required this.onPressedwathasapp,
      required this.imageLogo,
      required this.gradientcolourAppbar,
      required this.colorsearchBorder});

  @override
  State<AppBarms> createState() => _AppBarmsState();
}

class _AppBarmsState extends State<AppBarms> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AppBar(
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
          Image(image: AssetImage(widget.imageLogo), height: 32, width: 50),
          const SizedBox(width: 2),
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
                hintText: "Search",
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
            child: const Icon(
              Icons.notifications_none,
              size: 30,
              color: Authcolors.whiteColor,
            ),
          ),
          const SizedBox(width: 2),
          InkWell(
            onTap: widget.onPressedwathasapp,
            child: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(
                "assets/icons/vonc wathsapp logo crop.png",
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarsbs extends StatefulWidget {
  final VoidCallback? onPressedfavourite;
  final VoidCallback? onPressedCartPge;
  final VoidCallback? onPressedSearchbar;
  final VoidCallback? onPressedwathasapp;
  final String imageLogo;
  final LinearGradient? gradientcolourAppbar;
  final Color colorsearchBorder;
  const AppBarsbs({
    super.key,
    required this.onPressedfavourite,
    required this.onPressedCartPge,
    required this.onPressedSearchbar,
    required this.onPressedwathasapp,
    required this.imageLogo,
    required this.gradientcolourAppbar,
    required this.colorsearchBorder, required AppNotificationScreen Function() onPressedNotification,
  });

  @override
  State<AppBarsbs> createState() => _AppBarsbsState();
}

class _AppBarsbsState extends State<AppBarsbs> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AppBar(
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
          Image(image: AssetImage(widget.imageLogo), height: 70, width: 70),
          const SizedBox(width: 2),
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
                  size: 18,
                ),
                hintText: "Search",
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
            onTap: widget.onPressedfavourite,
            child: const Icon(
              Icons.favorite_outline,
              size: 30,
              color: Authcolors.whiteColor,
            ),
          ),
          const SizedBox(width: 2),
          InkWell(
            onTap: widget.onPressedCartPge,
            child: const Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: Authcolors.whiteColor,
            ),
          ),
          const SizedBox(width: 2),
          InkWell(
            onTap: widget.onPressedwathasapp,
            child: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(
                "assets/icons/vonc wathsapp logo crop.png",
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
