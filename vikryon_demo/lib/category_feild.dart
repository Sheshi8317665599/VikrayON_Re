// // waak a time should be install

// import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
// import 'package:flutter/material.dart';

// class CategoryFeild extends StatefulWidget {
//   const CategoryFeild({super.key});

//   @override
//   State<CategoryFeild> createState() => _CategoryFeildState();
// }

// class _CategoryFeildState extends State<CategoryFeild> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: SegmentedTabControl(
//                 tabs: [
//                   // Fruits tab
//                   SegmentTab(
//                     label: 'Fruits',
//                     color: Colors.greenAccent.shade700,
//                     textColor: Colors.black,
//                     selectedTextColor: Colors.white,
//                   ),
//                   // Vegetables tab
//                   SegmentTab(
//                     label: 'Vegetables',
//                     color: Colors.greenAccent.shade700,
//                     textColor: Colors.black,
//                     selectedTextColor: Colors.white,
//                   ),
//                 ],
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.only(top: 70.0),
//               child: TabBarView(children: [Fruits(), Vegetables()]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Fruits extends StatefulWidget {
//   const Fruits({super.key});

//   @override
//   State<Fruits> createState() => _FruitsState();
// }

// class _FruitsState extends State<Fruits> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Text("Fruits")));
//   }
// }

// class Vegetables extends StatefulWidget {
//   const Vegetables({super.key});

//   @override
//   State<Vegetables> createState() => _VegetablesState();
// }

// class _VegetablesState extends State<Vegetables> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Text("Vegetables")));
//   }
// }

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Replace these with your actual classes
// Custom AppBar widget

class Fruits extends StatefulWidget {
  const Fruits({super.key});

  @override
  State<Fruits> createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          // Premium Vendor Banners
          CarouselSlider(
            options: CarouselOptions(
              height: height * 0.18,
              autoPlay: true,
              reverse: true,
              enlargeCenterPage: true,
            ),
            items: List.generate(10, (index) {
              return buildCarouselItem(height * 0.16, width * 0.9);
            }),
          ),

          const SizedBox(height: 10),

          // Category Name
          Text(
            "All Fruits",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10),

          // Premium Vendor Grid View
          buildGridView(4),

          const SizedBox(height: 20),

          // Vendor Banners
          CarouselSlider(
            options: CarouselOptions(
              height: height * 0.25,
              autoPlay: true,
              reverse: true,
              enlargeCenterPage: true,
            ),
            items: List.generate(10, (index) {
              return buildCarouselItem(height * 0.22, width - 75);
            }),
          ),

          const SizedBox(height: 20),

          // Product Grid View
          buildGridView(4),

          const SizedBox(height: 20),

          // Fruits All Products Grid
          buildGridView(50),
        ],
      ),
    );
  }

  Widget buildCarouselItem(double height, double width) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.amber,
        // image: const DecorationImage(
        //   // image: AssetImage(
        //   //   "assets/images/banner.png",
        //   // ), // Replace with your image
        //   fit: BoxFit.fill,
        // ),
        border: Border.all(width: 2, color: Colors.transparent),
      ),
    );
  }

  Widget buildGridView(int itemCount) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Container(color: Colors.amber); // Replace with your image
      },
    );
  }

  Widget buildGridItem(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
        border: Border.all(width: 2, color: Colors.transparent),
      ),
    );
  }
}
