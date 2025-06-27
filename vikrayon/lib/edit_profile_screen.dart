import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vikrayon/api/api_client.dart';
import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/auth/widgets_auth/login_feild.dart';
import 'package:vikrayon/views/auth/widgets_auth/sudmit_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());
  final GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Authcolors.backgrounColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Authcolors.backgrounColor,
          title: Row(
            children: [
              SizedBox(
                width: 2.w,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Authcolors.whiteColor,
                ),
              ),
              SizedBox(
                width: 80.w,
              ),
              Center(
                child: Text(
                  'Edit Profile',
                  style:
                      TextStyle(color: Authcolors.whiteColor, fontSize: 22.sp),
                ),
              ),
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
          padding: EdgeInsets.all(16.0),
          children: [
            SizedBox(
              height: 0.02.h,
            ),

            Obx(() {
              final userImageUrl = profileController.userImage.value;
              final isGoogleImage = userImageUrl.startsWith('http');

              ImageProvider imageProvider;

              if (profileController.hasLocalImage.value) {
                imageProvider =
                    FileImage(File(profileController.profilepicpath.value));
              } else if (isGoogleImage) {
                imageProvider = NetworkImage(userImageUrl);
              } else {
                imageProvider = const AssetImage(
                  'assets/icons/vonc_io_main-removebg-preview edited (Small).png',
                );
              }

              return Column(
                children: [
                  Center(
                    child: Stack(children: [
                      CircleAvatar(
                        radius: 80.sp,
                        backgroundColor: Authcolors.borederColor,
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
                    ]),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              );
            }),
            SizedBox(
              height: 0.02.h,
            ),
            buildMenuItem(
                icon: Icons.person_outline,
                title: 'Change Personal Details',
                onTap: () {
                  changePersonalDetails(context);
                }),
            SizedBox(
              height: 0.1.h,
            ),
            buildMenuItem(
              icon: Icons.email_outlined,
              title: 'Change Email Adress',
              onTap: () async {
                try {
                  await initiateEmailOtp();
                  if (mounted) {
                    showChangeEmailBottomSheet(context);
                  }
                } catch (e) {
                  Get.snackbar("Error", "Failed to send OTP: ${e.toString()}",
                      backgroundColor: Colors.red, colorText: Colors.white);
                }
              },
            ),
            SizedBox(height: 0.1.h),
            buildMenuItem(
              icon: Icons.password_outlined,
              title: 'Change Password',
              onTap: () async {
                try {
                  await initiateConformpasswordChange();
                  if (mounted) {
                    showChangePsswordBottomSheet(context);
                  }
                } catch (e) {
                  Get.snackbar("Error", "Failed to send OTP: ${e.toString()}",
                      backgroundColor: Colors.red, colorText: Colors.white);
                }
              },
            ),
            SizedBox(height: 0.1.h),
            buildMenuItem(
              icon: Icons.location_on_outlined,
              title: 'Change Adress',
              onTap: () => Get.to(() => EnterHomeAdress()),
            ),
            SizedBox(height: 0.1.h),

            buildMenuItem(
                icon: Icons.inventory_outlined,
                title: 'Get Your Vie Id ',
                onTap: () {}),
            // // name feild
            // LoginFeild(
            //   onchanged: (value) {
            //     profileController.nameController.text = value;
            //     profileController.userName.value = value;
            //   },
            //   hintText: "User Name",
            //   controller: profileController.nameController,
            //   keyboardType: TextInputType.text,
            //   suffixIcon: null,
            //   prefixIcon: Icon(Icons.person_outline,
            //       size: 20.sp, color: Authcolors.whiteColor),
            //   obscureText: false,
            //   validator: (value) {
            //     if (value == null ||
            //         value.isEmpty ||
            //         !RegExp(r"^(?=.*[A-Z])[a-zA-Z0-9._]{3,15}$")
            //             .hasMatch(value)) {
            //       return "Please enter a valid name(only alphabets and spaces)";
            //     }
            //     return null;
            //   },
            //   hintStyle: TextStyle(
            //     color: Authcolors.whiteColor,
            //     fontSize: 16.sp,
            //   ),
            //   readOnly: false,
            // ),

            // SizedBox(
            //   height: 0.02.w,
            // ),

            // // phone number feild
            // LoginFeild(
            //   onchanged: (value) {
            //     profileController.userPhoneNumber.value = value;
            //     profileController.phoneController.text = value;
            //   },
            //   hintText: "Country code + Phone Number",
            //   controller: profileController.phoneController,
            //   keyboardType: TextInputType.phone,
            //   suffixIcon: null,
            //   prefixIcon: Icon(Icons.phone_outlined,
            //       size: 20.sp, color: Authcolors.whiteColor),
            //   obscureText: false,
            //   validator: (value) {
            //     if (value == null ||
            //         value.isEmpty ||
            //         !RegExp(r"^\+?[0-9]{10,15}$").hasMatch(value)) {
            //       return "Please enter a valid phone number";
            //     }
            //     return null;
            //   },
            //   hintStyle: TextStyle(
            //     color: Authcolors.whiteColor,
            //     fontSize: 16.sp,
            //   ),
            //   readOnly: false,
            // ),
            // // DoB
            // LoginFeild(
            //   onchanged: (value) {
            //     profileController.dobController.text = value;
            //   },
            //   hintText: "Date of Birth",
            //   controller: profileController.dobController,
            //   keyboardType: TextInputType.numberWithOptions(),
            //   suffixIcon: null,
            //   prefixIcon: IconButton(
            //     onPressed: () => profileController.pickDate(context),
            //     icon: Icon(Icons.calendar_month_rounded,
            //         size: 20.sp, color: Authcolors.whiteColor),
            //   ),
            //   obscureText: false,
            //   validator: (value) {
            //     if (value == null ||
            //         value.isEmpty ||
            //         !RegExp(r"^\d{1,2}[/-]\d{1,2}[/-]\d{4}$").hasMatch(value)) {
            //       return "Please enter a valid date of birth";
            //     }
            //     return null;
            //   },
            //   hintStyle: TextStyle(
            //     color: Authcolors.whiteColor,
            //     fontSize: 16.sp,
            //   ),
            //   readOnly: false,
            // ),

            // //    submit button

            // SudmitButton(
            //     onPressed: () {
            //       profileController.updateEp();
            //       profileController.isUploading.value = true;

            //       // Get.snackbar("Error", "Please fill all the fields",
            //       //     backgroundColor: Colors.red, colorText: Colors.white);
            //     },
            //     text: "Update",
            //     isLoading: profileController.isUploading.value),
            //     SizedBox(height: 10.h),

            //     ElevatedButton.icon(
            //       onPressed: () async {
            //         try {
            //           await initiateEmailOtp();
            //           if (mounted) {
            //             showChangeEmailBottomSheet(context);
            //           }
            //         } catch (e) {
            //           Get.snackbar("Error", "Failed to send OTP: ${e.toString()}",
            //               backgroundColor: Colors.red, colorText: Colors.white);
            //         }
            //       },
            //       icon: Icon(Icons.edit, color: Authcolors.whiteColor),
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: Authcolors.gradient3,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(15),
            //           side: BorderSide(
            //             color: Authcolors.backgrounColor,
            //             width: 2,
            //           ),
            //         ),
            //       ),
            //       label: Text(
            //         " Change Email ",
            //         style: const TextStyle(color: Authcolors.whiteColor),
            //       ),
            //     ),
            //     SizedBox(height: 10.h),
            //     ElevatedButton.icon(
            //       onPressed: () async {
            //         try {
            //           await initiateConformpasswordChange();
            //           if (mounted) {
            //             showChangePsswordBottomSheet(context);
            //           }
            //         } catch (e) {
            //           Get.snackbar("Error", "Failed to send OTP: ${e.toString()}",
            //               backgroundColor: Colors.red, colorText: Colors.white);
            //         }
            //       },
            //       icon: Icon(Icons.edit, color: Authcolors.whiteColor),
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: Authcolors.gradient3,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(15),
            //           side: BorderSide(
            //             color: Authcolors.backgrounColor,
            //             width: 2,
            //           ),
            //         ),
            //       ),
            //       label: Text(
            //         " Change Password ",
            //         style: const TextStyle(color: Authcolors.whiteColor),
            //       ),ss
            //     ),
          ],
        ));
  }

  void showChangePsswordBottomSheet(BuildContext context) {
    final ProfileController profileController = Get.find<ProfileController>();

    Get.bottomSheet(
      backgroundColor: Authcolors.backgrounColor,
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Center(
                child: Text(
              "Change Password",
              style: TextStyle(fontSize: 18.sp, color: Authcolors.whiteColor),
            )),
            SizedBox(
              height: 2.h,
            ),
            Obx(
              () => (!profileController.isOtpVerified.value)
                  ? Column(
                      children: [
                        LoginFeild(
                          hintText: "Enter OTP",
                          controller: profileController.otpController,
                          keyboardType: TextInputType.number,
                          suffixIcon: IconButton(
                              onPressed: () {
                                profileController.otpController.clear();
                              },
                              icon: Icon(
                                Icons.cancel,
                                size: 20.sp,
                                color: Authcolors.whiteColor,
                              )),
                          prefixIcon: Icon(
                            Icons.lock_clock_outlined,
                            size: 20.sp,
                            color: Authcolors.whiteColor,
                          ),
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter OTP';
                            } else if (value.length != 6) {
                              return 'Please enter valid 6-digit OTP';
                            }
                            return null;
                          },
                          hintStyle: TextStyle(
                            color: Authcolors.whiteColor,
                            fontSize: 16.sp,
                          ),
                          readOnly: false,
                        ),
                        SudmitButton(
                            onPressed: () {
                              verifypasswordOtp();

                              // profileController.isUploading.value = true;

                              // Get.snackbar("Error", "Please fill all the fields",
                              //     backgroundColor: Colors.red,
                              //     colorText: Colors.white);
                            },
                            text: "Verify OTP",
                            isLoading: profileController.isUploading.value),
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 0.02.h,
                        ),
                        Text(
                          "Enter New Password",
                          style: TextStyle(
                              fontSize: 16.sp, color: Authcolors.whiteColor),
                        ),

                        SizedBox(
                          height: 0.02.h,
                        ),
                        Obx(
                          () => LoginFeild(
                            hintText: " New Password",
                            controller: profileController.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                profileController.isPasswordVisible.value =
                                    !profileController.isPasswordVisible.value;
                              },
                              icon: Icon(
                                profileController.isPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 20.sp,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Authcolors.whiteColor,
                              size: 20.sp,
                            ),
                            obscureText:
                                profileController.isPasswordVisible.value,
                            validator: (value) {
                              RegExp regex = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                              if (value == null || value.isEmpty) {
                                return "Please enter password";
                              } else {
                                if (!regex.hasMatch(value)) {
                                  return "Enter a valid password";
                                }
                              }
                              return null;
                            },
                            hintStyle: TextStyle(
                              color: Authcolors.whiteColor,
                              fontSize: 16.sp,
                            ),
                            readOnly: false,
                          ),
                        ),
                        SizedBox(
                          height: 0.015.h,
                        ),
                        // confirm password feild
                        Obx(
                          () => LoginFeild(
                            hintText: "Confirm Password",
                            controller:
                                profileController.confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                profileController.isPasswordVisible.value =
                                    !profileController.isPasswordVisible.value;
                              },
                              icon: Icon(
                                profileController.isPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 20.sp,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Authcolors.whiteColor,
                              size: 20.sp,
                            ),
                            obscureText:
                                profileController.isPasswordVisible.value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter password";
                              } else {
                                if (value !=
                                    profileController.passwordController.text) {
                                  return "Password does not match";
                                }
                              }
                              return null;
                            },
                            hintStyle: TextStyle(
                              color: Authcolors.whiteColor,
                              fontSize: 16.sp,
                            ),
                            readOnly: false,
                          ),
                        ),
                        SudmitButton(
                            onPressed: () {
                              showOtpDialog();

                              profileController.isUploading.value = true;

                              Get.snackbar(
                                  "Error", "Please fill all the fields",
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white);
                            },
                            text: "Update",
                            isLoading: profileController.isUploading.value)
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void showChangeEmailBottomSheet(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    final ProfileController profileController = Get.find<ProfileController>();

    Get.bottomSheet(
      backgroundColor: Authcolors.backgrounColor,
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Center(
                child: Text(
              "Change Email Address",
              style: TextStyle(fontSize: 18.sp, color: Authcolors.whiteColor),
            )),
            SizedBox(height: 10.h),
            LoginFeild(
              hintText: "New Email",
              controller: profileController.emailController,
              keyboardType: TextInputType.emailAddress,
              suffixIcon: null,
              prefixIcon: Icon(Icons.email_outlined,
                  size: width * 0.050, color: Authcolors.whiteColor),
              obscureText: false,
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r"^[a-zA-Z0-9.!#$%&'*|+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+")
                        .hasMatch(value)) {
                  Get.snackbar(
                    "Error",
                    "Please enter a valid email address",
                    backgroundColor: Authcolors.whiteColor,
                    colorText: Authcolors.backgrounColor,
                    duration: Duration(seconds: 2),
                  );
                  return "Please enter a valid email address";
                }
                return null;
              },
              hintStyle: TextStyle(
                  color: Authcolors.whiteColor, fontSize: width * 0.050),
              readOnly: false,
            ),
            LoginFeild(
              hintText: "Enter Email Otp ",
              controller: profileController.otpController,
              keyboardType: TextInputType.number,
              suffixIcon: IconButton(
                  onPressed: () {
                    profileController.otpController.clear();
                  },
                  icon: Icon(
                    Icons.cancel,
                    size: width * 0.050,
                    color: Authcolors.whiteColor,
                  )),
              prefixIcon: Icon(
                Icons.email,
                size: width * 0.050,
                color: Authcolors.whiteColor,
              ),
              obscureText: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter email otp';
                } else if (value.length != 6) {
                  return 'Please enter valid email 6-digit otp';
                }
                return null;
              },
              hintStyle: TextStyle(
                color: Authcolors.whiteColor,
                fontSize: width * 0.050,
              ),
              readOnly: false,
            ),
            SudmitButton(
                onPressed: () {
                  initiateConformEmailChange();
                  profileController.isUploading.value = true;

                  Get.snackbar("Error", "Please fill all the fields",
                      backgroundColor: Colors.red, colorText: Colors.white);
                },
                text: "Update",
                isLoading: profileController.isUploading.value),
          ],
        ),
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
          SizedBox(height: 10.h),
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

  Widget bottomSheeteditprofile(BuildContext context) {
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
      height: height * 0.25,
      width: width * 0.95,
      child: Column(
        children: [
          Text(
            "Change Email",
            style: TextStyle(color: Authcolors.whiteColor, fontSize: 20.sp),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () => showChangeEmailBottomSheet(context),
                icon: Icon(Icons.edit, color: Authcolors.whiteColor),
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
                label: Text(
                  " Change Password ",
                  style: const TextStyle(color: Authcolors.whiteColor),
                ),
              ),
              SizedBox(width: 5.w),
              ElevatedButton.icon(
                onPressed: () => showChangePsswordBottomSheet(context),
                icon: Icon(Icons.edit, color: Authcolors.whiteColor),
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
                label: Text(
                  " Change Password ",
                  style: const TextStyle(color: Authcolors.whiteColor),
                ),
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

  // Add this method to show OTP dialog
  void showOtpDialog() {
    Get.defaultDialog(
      backgroundColor: Authcolors.backgrounColor,
      title: "Verify OTP",
      content: Column(
        children: [
          Text(
            "We've sent an OTP to your registered email/phone",
            style: TextStyle(color: Authcolors.whiteColor),
          ),
          SizedBox(height: 20),
          LoginFeild(
            hintText: "Enter OTP",
            controller: profileController.otpController,
            keyboardType: TextInputType.number,
            suffixIcon: null,
            prefixIcon: Icon(Icons.email_outlined,
                size: 20.sp, color: Authcolors.whiteColor),
            obscureText: false,
            readOnly: false,
            validator: (otp) {
              if (otp == null || otp.isEmpty) {
                return "Please enter the OTP";
              }
              if (!RegExp(r'^\d{6}$').hasMatch(otp)) {
                return "OTP must be a 6-digit number";
              }
              return null;
            },
            hintStyle: TextStyle(
              color: Authcolors.whiteColor,
              fontSize: 16.sp,
            ),
          ),

          // TextField(
          //   controller: profileController.otpController,
          //   keyboardType: TextInputType.number,
          //   decoration: InputDecoration(
          //     labelText: "Enter OTP",
          //     border: OutlineInputBorder(),
          //     labelStyle: TextStyle(color: Authcolors.whiteColor),
          //   ),
          // ),
          SizedBox(height: 20),
          Obx(() => profileController.isOtpSent.value
              ? TextButton(
                  onPressed: () {
                    verifypasswordOtp();
                  },
                  child: Text("Resend OTP"))
              : Text(
                  "Resend OTP in ${profileController.otpCountdown.value} seconds")),
        ],
      ),
      confirm: Obx(() => profileController.isUploading.value
          ? CircularProgressIndicator()
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Authcolors.backgrounColor,
              ),
              onPressed: profileController.verifyOtpAndUpdateProfile,
              child: Text(
                "Verify & Update",
                style: TextStyle(color: Authcolors.whiteColor),
              ),
            )),
    );
  }

  Future<void> verifypasswordOtp() async {
    profileController.isUploading.value = true;
    try {
      final response = await ApiClient.post('verifyOtpPasswordChange', {
        'otp': profileController.otpController.text,
      });

      if (response.statusCode == 200) {
        profileController.isOtpSent.value = true;

        Get.snackbar("Success", "OTP  successfully verified",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar("Error", "invalid verify OTP",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to verify OTP",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      profileController.isUploading.value = false;
    }
  }

// Add this method to initiate OTP sending
  Future<void> initiateEmailOtp() async {
    profileController.isUploading.value = true;
    try {
      final response = await ApiClient.post('initiateEmailChange', {
        'email': profileController.userEmail.value,
      });
      if (response.statusCode == 200) {
        Get.snackbar("Success", "OTP resent successfully",
            backgroundColor: Colors.green, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to resend OTP",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      profileController.isUploading.value = false;
    }
  }

  Future<void> initiateConformEmailChange() async {
    profileController.isUploading.value = true;
    try {
      final response = await ApiClient.post('confirmEmailChange', {
        'email': profileController.userEmail.value,
      });
      // {'otp': profileController.otpController.text});
      if (response.statusCode == 200) {
        profileController.startOtpCountdown();
        Get.snackbar("Success", "OTP resent successfully",
            backgroundColor: Colors.green, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to resend OTP",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      profileController.isUploading.value = false;
    }
  }

  Future<void> initiateConformpasswordChange() async {
    profileController.isUploading.value = true;
    try {
      final response = await ApiClient.post('initiatePasswordChange', {
        'email': profileController.userPassword.value,
      });
      // {'otp': profileController.otpController.text});
      if (response.statusCode == 200) {
        profileController.startOtpCountdown();
        Get.snackbar("Success", "OTP resent successfully",
            backgroundColor: Colors.green, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to resend OTP",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      profileController.isUploading.value = false;
    }
  }
}

Widget buildMenuItem({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
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
    ),
  );
}

void changePersonalDetails(BuildContext context) {
 // double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  final ProfileController profileController = Get.find<ProfileController>();
  Get.bottomSheet(
    backgroundColor: Authcolors.backgrounColor,
    SizedBox(
      height: height * 0.4,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text("Change Personal Details",
                  style:
                      TextStyle(fontSize: 20.h, color: Authcolors.whiteColor)),
              SizedBox(height: 20.h),
              LoginFeild(
                onchanged: (value) {
                  profileController.nameController.text = value;
                  profileController.userName.value = value;
                },
                hintText: "User Name",
                controller: profileController.nameController,
                keyboardType: TextInputType.text,
                suffixIcon: null,
                prefixIcon: Icon(Icons.person_outline,
                    size: 20.sp, color: Authcolors.whiteColor),
                obscureText: false,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r"^(?=.*[A-Z])[a-zA-Z0-9._]{3,15}$")
                          .hasMatch(value)) {
                    return "Please enter a valid name(only alphabets and spaces)";
                  }
                  return null;
                },
                hintStyle: TextStyle(
                  color: Authcolors.whiteColor,
                  fontSize: 16.sp,
                ),
                readOnly: false,
              ),

              SizedBox(
                height: 0.02.w,
              ),

              // phone number feild
              LoginFeild(
                onchanged: (value) {
                  profileController.phoneController.text = value;
                  profileController.userPhoneNumber.value = value;
                },
                hintText: "Country code + Phone Number",
                controller: profileController.phoneController,
                keyboardType: TextInputType.phone,
                suffixIcon: null,
                prefixIcon: Icon(Icons.phone_outlined,
                    size: 20.sp, color: Authcolors.whiteColor),
                obscureText: false,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r"^\+?[0-9]{10,15}$").hasMatch(value)) {
                    return "Please enter a valid phone number";
                  }
                  return null;
                },
                hintStyle: TextStyle(
                  color: Authcolors.whiteColor,
                  fontSize: 16.sp,
                ),
                readOnly: false,
              ),
              // DoB
              LoginFeild(
                onchanged: (value) {
                  profileController.dobController.text = value;
                },
                hintText: "Date of Birth",
                controller: profileController.dobController,
                keyboardType: TextInputType.numberWithOptions(),
                suffixIcon: null,
                prefixIcon: IconButton(
                  onPressed: () => profileController.pickDate(context),
                  icon: Icon(Icons.calendar_month_rounded,
                      size: 20.sp, color: Authcolors.whiteColor),
                ),
                obscureText: false,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r"^\d{1,2}[/-]\d{1,2}[/-]\d{4}$")
                          .hasMatch(value)) {
                    return "Please enter a valid date of birth";
                  }
                  return null;
                },
                hintStyle: TextStyle(
                  color: Authcolors.whiteColor,
                  fontSize: 16.sp,
                ),
                readOnly: false,
              ),

              //    submit button

              SudmitButton(
                  onPressed: () {
                    profileController.updateEp();
                    profileController.isUploading.value = true;

                    // Get.snackbar("Error", "Please fill all the fields",
                    //     backgroundColor: Colors.red, colorText: Colors.white);
                  },
                  text: "Update",
                  isLoading: profileController.isUploading.value),
            ],
          ),
        ),
      ),
    ),
  );
}

class EnterHomeAdress extends StatelessWidget {
  const EnterHomeAdress({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Authcolors.backgrounColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Authcolors.borederColor,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios,
                  color: Authcolors.whiteColor),
            ),
            SizedBox(width: 10.w),
            const Text("Enter Home Address",
                style: TextStyle(color: Authcolors.whiteColor)),
          ],
        ),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Text(
                  "Please enter your home address details",
                  style:
                      TextStyle(color: Authcolors.whiteColor, fontSize: 18.sp),
                ),
                SizedBox(height: 10.h),
                LoginFeild(
                  onchanged: (value) {
                    // Handle address input
                  },
                  hintText: "Enter your Home Address",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  suffixIcon: null,
                  prefixIcon: Icon(Icons.home,
                      size: 20.sp, color: Authcolors.whiteColor),
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your home address";
                    }
                    return null;
                  },
                  hintStyle: TextStyle(
                    color: Authcolors.whiteColor,
                    fontSize: 16.sp,
                  ),
                  readOnly: false,
                ),
                SizedBox(height: 10.h),
                LoginFeild(
                  onchanged: (value) {
                    // Handle address input
                  },
                  hintText: "Enter your Area",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  suffixIcon: null,
                  prefixIcon: Icon(Icons.area_chart,
                      size: 20.sp, color: Authcolors.whiteColor),
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your area";
                    }
                    return null;
                  },
                  hintStyle: TextStyle(
                    color: Authcolors.whiteColor,
                    fontSize: 16.sp,
                  ),
                  readOnly: false,
                ),
                SizedBox(height: 10.h),
                LoginFeild(
                  onchanged: (value) {
                    // Handle city input
                  },
                  hintText: "Enter your city",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  suffixIcon: null,
                  prefixIcon: Icon(Icons.location_city,
                      size: 20.sp, color: Authcolors.whiteColor),
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your city";
                    }
                    return null;
                  },
                  hintStyle: TextStyle(
                    color: Authcolors.whiteColor,
                    fontSize: 16.sp,
                  ),
                  readOnly: false,
                ),
                SizedBox(height: 10.h),
                LoginFeild(
                  onchanged: (value) {
                    // Handle state input
                  },
                  hintText: "Enter your state",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  suffixIcon: null,
                  prefixIcon: Icon(Icons.map_rounded,
                      size: 20.sp, color: Authcolors.whiteColor),
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your state";
                    }
                    return null;
                  },
                  hintStyle: TextStyle(
                    color: Authcolors.whiteColor,
                    fontSize: 16.sp,
                  ),
                  readOnly: false,
                ),
                SizedBox(height: 10.h),
                LoginFeild(
                  onchanged: (value) {
                    // Handle address input
                  },
                  hintText: "Enter your Country",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  suffixIcon: null,
                  prefixIcon: Icon(Icons.public,
                      size: 20.sp, color: Authcolors.whiteColor),
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your Country";
                    }
                    return null;
                  },
                  hintStyle: TextStyle(
                    color: Authcolors.whiteColor,
                    fontSize: 16.sp,
                  ),
                  readOnly: false,
                ),
                SizedBox(height: 10.h),
                LoginFeild(
                  onchanged: (value) {
                    // Handle pincode input
                  },
                  hintText: "Enter your pincode",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.number,
                  suffixIcon: null,
                  prefixIcon: Icon(Icons.pin_drop,
                      size: 20.sp, color: Authcolors.whiteColor),
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 6) {
                      return "Please enter a valid pincode";
                    }
                    return null;
                  },
                  hintStyle: TextStyle(
                    color: Authcolors.whiteColor,
                    fontSize: 16.sp,
                  ),
                  readOnly: false,
                ),
                SizedBox(height: 10.h),
                SudmitButton(
                    onPressed: () {}, text: "Update Adress ", isLoading: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
