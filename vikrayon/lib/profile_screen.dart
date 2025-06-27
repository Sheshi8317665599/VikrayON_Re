import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/edit_profile_screen.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ForgotPasswordController controler =
      Get.find<ForgotPasswordController>();
  final ProfileController profileController = Get.put(ProfileController());

  Future<void> gSignOut() async {
    try {
      await profileController.logout();
      Get.to(() => LoginScreen());
    } catch (e) {
      Get.snackbar("Error", "Logout failed: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xff5ce1e6));
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Authcolors.backgrounColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Authcolors.borederColor,
        title: Row(
          children: [
            // IconButton(
            //   onPressed: () => Get.back(),
            //   icon: const Icon(Icons.arrow_back_ios,
            //       color: Authcolors.whiteColor),
            // ),
            SizedBox(width: width * 0.02),
            const Text("App Settings",
                style: TextStyle(color: Authcolors.whiteColor)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none,
                color: Authcolors.whiteColor),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              Obx(() {
                final userImageUrl = profileController.userImage.value;
                print("in profile screen: $userImageUrl");
                final isGoogleImage = userImageUrl.startsWith('http');

                ImageProvider imageProvider;

                if (profileController.hasLocalImage.value) {
                  imageProvider =
                      FileImage(File(profileController.userImage.value));
                } else if (isGoogleImage) {
                  imageProvider =
                      NetworkImage(profileController.userImage.value);
                } else {
                  imageProvider = const AssetImage(
                    'assets/icons/vonc_io_main-removebg-preview edited (Small).png',
                  );
                }

                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 30.sp,
                      backgroundColor: Authcolors.backgrounColor,
                      backgroundImage: imageProvider,
                    ),
                    Positioned(
                      bottom: -10,
                      right: -15,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt_outlined,
                            color: Authcolors.whiteColor),
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => bottomSheet(context),
                        ),
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(width: height * 0.02),
              Obx(() => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profileController.userName.value.isNotEmpty
                              ? profileController.userName.value
                              : "@AdminVikrayON",
                          style: TextStyle(
                              color: Authcolors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp),
                        ),
                        Text(
                          profileController.userEmail.value.isNotEmpty
                              ? profileController.userEmail.value
                              : "Admin@VikrayON.com",
                          style: TextStyle(
                              color: Authcolors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          SizedBox(height: 20.sp),
          // buildMenuItem(
          //     icon: Icons.language, title: "Language Settings", onTap: () {}),
          SizedBox(height: height * 0.01),
          buildMenuItem(
            icon: Icons.person,
            title: "Edit Profile",
            onTap: () => Get.to(() => EditProfileScreen()),
          ),
          SizedBox(height: height * 0.01),
          buildMenuItem(icon: Icons.language, title: "Language", onTap: () {}),
          SizedBox(height: height * 0.01),
          buildMenuItem(
              icon: Icons.history, title: "Order History", onTap: () {}),
          SizedBox(height: height * 0.01),
          buildMenuItem(
              icon: Icons.local_shipping,
              title: 'Shipping Details',
              onTap: () {}),
          SizedBox(height: height * 0.01),
          buildMenuItem(
              icon: Icons.payment, title: "Payment Details", onTap: () {}),
          SizedBox(height: height * 0.01),
          buildMenuItem(
              icon: Icons.card_giftcard, title: "Rewards", onTap: () {}),
          SizedBox(height: height * 0.01),
          buildMenuItem(
              icon: Icons.security,
              title: "Security & Privacy Policy",
              onTap: () {}),
          SizedBox(height: height * 0.01),
          buildMenuItem(
            icon: Icons.logout,
            title: "Logout",
            onTap: () async {
              try {
                gSignOut();
              } catch (e) {
                Get.snackbar(
                  "Error",
                  "Failed to logout. Please try again.",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.redAccent,
                  colorText: Colors.white,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 2, color: Authcolors.borederColor),
        color: Authcolors.backgrounColor,
      ),
      child: ListTile(
        leading: Icon(icon, color: Authcolors.whiteColor),
        title:
            Text(title, style: const TextStyle(color: Authcolors.whiteColor)),
        trailing: const Icon(Icons.chevron_right, color: Authcolors.whiteColor),
        onTap: onTap,
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Authcolors.backgrounColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(20),
      height: height * 0.19,
      width: width * 0.95,
      child: Column(
        children: [
          Text(
            "Edit Profile Picture",
            style: TextStyle(color: Authcolors.whiteColor, fontSize: 20.sp),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildImagePickerButton(
                icon: Icons.image,
                label: 'Gallery',
                source: ImageSource.gallery,
              ),
              const SizedBox(width: 10),
              buildImagePickerButton(
                icon: Icons.camera_alt,
                label: 'Camera',
                source: ImageSource.camera,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImagePickerButton({
    required IconData icon,
    required String label,
    required ImageSource source,
  }) {
    return ElevatedButton.icon(
      onPressed: () {
        profileController.pickImage(source);
        Get.back(); // Close bottom sheet after selecting
      },
      icon: Icon(icon, color: Authcolors.whiteColor),
      label: Text(label, style: const TextStyle(color: Authcolors.whiteColor)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Authcolors.backgrounColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Authcolors.backgrounColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
