import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:vikrayon/utils/colors.dart';

class Networkcontroller extends GetxController {
  final InternetConnectionChecker internetConnection =
      InternetConnectionChecker.createInstance();
  var isOnline = true.obs;

  @override
  void onInit() {
    super.onInit();
    checkInternetConnection();
    Connectivity()
        .onConnectivityChanged
        .listen((_) => checkInternetConnection());
  }

  Future<void> checkInternetConnection() async {
    bool result = await internetConnection.hasConnection;
    isOnline.value = result;
  }

  Future<void> checkConnection() async {
    await checkInternetConnection();
  }
}

class OfflineScreen extends StatelessWidget {
  final Networkcontroller networkController = Get.put(Networkcontroller());
  OfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
  //  double width = MediaQuery.of(context).size.width;
    return Obx(() => networkController.isOnline.value
        ? SizedBox.shrink()
        : Container(
            color: Authcolors.borederColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off,
                  color: Colors.white,
                  size: 50.sp,
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "OOPS! \n You're offline. Please check your connection.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      decoration: TextDecoration.none),
                  textAlign: TextAlign.center,

                  // overflow: TextOverflow.ellipsis,
                ),
                TextButton(
                    onPressed: networkController.checkConnection,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Authcolors.gradient2,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Retry",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )),
              ],
            )));
  }
}
