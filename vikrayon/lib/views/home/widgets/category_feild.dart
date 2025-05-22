//ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vikrayon/ui_helper.dart';
import 'package:vikrayon/utils/colors.dart';

// class CategoryFeild extends StatefulWidget {
//   final VoidCallback? onPressedNotification;
//   final VoidCallback? onPressedSearchbar;
//   final VoidCallback? onPressedwathasapp;
//   final
//   final Gradient gradientcolourAppbar;

//   const CategoryFeild({
//     super.key,
//   });

//   @override
//   State<CategoryFeild> createState() => _CategoryFeildState();
// }

// class _CategoryFeildState extends State<CategoryFeild> {

//   int _crossAxisCount = 2;

//   double _aspectRatio = 1.5;

//   ViewType _viewType = ViewType.grid;

//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }

//   Future<void> _loadData() async {
//     // simulate network delay
//     await Future.delayed(const Duration(seconds: 1));
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//         backgroundColor: AppColors.scaffoldBackground,
//         appBar: AppBar(
//       automaticallyImplyLeading: false,
//       flexibleSpace: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(0),
//           gradient: widget.gradientcolourAppbar,
//         ),
//       ),
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Image(image: AssetImage(widget.imageLogo), height: 32, width: 50),
//           const SizedBox(width: 2),
//           Expanded(
//             child: Container(
//               height: height * 0.045,
//               width: width * 0.55,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade900.withOpacity(0.5),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: SearchBar(
//                 backgroundColor: WidgetStateProperty.all(Colors.transparent),
//                 elevation: WidgetStateProperty.all(0),
//                 side: WidgetStateProperty.all(
//                     BorderSide(color: widget.colorsearchBorder, width: 2)),
//                 leading: Icon(
//                   Icons.search,
//                   color: Authcolors.whiteColor,
//                   size: 20,
//                 ),
//                 hintText: "Search",
//                 hintStyle: WidgetStateProperty.all(
//                     TextStyle(color: Authcolors.whiteColor, fontSize: 12.sp)),
//                 textStyle: WidgetStateProperty.all(
//                   TextStyle(
//                     color: Authcolors.whiteColor,
//                     fontSize: 15.sp,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 2),
//           InkWell(
//             onTap: widget.onPressedNotification,
//             child: const Icon(
//               Icons.notifications_none,
//               size: 30,
//               color: Authcolors.whiteColor,
//             ),
//           ),
//           const SizedBox(width: 2),
//           InkWell(
//             onTap: widget.onPressedwathasapp,
//             child: SizedBox(
//               height: 20,
//               width: 20,
//               child: Image.asset(
//                 "assets/icons/vonc wathsapp logo crop.png",
//                 height: 20,
//                 width: 20,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//         //  PreferredSize(
//         //   preferredSize: const Size.fromHeight(50),
//         //   child: AppBarms(
//         //       onPressedNotification: () => AppNotificationScreen(),
//         //       onPressedSearchbar: () {},
//         //       onPressedwathasapp: () {},
//         //       imageLogo: 'assets/icons/von logo crop.png',
//         //       gradientcolourAppbar: AppColors.appBarColorFS,
//         //       colorsearchBorder: AppColors.bottomNavigationBarColorCvS),
//         // ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: height * 0.18,
//                 child: _isLoading
//                     ? const ShimmerBanner(height: 150)
//                     : CarouselSlider(
//                         items: List.generate(
//                           UiHelper.mainBanners.length,
//                           (index) {
//                             return InkWell(
//                               onTap:
//                                   //() => mainBannerindex(index),
//                                   // widget.onTap,
//                                   () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           mainBannerindex(index)),
//                                 );
//                               },
//                               child: Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(30),
//                                       image: DecorationImage(
//                                         image: AssetImage(
//                                           // widget.mbImages[index],
//                                           UiHelper.mainBanners[index],
//                                         ),
//                                         fit: BoxFit.fill,
//                                       ))),
//                             );
//                           },
//                         ),
//                         options: CarouselOptions(
//                           height: height * 0.75,
//                           aspectRatio: _aspectRatio,
//                           viewportFraction: 0.8,
//                           initialPage: 0,
//                           enableInfiniteScroll: true,
//                           reverse: false,
//                           autoPlay: true,
//                           autoPlayInterval: const Duration(seconds: 3),
//                           autoPlayAnimationDuration:
//                               const Duration(milliseconds: 800),
//                           autoPlayCurve: Curves.fastOutSlowIn,
//                           enlargeCenterPage: true,
//                           scrollDirection: Axis.horizontal,
//                         )),
//               ),
//               const SizedBox(height: 1),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(left: 10),
//                     child: Text(
//                       "Categories",
//                       // widget.titleCT,
//                       style:  TextStyle(
//                         color: Authcolors.whiteColor,
//                         fontSize:  15.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       setState(() {
//                         if (_viewType == ViewType.list) {
//                           _crossAxisCount = 2;
//                           _aspectRatio = 1.5;
//                           _viewType = ViewType.grid;
//                         } else {
//                           _crossAxisCount = 1;
//                           _aspectRatio = 5;
//                           _viewType = ViewType.list;
//                         }
//                       });
//                     },
//                     icon: _viewType == ViewType.grid
//                         ? SizedBox(
//                             width: 40,
//                             height: 40,
//                             child: Image.asset(
//                               "assets/icons/cateogrie_icon-removebg-preview.png",
//                               fit: BoxFit.fill,
//                             ))
//                         : const Icon(Icons.list,
//                             color: Authcolors.whiteColor, size: 40),
//                   ),
//                 ],
//               ),

//               Container(
//                 margin: const EdgeInsets.only(left: 10, right: 10),
//                 height: height * 0.3,
//                 child: _isLoading
//                     ? _viewType == ViewType.grid
//                         ? const ShimmerCategoryGrid(
//                             crossAxisCount: 2, aspectRatio: 1.5)
//                         : ShimmerCategoryList(height: height)
//                     : Stack(
//                         children: [
//                           _viewType == ViewType.grid
//                               ? Stack(
//                                   children: [
//                                     GridView.builder(
//                                       physics:
//                                           const NeverScrollableScrollPhysics(),
//                                       itemCount: UiHelper.categoryIcons.length,
//                                       //widget.itemCountci.length,
//                                       gridDelegate:
//                                           SliverGridDelegateWithFixedCrossAxisCount(
//                                         crossAxisCount: _crossAxisCount,
//                                         childAspectRatio: _aspectRatio,
//                                       ),
//                                       itemBuilder: (context, index) {
//                                         return Stack(
//                                           children: [
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: InkWell(
//                                                 onTap:
//                                                     //() => categoryIconindex(index),
//                                                     //widget.onTapci,
//                                                     () {
//                                                   Navigator.push(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           categoryIconindex(
//                                                               index),
//                                                     ),
//                                                   );
//                                                 },
//                                                 child: Center(
//                                                   child: Container(
//                                                     height: height * 0.75,
//                                                     decoration: BoxDecoration(
//                                                         image: DecorationImage(
//                                                           image: AssetImage(
//                                                               UiHelper.categoryIcons[
//                                                                   index]),
//                                                           fit: BoxFit.fill,
//                                                         ),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(30),
//                                                         border: Border.all(
//                                                             width: 3,
//                                                             color: UiHelper
//                                                                     .categoryColors[
//                                                                 index]
//                                                             //widget.colorCi[index],
//                                                             )),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             Align(
//                                               alignment: Alignment.bottomCenter,
//                                               child: Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(15.0),
//                                                 child: Text(
//                                                   UiHelper.categoryNames[index],
//                                                   // widget.cNames[index],
//                                                   style:  TextStyle(
//                                                     color:
//                                                         Authcolors.whiteColor,
//                                                     fontSize:  15.sp,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                     ),
//                                     Center(
//                                         child: Align(
//                                             alignment: Alignment.center,
//                                             child: Container(
//                                               decoration: const BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                               ),
//                                               child: CircleAvatar(
//                                                 backgroundColor:
//                                                     AppColors.transperent,
//                                                 radius: 50,
//                                                 child: IconButton(
//                                                     icon: Image.asset(UiHelper
//                                                         .vonieImages[0]),
//                                                     onPressed: () =>
//                                                         vonieImageindex(0)),
//                                               ),
//                                             )))
//                                   ],
//                                 )
//                               : Stack(
//                                   children: [
//                                     ListView.builder(
//                                       itemCount: UiHelper.categoryIcons.length,
//                                       itemBuilder: (context, index) {
//                                         return Stack(children: [
//                                           Stack(
//                                             children: [
//                                               InkWell(
//                                                 onTap:
//                                                     //() => categoryIconindex(index),
//                                                     // widget.onTapci,
//                                                     () {
//                                                   Navigator.push(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           categoryIconindex(
//                                                               index),
//                                                     ),
//                                                   );
//                                                 },
//                                                 child: SingleChildScrollView(
//                                                   scrollDirection:
//                                                       Axis.vertical,
//                                                   child: Container(
//                                                     height: height * 0.90,
//                                                     margin: const EdgeInsets
//                                                         .symmetric(
//                                                         vertical: 10),
//                                                     decoration: BoxDecoration(
//                                                       image: DecorationImage(
//                                                         image: AssetImage(UiHelper
//                                                                 .categoryIcons[
//                                                             index]),
//                                                         // widget.imageci[index]),
//                                                         fit: BoxFit.fill,
//                                                       ),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               30),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Align(
//                                             alignment: Alignment.bottomCenter,
//                                             child: Text(
//                                               UiHelper.categoryNames[index],
//                                               //widget.cNames[index],
//                                               style:  TextStyle(
//                                                 color: Authcolors.whiteColor,
//                                                 fontSize:  15.sp,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ),
//                                         ]);
//                                       },
//                                     ),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: CircleAvatar(
//                                         backgroundColor: AppColors.transperent,
//                                         radius: 40,
//                                         child: IconButton(
//                                           icon: Image.asset(
//                                             UiHelper.vonieImages[0],
//                                             // widget.imageciVie[0]
//                                           ),
//                                           onPressed: () => vonieImageindex(0),
//                                           //widget.onpressedciVie
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                         ],
//                       ),
//               ),
//               // foods offers
//               const SizedBox(height: 1),
//               SizedBox(
//                 height: 20,
//                 width: width,
//                 child: _isLoading
//                     ? const ShimmerSectionTitle()
//                     : Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Text(
//                           UiHelper.categoryNames[0],
//                           // widget.cNames[0],
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize:  15.sp,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//               ),
//               const SizedBox(height: 1),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     Row(
//                       children: List.generate(
//                         _isLoading ? 6 : UiHelper.foodImages.length,
//                         (index) => _isLoading
//                             ? const ShimmerHorizontalItem(
//                                 height: 300,
//                                 width: 300,
//                               )
//                             : InkWell(
//                                 onTap: // () => foodImageindex(index),
//                                     //widget.onTapFo,
//                                     () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => foodImageindex(index),
//                                     ),
//                                   );
//                                 },
//                                 child: Container(
//                                   height: 150,
//                                   width: width - 50,
//                                   margin: const EdgeInsets.symmetric(
//                                       horizontal: 10),
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(//widget.imageFo[index]
//                                           UiHelper.foodImages[index]),
//                                       fit: BoxFit.fill,
//                                     ),
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                 ),
//                               ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: IconButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => foodImageindex(0),
//                             ),
//                           );
//                         },
//                         //() => foodImageindex(0),
//                         // widget.onTapFo,
//                         icon: const Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Livin generals offers
//               const SizedBox(height: 1),
//               SizedBox(
//                 height: 20,
//                 width: width,
//                 child: _isLoading
//                     ? const ShimmerSectionTitle()
//                     : Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Text(
//                           UiHelper.categoryNames[1],
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize:  15.sp,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//               ),
//               const SizedBox(height: 1),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     Row(
//                       children: List.generate(
//                         _isLoading ? 6 : UiHelper.livingEssentailsImages.length,
//                         // widget.imagelg.length,
//                         (index) => _isLoading
//                             ? const ShimmerHorizontalItem(
//                                 height: 300,
//                                 width: 300,
//                               )
//                             : InkWell(
//                                 onTap: // () => livinggeneralsImageindex(index),
//                                     // widget.onTaplg,
//                                     () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           livinggeneralsImageindex(index),
//                                     ),
//                                   );
//                                 },
//                                 child: Container(
//                                   height: 150,
//                                   width: width - 50,
//                                   margin: const EdgeInsets.symmetric(
//                                       horizontal: 10),
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                         UiHelper.livingEssentailsImages[index],
//                                         //widget.imagelg[index]
//                                       ),
//                                       fit: BoxFit.fill,
//                                     ),
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                 ),
//                               ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: IconButton(
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     LivingGeneralsMainScreen(),
//                               ));
//                         }, // () => livinggeneralsImageindex(0),
//                         // widget.onTaplg,
//                         icon: const Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // fashion offers
//               const SizedBox(height: 1),
//               SizedBox(
//                 height: 20,
//                 width: width,
//                 child: _isLoading
//                     ? const ShimmerSectionTitle()
//                     : Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Text(
//                           UiHelper.categoryNames[2],
//                           //widget.cNames[2],
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize:  15.sp,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//               ),
//               const SizedBox(height: 1),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     Row(
//                       children: List.generate(
//                         _isLoading ? 6 : UiHelper.fashionImages.length,
//                         // widget.imagefs.length,
//                         (index) => _isLoading
//                             ? const ShimmerHorizontalItem(
//                                 width: 300,
//                                 height: 300,
//                               )
//                             : InkWell(
//                                 onTap:
//                                     // () => fashionImageindex(index),
//                                     // widget.onTapfs,
//                                     () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           fashionImageindex(index),
//                                     ),
//                                   );
//                                 },
//                                 child: Container(
//                                   height: 150,
//                                   width: width - 50,
//                                   margin: const EdgeInsets.symmetric(
//                                       horizontal: 10),
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                         UiHelper.foodImages[index],
//                                         //widget.imagefs[index]
//                                       ),
//                                       fit: BoxFit.fill,
//                                     ),
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                 ),
//                               ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: IconButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => fashionImageindex(0),
//                             ),
//                           );
//                         },
//                         // widget.onTapfs,
//                         icon: const Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Cervces offers
//               const SizedBox(height: 1),
//               SizedBox(
//                 height: 20,
//                 width: width,
//                 child: _isLoading
//                     ? const ShimmerSectionTitle()
//                     : Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Text(
//                           UiHelper.categoryNames[3],
//                           //widget.cNames[3],
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize:  15.sp,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//               ),
//               const SizedBox(height: 1),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     Row(
//                       children: List.generate(
//                         _isLoading ? 6 : UiHelper.cervcesImages.length,
//                         // widget.imageco.length,
//                         (index) => _isLoading
//                             ? const ShimmerHorizontalItem(
//                                 width: 300,
//                                 height: 300,
//                               )
//                             : InkWell(
//                                 onTap:
//                                     //() => cervcesImageindex(index),
//                                     //widget.onTapco,
//                                     () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           cervcesImageindex(index),
//                                     ),
//                                   );
//                                 },
//                                 child: Container(
//                                   height: 150,
//                                   width: width - 50,
//                                   margin: const EdgeInsets.symmetric(
//                                       horizontal: 10),
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                         UiHelper.cervcesImages[index],
//                                         //  widget.imageco[index]
//                                       ),
//                                       fit: BoxFit.fill,
//                                     ),
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                 ),
//                               ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: IconButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => CervcesMainScreen(),
//                             ),
//                           );
//                         },

//                         ///widget.onTapco,
//                         icon: const Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

enum ViewType { grid, list }

class CategoryFeild extends StatefulWidget {
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
  const CategoryFeild({
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
  State<CategoryFeild> createState() => _CategoryFeildState();
}

class _CategoryFeildState extends State<CategoryFeild> {
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
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(50),
      //   child: AppBarms(
      //       onPressedNotification: () => AppNotificationScreen(),
      //       onPressedSearchbar: () {},
      //       onPressedwathasapp: () {},
      //       imageLogo: 'assets/icons/VikrayON_Text_Logo.png',
      //       gradientcolourAppbar: AppColors.appBarColorMS,
      //       colorsearchBorder: AppColors.bottomNavigationBarColorCvS),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                                  onPressed: () => widget.onVonieTap,
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

class CategoryFeild1 extends StatefulWidget {
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
  final List<String> fieldsName;
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
  const CategoryFeild1({
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
    required this.fieldsName,
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
  State<CategoryFeild1> createState() => _CategoryFeild1State();
}

class _CategoryFeild1State extends State<CategoryFeild1> {
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
                                radius: 40.sp,
                                child: IconButton(
                                  icon: Image.asset(widget.vonieImages[0]),
                                  onPressed: () => widget.onVonieTap,
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
              height: 20.sp,
              width: width,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  // UiHelper.fieldsName[0],
                  widget.fieldsName[0],
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
                  widget.fieldsName[1],
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
                  widget.fieldsName[2],
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
                  widget.fieldsName[3],
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
