import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:vikrayon/utils/colors.dart';

class CategoryFeild extends StatefulWidget {
  final List itemCount;
  final VoidCallback onTap;
  final List mbImages;
  // categories felid
  final String titleCT;
  final List imageci;
  final List itemCountci;
  final VoidCallback onTapci;
  //final List imageci2;
  final List colorCi;
  final List cNames;
  final VoidCallback onpressedciVie;
  final List imageciVie;
  // food offers
  final List fname;
  final List itemCountFo;
  final VoidCallback onTapFo; // i have to use 2 times in the code
  final List imageFo;
  // Living Generals offers
  final List lgname;
  final List itemCountlg;
  final VoidCallback onTaplg; // i have to use 2 times in the code
  final List imagelg;
  // fashion offers
  final List fsname;
  final List itemCountfs;
  final VoidCallback onTapfs; // i have to use 2 times in the code
  final List imagefs;
  // cevices offers
  final List coname;
  final List itemCountco;
  final VoidCallback onTapco; // i have to use 2 times in the code
  final List imageco;
  const CategoryFeild({
    Key? key,
    required this.itemCount,
    required this.onTap,
    required this.mbImages,
    required this.titleCT,
    required this.imageci,
    required this.itemCountci,
    required this.onTapci,
    // required this.imageci2,
    required this.colorCi,
    required this.cNames,
    required this.onpressedciVie,
    required this.imageciVie,
    required this.fname,
    required this.itemCountFo,
    required this.onTapFo,
    required this.imageFo,
    required this.lgname,
    required this.itemCountlg,
    required this.onTaplg,
    required this.imagelg,
    required this.fsname,
    required this.itemCountfs,
    required this.onTapfs,
    required this.imagefs,
    required this.coname,
    required this.itemCountco,
    required this.onTapco,
    required this.imageco,
  }) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.18,
              child: CarouselSlider(
                  items: List.generate(
                    widget.itemCount.length,
                    (index) {
                      return InkWell(
                        onTap: widget.onTap,
                        //     () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => widget.onTap),
                        //   );
                        // },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: AssetImage(
                                    widget.mbImages[index],
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
                    widget.titleCT,
                    style: const TextStyle(
                      color: Authcolors.whiteColor,
                      fontSize: 15,
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
                              itemCount: widget.itemCountci.length,
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
                                        onTap: widget.onTapci,
                                        // () {
                                        //   Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           widget.itemCountci[index],
                                        //     ),
                                        //   );
                                        // },
                                        child: Center(
                                          child: Container(
                                            height: height * 0.75,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      widget.imageci[index]),
                                                  fit: BoxFit.fill,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  width: 3,
                                                  color: widget.colorCi[index],
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
                                          widget.cNames[index],
                                          style: const TextStyle(
                                            color: Authcolors.whiteColor,
                                            fontSize: 15,
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
                                                widget.imageciVie[0]),
                                            onPressed: widget.onpressedciVie),
                                      ),
                                    )))
                          ],
                        )
                      : Stack(
                          children: [
                            ListView.builder(
                              itemCount: widget.itemCountci.length,
                              itemBuilder: (context, index) {
                                return Stack(children: [
                                  Stack(
                                    children: [
                                      InkWell(
                                        onTap:
                                            //widget.onTapci,
                                            () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  widget.itemCountci[index],
                                            ),
                                          );
                                        },
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Container(
                                            height: height * 0.90,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    widget.imageci[index]),
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
                                      widget.cNames[index],
                                      style: const TextStyle(
                                        color: Authcolors.whiteColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ]);
                              },
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: widget.onpressedciVie,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.transperent,
                                  radius: 40,
                                  child: IconButton(
                                      icon: Image.asset(widget.imageciVie[0]),
                                      onPressed: widget.onpressedciVie),
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
                  widget.cNames[0],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
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
                      widget.imageFo.length,
                      (index) => InkWell(
                        onTap: widget.onTapFo,
                        // () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => widget.itemCountFo[index],
                        //     ),
                        //   );
                        // },
                        child: Container(
                          height: 150,
                          width: width - 50,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.imageFo[index]),
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
                      onPressed: widget.onTapFo,
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
                  widget.cNames[1],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
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
                      widget.imagelg.length,
                      (index) => InkWell(
                        onTap: widget.onTaplg,
                        // () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => widget.itemCountlg[index],
                        //     ),
                        //   );
                        // },
                        child: Container(
                          height: 150,
                          width: width - 50,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.imagelg[index]),
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
                      onPressed: widget.onTaplg,
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
                  widget.cNames[2],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
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
                      widget.imagefs.length,
                      (index) => InkWell(
                        onTap: widget.onTapfs,
                        //  () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => widget.itemCountfs[index],
                        //     ),
                        //   );
                        // },
                        child: Container(
                          height: 150,
                          width: width - 50,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.imagefs[index]),
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
                      onPressed: widget.onTapfs,
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
                  widget.cNames[3],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
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
                      widget.imageco.length,
                      (index) => InkWell(
                        onTap: widget.onTapco,
                        // () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => widget.itemCountco[index],
                        //     ),
                        //   );
                        // },
                        child: Container(
                          height: 150,
                          width: width - 50,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.imageco[index]),
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
                      onPressed: widget.onTapco,
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

enum ViewType { grid, list }
