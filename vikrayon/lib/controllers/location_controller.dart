import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:marquee/marquee.dart';
import 'package:vikrayon/api/api_client.dart';
import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/utils/colors.dart';

class LocationController extends GetxController {
  final AuthController authController = Get.find<AuthController>();
  var userName = ''.obs;
  var userStreet = ''.obs;
  var userArea = ''.obs;
  var userCity = ''.obs;
  var userState = ''.obs;
  var userCountry = ''.obs;
  var userPincode = ''.obs;
  var userFullAddress = ''.obs;

  var userLatitude = 0.0.obs;
  var userLongitude = 0.0.obs;
  var isAdressPermanant = false.obs;

  RxList<LatLng> routePoints =
      <LatLng>[].obs; // List to store route points <LatLng>

  RxString adressType = 'Home'.obs;
  final List<String> addressTypes = ['Home', 'Work', 'Other'];
  @override
  void onInit() {
    super.onInit();
    userName.value = authController.userName.value;
    ever(authController.userName, (value) {
      userName.value = value;
    });
    getLocation();
  }

  Future<void> fetchRoutePoints() async {
    try {
      final response = await ApiClient.get('getRoutePoints');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        routePoints.value = data.map<LatLng>((e) {
          return LatLng((e['latitude'] as num).toDouble(),
              (e['longitude'] as num).toDouble());
        }).toList();
      } else {
        Get.snackbar("Error", "Failed to fetch route points",
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch route points: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    }
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
      await updateLocationDetails(position.latitude, position.longitude);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch location: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    }
  }

  Future<void> updateLocationDetails(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        userStreet.value = place.street ?? '';
        userName.value = userName.value;
        userArea.value = place.subLocality ?? '';
        userCity.value = place.locality ?? '';
        userState.value = place.administrativeArea ?? '';
        userCountry.value = place.country ?? '';
        userPincode.value = place.postalCode ?? '';

        userFullAddress.value = formatFullAddress();

        userLatitude.value = latitude;
        userLongitude.value = longitude;

        await sendLocationToBackend(latitude, longitude, userFullAddress.value);
        await fetchRoutePoints();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch location: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    }
  }

  String formatFullAddress() {
    return '${userStreet.value}, ${userArea.value}, ${userCity.value}, ${userState.value}, ${userCountry.value}, ${userPincode.value}';
  }
}

Future sendLocationToBackend(
    double latitude, double longitude, String address) async {
  try {
    final response = await ApiClient.post('updateLocation',
        {'latitude': latitude, 'longitude': longitude, 'address': address});
    if (response.statusCode == 200) {
      Get.snackbar("Success", "Location updated successfully",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    } else {
      Get.snackbar("Error", "Failed to update location",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  } catch (e) {
    Get.snackbar("Error", "Failed to fetch location: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xff5ce1e6));
  }
}

class MapSelctionScreen extends StatefulWidget {
  final LatLng initialPosition;

  const MapSelctionScreen(
      {super.key, this.initialPosition = const LatLng(0, 0)});

  @override
  State<MapSelctionScreen> createState() => _MapSelctionScreenState();
}

class _MapSelctionScreenState extends State<MapSelctionScreen> {
  LatLng? selectedPosition;

  final LocationController locationController = Get.find<LocationController>();

  @override
  void initState() {
    super.initState();
    selectedPosition = widget.initialPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Authcolors.backgrounColor,
        title: Text(
          'Select Location',
          style: TextStyle(color: Authcolors.whiteColor),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.my_location_sharp, color: Authcolors.whiteColor),
              onPressed: () async {
                await locationController.getLocation();
                setState(() {
                  selectedPosition = LatLng(
                      locationController.userLatitude.value,
                      locationController.userLongitude.value);
                });
              }),
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: selectedPosition ?? LatLng(0, 0),
          minZoom: 15.0,
          maxZoom: 20.0,
          onTap: (tapPosition, latLng) {
            Get.back(result: latLng);
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.vikrayon',
          ),
          PolylineLayer<Polyline<LatLng>>(
            polylines: [
              Polyline(
                points: [
                  selectedPosition ?? widget.initialPosition,
                  LatLng(
                      selectedPosition?.latitude ??
                          widget.initialPosition.latitude + 0.01,
                      selectedPosition?.longitude ??
                          widget.initialPosition.longitude + 0.01),
                  LatLng(
                      selectedPosition?.latitude ??
                          widget.initialPosition.latitude + 0.015,
                      selectedPosition?.longitude ??
                          widget.initialPosition.longitude + 0.02),
                ],
                color: Colors.lightBlueAccent,
                strokeWidth: 5.0,
              ),
            ],
          ),
          MarkerLayer(markers: [
            Marker(
                point: selectedPosition ?? widget.initialPosition,
                child: Icon(Icons.location_on, color: Colors.red, size: 30.sp))
          ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Authcolors.backgrounColor,
        onPressed: () {
          Get.back(result: selectedPosition);
        },
        child: Icon(
          Icons.check,
          color: Authcolors.whiteColor,
        ),
      ),
    );
  }
}

class LocationInfoWidget extends StatelessWidget {
  const LocationInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController controller = Get.put(LocationController());
    return Obx(() {
      final loctionText = controller.userFullAddress.value.isEmpty? 'No Location Selected'
          // controller.userFullAddress.value.isEmpty? 'Select your Location': controller.userFullAddress.value;
         : '${controller.userName.value}, ${controller.userStreet.value}, ${controller.userArea.value}, ${controller.userCity.value}, ${controller.userState.value}, ${controller.userCountry.value}, ${controller.userPincode.value}';
      return InkWell(
        onTap: () {},
        // () async {
        //   final LatLng? newPosition = await Get.to(() => MapSelctionScreen(
        //         initialPosition: LatLng(controller.userLatitude.value,
        //             controller.userLongitude.value),
        //       ));
        //   if (newPosition != null) {
        //     controller.updateLocationDetails(
        //         newPosition.latitude, newPosition.longitude);
        //   }
        // },
        child: Row(
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
                height: 20.h,
                child: Marquee(
                    text: loctionText,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Authcolors.whiteColor,
                        overflow: TextOverflow.ellipsis),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 50.0.sp,
                    velocity: 30.0.sp,
                    pauseAfterRound: const Duration(seconds: 1),
                    startPadding: 10.0.sp,
                    accelerationDuration: const Duration(milliseconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: const Duration(milliseconds: 300),
                    decelerationCurve: Curves.easeOut),
              ),
            ),
          ],
        ),
      );
    });
  }
}
