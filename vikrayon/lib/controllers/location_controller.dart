import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/utils/colors.dart';

class LocationController extends GetxController {
  final AuthController authController = Get.find<AuthController>();
  var userName = ''.obs;
  var area = ''.obs;
  var city = ''.obs;
  var state = ''.obs;
  var country = ''.obs;
  var pincode = ''.obs;

  @override
  void onInit() {
    super.onInit();
    userName.value = authController.userName.value;
    ever(authController.userName, (value) {
      userName.value = value;
    });

    getLocation();
  }

  void setManualUserName(String name) {
    if (name.trim().isNotEmpty) {
      userName.value = name.trim();
    }
  }

  void resettoGoogleUserName() {
    userName.value = authController.userName.value;
  }

  Future<void> getLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar(
          "Location Service",
          "Please enable location service",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6),
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar("Location", "Location permissions are denied");
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar("Location", "Location permissions are permanently denied");
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        userName.value = userName.value;
        area.value = place.subLocality ?? '';
        city.value = place.locality ?? '';
        state.value = place.administrativeArea ?? '';
        country.value = place.country ?? '';
        pincode.value = place.postalCode ?? '';
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch location: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    }
  }
}

class LocationInfoWidget extends StatelessWidget {
  const LocationInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController controller = Get.find<LocationController>();
    return Obx(() {
      final loctionText =
          ' ${controller.userName.value}, ${controller.area.value}, ${controller.city.value}, ${controller.state.value}, ${controller.country.value}, ${controller.pincode.value}';
      return Row(
        children: [
          Icon(Icons.location_on,
              size: 28.sp,
              color: Authcolors
                  .whiteColor // Replace with your desired color (e.g.,0xff5ce1e6),
              ),
          SizedBox(width: 4.sp),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: 25.h,
              child: Marquee(
                  text: loctionText,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Authcolors.whiteColor,
                      overflow: TextOverflow.ellipsis),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 50.0,
                  velocity: 30.0,
                  pauseAfterRound: const Duration(seconds: 1),
                  startPadding: 10.0,
                  accelerationDuration: const Duration(milliseconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: const Duration(milliseconds: 300),
                  decelerationCurve: Curves.easeOut),
            ),
          ),
        ],
      );
    });
  }
}
