import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget buildBanner({required BuildContext context, required sectordata, required controller}) {
 double height = MediaQuery.of(context).size.height;
 double width = MediaQuery.of(context).size.width;
  int crossAxisCount = 2;

  double aspectRatio = 1.5;

  ViewType viewType = ViewType.grid;

  return   SizedBox(
                      height: height * 0.18,
                      child: CarouselSlider(
                          items: List.generate(
                            sectordata.mainBanners.length,
                            (index) {
                              return InkWell(
                                onTap: () => controller.onBannerSelected(index),
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            sectordata.mainBanners[index],
                                          ),
                                          fit: BoxFit.cover,
                                        ))),
                              );
                            },
                          ),
                          options: CarouselOptions(
                            height: height * 0.75,
                            aspectRatio: aspectRatio,
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
                    );
}

enum ViewType { grid, list }