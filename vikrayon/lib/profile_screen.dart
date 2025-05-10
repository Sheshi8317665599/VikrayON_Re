import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/auth/login_screen.dart';
import 'package:vikrayon/views/home/home_screen/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? pickedFile;
  final ImagePicker picker = ImagePicker();
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
  GoogleSignInAccount? user;

  final ProfileControler profileControler = Get.put(ProfileControler());

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    user = await googleSignIn.signInSilently();
    profileControler.userImage.value = user?.photoUrl ?? '';
    setState(() {});
  }

  void gSignOut() async {
    await googleSignIn.signOut();
    Get.off(() => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Authcolors.backgrounColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Get.to(() => HomeScreen()),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Authcolors.whiteColor,
              ),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            const Text(
              "App Settings ",
              style: TextStyle(color: Authcolors.whiteColor),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Authcolors.whiteColor,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.bottomNavigationBarColorMS,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              Obx(
                () => Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Authcolors.backgrounColor,
                      radius: 30.sp,
                      backgroundImage: profileControler
                              .profilepicpath.value.isNotEmpty
                          ? FileImage(
                              File(profileControler.profilepicpath.value),
                            ) as ImageProvider
                          : (profileControler.userImage.value.isNotEmpty
                              ? NetworkImage(profileControler.userImage.value)
                              : const AssetImage(
                                  "assets/icons/vonc_io_main-removebg-preview edited.png")),
                    ),
                    Positioned(
                      bottom: -10,
                      right: -15,
                      child: IconButton(
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: Authcolors.whiteColor,
                        ),
                        onPressed: () => showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => bottomSheet(context)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: height * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user?.displayName ?? "Vikrayon",
                    style: TextStyle(
                        color: Authcolors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                  ),
                  Text(
                    user?.email ?? "Admin@VikrayON",
                    style: TextStyle(
                        color: Authcolors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          buildMenuItem(
              icon: Icons.person, title: "Edit Profile", onTap: () {}),
          SizedBox(
            height: height * 0.01,
          ),
          buildMenuItem(
              icon: Icons.history, title: "Order History", onTap: () {}),
          SizedBox(
            height: height * 0.01,
          ),
          buildMenuItem(
              icon: Icons.local_shipping,
              title: 'Shipping Details',
              onTap: () {}),
          SizedBox(
            height: height * 0.01,
          ),
          buildMenuItem(
              icon: Icons.payment, title: "Payment Details", onTap: () {}),
          SizedBox(
            height: height * 0.01,
          ),
          buildMenuItem(
              icon: Icons.card_giftcard, title: "Rewards", onTap: () {}),
          SizedBox(
            height: height * 0.01,
          ),
          buildMenuItem(
            icon: Icons.security,
            title: "Security &Privacy Policy",
            onTap: () {},
          ),
          SizedBox(
            height: height * 0.01,
          ),
          buildMenuItem(
            icon: Icons.logout,
            title: "Logout",
            onTap: () => gSignOut(),
          ),
          SizedBox(
            height: height * 0.01,
          ),
        ],
      ),
    );
  }
  //

  Widget buildMenuItem(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: Authcolors.borederColor),
          color: Authcolors.backgrounColor),
      child: ListTile(
        leading: Icon(
          icon,
          color: Authcolors.whiteColor,
        ),
        title: Text(
          title,
          style: const TextStyle(color: Authcolors.whiteColor),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Authcolors.whiteColor,
        ),
        onTap: onTap,
      ),
    );
  }

  //

  Widget bottomSheet(buildContext) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildImagePickerButton(
                  icon: Icons.image,
                  label: 'Gallery',
                  source: ImageSource.gallery),
              const SizedBox(
                width: 10,
              ),
              buildImagePickerButton(
                icon: Icons.camera_alt,
                label: 'Camera',
                source: ImageSource.camera,
              ),
            ],
          )
        ],
      ),
    );
  }

  //

  Widget buildImagePickerButton(
      {required IconData icon,
      required String label,
      required ImageSource source}) {
    return ElevatedButton.icon(
      onPressed: () => profileControler.pickImage(source),
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
          )),
    );
  }

  //
}
