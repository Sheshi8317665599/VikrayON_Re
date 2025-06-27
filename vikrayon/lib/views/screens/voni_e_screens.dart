import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoniEScreens extends StatefulWidget {
  const VoniEScreens({super.key});

  @override
  State<VoniEScreens> createState() => _VoniEScreensState();
}

class _VoniEScreensState extends State<VoniEScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: Image(
          image: NetworkImage(
              "https://res.cloudinary.com/ddlyhla10/image/upload/v1749482445/vr_main_logo_c_Small_fuecf5.png"),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image(
                image: NetworkImage(
                    'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482438/planet_9661612_Small_zz5xqo.png'),
              )),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
              child: Text(
            "Experience The Future of \n Immersive Technology Now With ViE ! ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "Inter",
            ),
          )),
          SizedBox(
            height: 20.h,
          ),
          ClipRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  height: 0.35.sh,
                  width: 0.9.sw,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://res.cloudinary.com/ddlyhla10/image/upload/v1749482430/A_futuristic_concept_of_innovation_and_engineering_represented_by_the_letter_V_Small_ikw8eh.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.1),
                  ),
                )),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
              child: Text(
            "About  ViE ! ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "Inter",
            ),
          )),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                height: 0.35.sh,
                width: 0.9.sw,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://res.cloudinary.com/ddlyhla10/image/upload/v1749536855/About_Vie_1_od4h7b.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
