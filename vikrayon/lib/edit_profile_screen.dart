import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/utils/colors.dart';
import 'package:vikrayon/views/auth/widgets_auth/login_feild.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ForgotPasswordController controler =
      Get.find<ForgotPasswordController>();
  final EditProfileController controller = Get.put(EditProfileController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Authcolors.backgrounColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Authcolors.backgrounColor,
        title: Center(
          child: Text(
            'Edit Profile',
            style: TextStyle(
              color: Authcolors.whiteColor,
            ),
          ),
        ),
      ),
      body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),

                // name feild
                LoginFeild(
                  hintText: "User Name",
                  controller: controller.nameController,
                  keyboardType: TextInputType.text,
                  suffixIcon: null,
                  prefixIcon: Icon(Icons.person_outline,
                      size: width * 0.050, color: Authcolors.whiteColor),
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
                    fontSize: width * 0.050,
                  ),
                ),

                SizedBox(
                  height: height * 0.02,
                ),
                // email feild
                LoginFeild(
                  hintText: "Email",
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: null,
                  prefixIcon: Icon(Icons.email_outlined,
                      size: width * 0.050, color: Authcolors.whiteColor),
                  obscureText: false,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.!#$%&'*|+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+")
                            .hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  hintStyle: TextStyle(
                    color: Authcolors.whiteColor,
                    fontSize: width * 0.050,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      onPressed: () {
                        _showChangeEmailDialog(context);
                      },
                      child: Text(
                        "Change Email",
                        style: TextStyle(color: Authcolors.whiteColor),
                      )),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                // // password feild
                // Obx(
                //   () => LoginFeild(
                //     hintText: "Password",
                //     controller: controller.passwordController,
                //     keyboardType: TextInputType.visiblePassword,
                //     suffixIcon: IconButton(
                //       onPressed: () {
                //         controller.isPasswordVisible.value =
                //             !controller.isPasswordVisible.value;
                //       },
                //       icon: Icon(
                //         controller.isPasswordVisible.value
                //             ? Icons.visibility_off
                //             : Icons.visibility,
                //         size: width * 0.050,
                //       ),
                //     ),
                //     prefixIcon: Icon(
                //       Icons.lock,
                //       color: Authcolors.whiteColor,
                //       size: width * 0.050,
                //     ),
                //     obscureText: controller.isPasswordVisible.value,
                //     validator: (value) {
                //       RegExp regex = RegExp(
                //           r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                //       if (value == null || value.isEmpty) {
                //         return "Please enter password";
                //       } else {
                //         if (!regex.hasMatch(value)) {
                //           return "Enter a valid password";
                //         }
                //       }
                //       return null;
                //     },
                //     hintStyle: TextStyle(
                //       color: Authcolors.whiteColor,
                //       fontSize: width * 0.050,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: height * 0.015,
                // ),
                // // confirm password feild
                // Obx(
                //   () => LoginFeild(
                //     hintText: "Confirm Password",
                //     controller: controller.confirmpasswordcontroller,
                //     keyboardType: TextInputType.visiblePassword,
                //     suffixIcon: IconButton(
                //       onPressed: () {
                //         controller.isPasswordVisible.value =
                //             !controller.isPasswordVisible.value;
                //       },
                //       icon: Icon(
                //         controller.isPasswordVisible.value
                //             ? Icons.visibility_off
                //             : Icons.visibility,
                //         size: width * 0.050,
                //       ),
                //     ),
                //     prefixIcon: Icon(
                //       Icons.lock,
                //       color: Authcolors.whiteColor,
                //       size: width * 0.050,
                //     ),
                //     obscureText: controller.isPasswordVisible.value,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return "Please enter password";
                //       } else {
                //         if (value != controller.passwordController.text) {
                //           return "Password does not match";
                //         }
                //       }
                //       return null;
                //     },
                //     hintStyle: TextStyle(
                //       color: Authcolors.whiteColor,
                //       fontSize: width * 0.045,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: height * 0.015,
                ),

                _buildChangePasswordSection(context, width, height),
                // phone number feild
                LoginFeild(
                  hintText: "Country code + Phone Number",
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  suffixIcon: null,
                  prefixIcon: Icon(Icons.phone_outlined,
                      size: width * 0.050, color: Authcolors.whiteColor),
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
                    fontSize: width * 0.035,
                  ),
                ),

                SizedBox(
                  height: height * 0.015,
                ),
                // date of birth feild
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date of Birth",
                          style: TextStyle(
                            color: Authcolors.whiteColor,
                            fontSize: width * 0.050,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Container(
                          padding: EdgeInsets.all(width * 0.03),
                          decoration: BoxDecoration(
                            border: Border.all(color: Authcolors.whiteColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.dobcontroller.text.isEmpty
                                    ? "Select your date of birth"
                                    : controller.dobcontroller.text,
                                style: TextStyle(
                                  color: Authcolors.whiteColor,
                                  fontSize: width * 0.040,
                                ),
                              ),
                              Icon(Icons.calendar_today,
                                  size: width * 0.050,
                                  color: Authcolors.whiteColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // child: LoginFeild(
                //   hintText: "Date of Birth",
                //   controller: controller.dobcontroller,
                //   keyboardType: TextInputType.datetime,
                //   suffixIcon: null,
                //   prefixIcon: null,
                //   obscureText: false,
                //   validator: (value) => null,
                //   hintStyle: TextStyle(
                //       color: Authcolors.whiteColor, fontSize: width * 0.050),
                // ),
              ],
            ),
          )),
    );
  }

  Widget _buildChangePasswordSection(
      BuildContext context, double width, double height) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: Text(
          'Change Password',
          style: TextStyle(
            color: Authcolors.whiteColor,
            fontSize: width * 0.050,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: height * 0.015,
      ),
      TextButton(
        onPressed: () {
          _showChangePasswordDialog(context);
        },
        child: Center(
          child: Text(
            "Click here to Change Password",
            style: TextStyle(color: Authcolors.whiteColor),
          ),
        ),
      ),
      SizedBox(
        height: height * 0.015,
      ),
    ]);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (picked != null) {
      controller.dobcontroller.text =
          "${picked.day}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
    }
  }

  void _showChangeEmailDialog(BuildContext context) {
    final newEmailController = TextEditingController();
    final otpController = TextEditingController();
    Get.defaultDialog(
      title: "Change Email",
      content: Column(children: [
        LoginFeild(
            hintText: "new email",
            controller: newEmailController,
            keyboardType: TextInputType.emailAddress,
            suffixIcon: null,
            prefixIcon: null,
            obscureText: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter new email";
              }
              if (!RegExp(
                      r"^[a-zA-Z0-9.!#$%&'*|+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+")
                  .hasMatch(value)) {
                return "Please enter a valid email";
              }
              return null;
            },
            hintStyle: TextStyle(
              color: Authcolors.whiteColor,
            )),
        Obx(() => controller.isOtpSent.value
            ? Column(children: [
                LoginFeild(
                    hintText: "OTP",
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    suffixIcon: null,
                    prefixIcon: null,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter OTP";
                      }
                      return null;
                    },
                    hintStyle: TextStyle(
                      color: Authcolors.whiteColor,
                    )),
                SizedBox(height: 0.015.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.canResendOtp.value
                          ? "Resend OTP"
                          : "Resend OTP in ${controller.otpCountdown.value} seconds",
                      style: TextStyle(color: Authcolors.whiteColor),
                    ),
                    TextButton(
                      onPressed: controller.canResendOtp.value
                          ? () => controler.sendOtp()
                          : null,
                      child: Text(
                        "Resend",
                        style: TextStyle(color: Authcolors.whiteColor),
                      ),
                    )
                  ],
                )
              ])
            : SizedBox()),
      ]),
      confirm: Obx(
        () => ElevatedButton(
            onPressed: controller.isLoading.value
                ? null
                : () {
                    if (controller.isOtpSent.value) {
                      if (newEmailController.text.isEmpty ||
                          otpController.text.isEmpty) {
                        Get.snackbar("Error", "Please fill in all fields",
                            backgroundColor: Colors.red,
                            colorText: Colors.white);
                        return;
                      }
                      controller.confirmEmailChange();
                    } else {
                      if (newEmailController.text.isEmpty) {
                        Get.snackbar("Error", "Please fill in all fields",
                            backgroundColor: Colors.red,
                            colorText: Colors.white);
                        return;
                      }
                      controler.sendOtp();
                    }
                  },
            child: Text(controller.isLoading.value
                ? "Loading..."
                : controller.isOtpSent.value
                    ? "Confirm"
                    : "Send OTP")),
      ),
      cancel:
          ElevatedButton(onPressed: () => Get.back(), child: Text("Cancel")),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    Get.defaultDialog(
      title: "Change Password",
      content: Column(children: [
        LoginFeild(
            hintText: "Password",
            controller: controller.passwordController,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              icon: Icon(controller.isPasswordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off),
              onPressed: () => controller.isPasswordVisible.toggle(),
            ),
            prefixIcon: null,
            obscureText: !controller.isPasswordVisible.value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter password";
              }
              return null;
            },
            hintStyle: TextStyle(
              color: Authcolors.whiteColor,
            )),
        LoginFeild(
            hintText: "Confirm Password",
            controller: controller.confirmpasswordcontroller,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              icon: Icon(controller.isPasswordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off),
              onPressed: () => controller.isPasswordVisible.toggle(),
            ),
            prefixIcon: null,
            obscureText: !controller.isPasswordVisible.value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter password"; // Replace with your desired error message
              } else if (value != controller.passwordController.text) {
                return "Passwords do not match"; // Replace with your desired error message
              }
              return null;
            },
            hintStyle: TextStyle(
              color: Authcolors.whiteColor,
            )),
      ]),
      confirm: Obx(
        () => ElevatedButton(
          onPressed: () {
            if (controller.formKey.currentState!.validate()) {
              controller.formKey.currentState!.save();
              controller.verifyPasswordChangeOtp();
              controller.setNewPassword(controller.passwordController.text);
            }
          },
          child: controller.isLoading.value
              ? CircularProgressIndicator()
              : Text("Change Password"),
        ),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("Cancel"),
      ),
    );
  }
}

class EditProfileController extends GetxController {
  final AuthController authController = Get.find<AuthController>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final dobcontroller = TextEditingController();
  final newEmailController = TextEditingController();
  final otpController = TextEditingController();

  // observarables
  RxBool isLoading = false.obs;
  RxBool isOtpSent = false.obs;
  RxBool canResendOtp = false.obs;
  RxInt otpCountdown = 30.obs;
  Timer? countdownTimer;
  RxString profilePictureUrl = ''.obs;

  // form key
  final formKey = GlobalKey<FormState>();
  final isPasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadCurrentUserData();
  }

  void loadCurrentUserData() {
    nameController.text = authController.userName.value;
    emailController.text = authController.userEmail.value;
    phoneController.text = authController.userphonenumber.value;
    profilePictureUrl.value = authController.userImage.value;
  }

  void startOtpCountdown({int seconds = 30}) {
    otpCountdown.value = seconds;
    canResendOtp.value = false;
    countdownTimer?.cancel();
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (otpCountdown.value > 0) {
        otpCountdown.value--;
      } else {
        timer.cancel();
        canResendOtp.value = true;
      }
    });
  }

  Future<void> updateProfile() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty) {
      Get.snackbar("Error", "All fields are required",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    isLoading.value = true;
    try {
      final response =
          await authController.dio.put('/auth/edit-profile', data: {
        "name": nameController.text,
        "phoneNumber": phoneController.text,
        "dateOfBirth": dobcontroller.text,
        "email": emailController.text,
        "profileImageUrl": profilePictureUrl.value,
      });
      if (response.statusCode == 200) {
        authController.userName.value = nameController.text;
        authController.userEmail.value = emailController.text;
        authController.userphonenumber.value = phoneController.text;
        authController.userImage.value = profilePictureUrl.value;
        Get.snackbar("Success", "Profile updated successfully",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Failed to update profile",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Failed to update profile",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> initiateEmailChange() async {
    if (newEmailController.text.isEmpty) {
      Get.snackbar("Error", "Email is required",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    try {
      isLoading.value = true;
      final response = await authController.dio.post(
        '/auth/epchange-email/initate',
      );
      if (response.statusCode == 200) {
        isOtpSent.value = true;
        startOtpCountdown();
      } else {
        Get.snackbar("Error", "Failed to initiate email change",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Failed to initiate email change",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> confirmEmailChange() async {
    if (otpController.text.isEmpty) {
      Get.snackbar("Error", "Please enter OTP",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }

    isLoading.value = true;
    try {
      final response = await authController.dio.post(
        '/auth/epchange-email/confirm',
        data: {
          'newEmail': newEmailController.text,
          'otp': otpController.text,
        },
      );

      if (response.statusCode == 200) {
        // Update local email
        authController.userEmail.value = newEmailController.text;
        emailController.text = newEmailController.text;

        Get.snackbar("Success", "Email updated successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
        Get.back(); // Close dialog or return to previous screen
      } else {
        throw Exception(
            response.data['message'] ?? "Failed to confirm email change");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> initiatePasswordChange() async {
    isLoading.value = true;
    try {
      final response = await authController.dio.post(
        '/auth/epchange-password/initate',
      );
      if (response.statusCode == 200) {
        isOtpSent.value = true;
        startOtpCountdown();
      } else {
        Get.snackbar("Error", "Failed to initiate password change",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Failed to initiate password change",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyPasswordChangeOtp() async {
    if (otpController.text.isEmpty) {
      Get.snackbar("Error", "Please enter OTP",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    isLoading.value = true;
    try {
      final response = await authController.dio
          .post('/auth/epchange-password/verify', data: {
        "otp": otpController.text,
      });
      if (response.statusCode == 200) {
        Get.snackbar("Success", "OTP verified successfully",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Failed to verify OTP",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Failed to verify OTP",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> setNewPassword(String newPassword) async {
    if (newPassword.isEmpty) {
      Get.snackbar("Error", "Please enter new password",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    isLoading.value = true;
    try {
      final response = await authController.dio
          .post('/auth/epchange-password/set-new-password', data: {
        "new_password": newPassword,
      });
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Password changed successfully",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Failed to change password",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to change password",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> forgotPassword(String email) async {
    isLoading.value = true;
    try {
      final response =
          await authController.dio.post('/auth/forgot-password', data: {
        "email": email,
      });
      if (response.statusCode == 200) {
        isOtpSent.value = true;
        startOtpCountdown();
      } else {
        Get.snackbar("Error", "Failed to initiate password change",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to initiate password change",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyForgotPsswordOtp(String email, String otp) async {
    isLoading.value = true;
    try {
      final response = await authController.dio
          .post('/auth/forgot-password/verify-otp', data: {
        "email": email,
        "otp": otp,
      });
      if (response.statusCode == 200) {
        Get.snackbar("Success", "OTP verified successfully",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Failed to verify OTP",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to verify OTP",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> setNewPasswordAfterFAorgot(
      String email, String newPassword) async {
    isLoading.value = true;
    try {
      final response = await authController.dio
          .post('/auth/forgot-password/set-new-password', data: {
        "email": email,
        "new_password": newPassword,
      });
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Password changed successfully",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Failed to change password",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to change password",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    dobcontroller.dispose();
    otpController.dispose();
    newEmailController.dispose();
    countdownTimer?.cancel();
    super.onClose();
  }
}
