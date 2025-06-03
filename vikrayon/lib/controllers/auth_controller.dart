import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:vikrayon/main_screen.dart';
import 'package:vikrayon/splash_screens/Main_splashscreen.dart';
import 'package:vikrayon/views/auth/login_screen.dart';
import 'package:vikrayon/views/auth/user_conformation_screen.dart';

class AuthController extends GetxController {


  static AuthController get to => Get.find();
  var isLoggedIn = false.obs;

  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://vikrayon.com',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    contentType: 'application/json',
    responseType: ResponseType.json,
  ));
  Future<void> saveSignupSession(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isUserCreated', true);
    await prefs.setString('userEmail', email);
  }

  Future<void> saveLoginSession(String email, String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userEmail', email);
    await prefs.setString('token', token);
    isLoggedIn.value = true;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('token');
    await prefs.remove('userEmail');
    isLoggedIn.value = false;
    Get.offAll(() => LoginScreen());
  }

  Future<String> getIntialRoute() async {
    final prefs = await SharedPreferences.getInstance();
    final isUserCreated = prefs.getBool('isUserCreated') ?? false;
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final email = prefs.getString('userEmail') ?? '';
    final token = prefs.getString('token') ?? '';

    if (!isUserCreated) return 'signup';
    if (isLoggedIn && email.isNotEmpty && token.isNotEmpty) return 'main';
    return 'login';
  }

  // google signin function
  var userName = ''.obs;

  RxString userEmail = ''.obs;
  RxString userphonenumber = ''.obs;
  RxString userImage = ''.obs;
  RxBool isGoogleUser = false.obs;
  RxString profilepicpath = ''.obs;

  // normal signin function

  Future<void> loginuser(String name, String email, String phonenumber) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('userName', name);
    await prefs.setString('userEmail', email);
    await prefs.setString('userImage', '');
    await prefs.setString('userphonenumber', phonenumber);
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userType', 'normal');

    userName.value = name;
    userEmail.value = email;
    userImage.value = '';
    userphonenumber.value = phonenumber;

    Get.off(() => MainScreen());
  }
  // Google Sign In

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
  );
  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        Get.snackbar("Error", "Google Sign-In failed!",
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      // final photoUrl = googleUser.photoUrl ?? '';
      await fetchGoogleProfile(googleUser);
      // final prefs = await SharedPreferences.getInstance();
      // await prefs.setString('userName', googleUser.displayName ?? '');
      // await prefs.setString('userEmail', googleUser.email);
      // await prefs.setString('userphonenumber', '');
      // await prefs.setString('userImage', googleUser.photoUrl ?? '');
      // await prefs.setBool('isLoggedIn', true);
      // await prefs.setBool('isGoogleUser', true);
      // await prefs.setBool('isUserCreated', true);
      // await prefs.setString('userType', 'google');

      // // update RX variables
      // userName.value = googleUser.displayName ?? '';
      // userEmail.value = googleUser.email;
      // userphonenumber.value = '';
      // userImage.value = googleUser.photoUrl ?? '';
      Get.off(() => MainScreen());
    } catch (error) {
      Get.snackbar("Error", "Google Sign-In failed!",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> fetchGoogleProfile(GoogleSignInAccount googleUser) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      // final bool isGoogleUser = prefs.getBool('isGoogleUser') ?? false;

      // if (!isGoogleUser) return;

      // final GoogleSignInAccount? googleUser =
      //     await _googleSignIn.signInSilently();

      // if (googleUser == null) {
      //   await prefs.clear();
      //   Get.off(() => LoginScreen());
      //   Get.snackbar("Error", "Google Sign-In failed!",
      //       snackPosition: SnackPosition.BOTTOM);
      //   return;
      // }

      userName.value = googleUser.displayName ?? 'Google User';
      userEmail.value = googleUser.email;
      userphonenumber.value = '';
      userImage.value = googleUser.photoUrl ?? '';
      profilepicpath.value = '';

      // Save Google user info locally
      await prefs.setString('userName', userName.value);
      await prefs.setString('userEmail', userEmail.value);
      await prefs.setBool('isGoogleUser', true);
      await prefs.setString('userImage', userImage.value);
    } catch (e) {
      await prefs.clear();
      Get.snackbar("Error", "Google profile fetch failed: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xff5ce1e6));
      Get.off(() => LoginScreen());
    }
  }

  // load user data from shared preferences
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    userName.value = prefs.getString('userName') ?? '';
    userEmail.value = prefs.getString('userEmail') ?? '';
    userphonenumber.value = prefs.getString('userphonenumber') ?? '';
    userImage.value = prefs.getString('userImage') ?? '';
  }

  // Google Sign Out

  Future<void> googleSignOut() async {
    await _googleSignIn.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userName');
    await prefs.remove('userEmail');
    await prefs.remove('userphonenumber');
    await prefs.remove('userImage');
    await prefs.remove('profilepicpath');
    await prefs.remove('isLoggedIn');
    await prefs.remove('isGoogleUser');

    userName.value = '';
    userEmail.value = '';
    userphonenumber.value = '';
    userImage.value = '';
    profilepicpath.value = '';
    isGoogleUser.value = false;

    Get.off(() => LoginScreen());
  }
  // Login function

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/login',
        data: {'email': email, 'password': password},
      );
      return response.data;
    } on DioException catch (e) {
      return {
        "message": e.response?.data['message'] ?? "Login failed!",
        "status": e.response?.statusCode
      };
    }
  }

  // signup function

  Future<Map<String, dynamic>> signup(String name, String email,
      String password, String confirmPassword, String phoneNumber) async {
    try {
      final response = await dio.post(
        '/register?role=user',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'phoneNumber': phoneNumber
        },
      );
      if (response.data is String) {
        return {"message": response.data, "status": "success"};
      } else if (response.data is Map<String, dynamic>) {
        return response.data;
      } else {
        throw Exception('Invalid response format');
      }
    } on DioException catch (e) {
      return {
        "message": e.response?.data['message'] ?? "Signup failed!",
        "status": "error",
      };
    }
  }

  // Confirm Otp Function

  Future<Map<String, dynamic>> confirmOtp(String email, String otp) async {
    try {
      final response = await dio.post(
        '/confirm-otp',
        data: {'email': email, 'otp': otp},
      );

      dynamic data = response.data;
      if (data is String) {
        try {
          data = json.decode(data);
        } catch (e) {
          return {"message": data, "status": "error"};
        }
      }

      if (data is Map<String, dynamic>) {
        return data;
      } else if (data is Map) {
        return Map<String, dynamic>.from(data);
      } else {
        return {"message": "Invalid response format", "status": "error"};
      }
    } on DioException catch (e) {
      dynamic errdata = e.response?.data;
      if (errdata is String) {
        try {
          errdata = json.decode(errdata);
        } catch (_) {}
      }
      if (errdata is! Map) {
        errdata = {"message": errdata, "status": "error"};
      }
      return {
        "message": errdata['message'] ?? "Invalid OTP!",
        "status": e.response?.statusCode
      };
    }
  }

  // Resend Otp Function

  Future<Map<String, dynamic>> resendOtp(String email,
      {String type = "User_Confirmation"}) async {
    try {
      final response = await dio.post(
        '/resend-otp',
        data: {'email': email, 'type': type},
      );
      return response.data;
    } on DioException catch (e) {
      return {
        "message": e.response?.data['message'] ?? "Resend OTP failed!",
        "status": e.response?.statusCode
      };
    }
  }

  // reset password()

  Future<Map<String, dynamic>> resetPassword(
      String email, String otp, String newPassword) async {
    try {
      final response = await dio.post(
        '/reset-password',
        data: {'email': email, 'otp': otp, 'newPassword': newPassword},
      );
      return response.data;
    } on DioException catch (e) {
      return {
        "message": e.response?.data['message'] ?? "Reset Password failed!",
        "status": e.response?.statusCode
      };
    }
  }

  // fetch user profile from api
  Future<Map<String, dynamic>> getUserProfile() async {
    try {
      final response = await dio.get(
        '/profile',
      );
      return response.data;
    } on DioException catch (e) {
      return {
        "message": e.response?.data['message'] ?? "Error:${e.toString()}",
        "status": e.response?.statusCode
      };
    }
  }
}

class LoginControler extends GetxController {
  final AuthController authService = Get.find<AuthController>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController forgotEmailController = TextEditingController();

  var isPasswordVisible = false.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    String email = emailController.value.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please enter both email and pasword",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }
    isLoading(true);
    try {
      final response = await authService.login(email, password);
      print("Login API response: $response");
      if (response.containsKey('jwtToken')) {
        Get.offAll(() => MainScreen());
      } else {
        Get.snackbar("Login Falied", response['message'] ?? "Unknown error",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "An error occured: ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    } finally {
      isLoading(false);
    }
  }

  Future<void> sendResentOtp({bool isForgot_Password = false}) async {
    String email = forgotEmailController.value.text.trim();
    if (email.isEmpty) {
      Get.snackbar("Error", "Please enter your email",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }
    isLoading(true);
    try {
      final response = await authService.resendOtp(email,
          type: isForgot_Password ? 'forgot_password' : 'user_confirmation');
      if (response['status'] == 200) {
        Get.snackbar(
            "Success", response['message'] ?? "OTP resent successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      } else {
        Get.snackbar("Error", response['message'] ?? "Failed to resend OTP",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "An error occured: ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    } finally {
      isLoading(false);
    }
  }

  Future<void> resetPassword(String email) async {
    String otp = otpController.text.trim();
    String newPassword = newPasswordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (otp.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar("Error", "Please fill all fields",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }
    if (newPassword != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }
    isLoading(true);
    try {
      final response = await authService.resetPassword(email, otp, newPassword);
      if (response['status'] == 200) {
        Get.snackbar("Success", response['message'] ?? "Unknown error",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      } else {
        Get.snackbar("Error", response['message'] ?? "Unknown error",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "An error occured: ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    } finally {
      isLoading(false);
    }
  }
}

class SignupControler extends GetxController {
  final AuthController authService = Get.find<AuthController>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passswordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxBool isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> signup() async {
    isLoading(true);

    if (namecontroller.text.isEmpty ||
        emailcontroller.text.isEmpty ||
        passswordcontroller.text.isEmpty ||
        confirmpasswordcontroller.text.isEmpty ||
        phonenumbercontroller.text.isEmpty) {
      Get.snackbar("Error", "All fields are required",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      isLoading(false);
      return;
    }

    if (passswordcontroller.text != confirmpasswordcontroller.text) {
      Get.snackbar("Error", "Passwords do not match",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      isLoading(false);
      return;
    }

    try {
      final phonenumber = phonenumbercontroller.text.trim();
      if (phonenumber.isEmpty) {
        Get.snackbar("Error", "Invalid phone number",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
        isLoading(false);
        return;
      }
      final response = await authService.signup(
          namecontroller.text.trim(),
          emailcontroller.text.trim(),
          passswordcontroller.text,
          confirmpasswordcontroller.text,
          phonenumber);
      print("Signup API response: $response");

      if (response['status'] == 'success') {
        final email = emailcontroller.text.trim();
        //response.containsKey('jwtToken')) {

        final userConformationControler = Get.put(UserConformationControler());
        userConformationControler.setEmail(email);
        Get.offAll(() => UserConformationScreen(), arguments: {
          'email': email,
        });
      } else {
        Get.snackbar("Error", response['message'] ?? "Signup failed!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "An error occured: ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    } finally {
      isLoading(false);
    }
  }
}

class ForgotPasswordController extends GetxController {
  final AuthController authService = Get.find<AuthController>();

  TextEditingController emailControllers = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;

  RxBool canResendOtp = false.obs;
  RxInt otpCountdown = 30.obs;
  Timer? countdownTimer;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
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

  Future<void> sendOtp() async {
    final email = emailControllers.text.trim();
    if (email.isEmpty) {
      Get.snackbar("Error", "Please enter your email",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }

    isLoading.value = true;
    try {
      final response =
          await authService.resendOtp(email, type: 'forgot_password');
      if (response['status'] == 200 || response['status'] == 'success') {
        Get.snackbar("Success", response['message'] ?? "OTP sent to email",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
        startOtpCountdown();
        Get.to(() => OtpScreen());
      } else {
        Get.snackbar("Error", response['message'] ?? "Failed to send OTP",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendForgotOtp() async {
    final email = emailControllers.text.trim();
    if (email.isEmpty) {
      Get.snackbar("Error", "Email is empty",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }

    isLoading.value = true;
    try {
      final response =
          await authService.resendOtp(email, type: 'forgot_password');
      if (response['status'] == 200 || response['status'] == 'success') {
        Get.snackbar("Success", "OTP resent successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
        startOtpCountdown();
      } else {
        Get.snackbar("Error", response['message'] ?? "Failed to resend OTP",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetPassword() async {
    final email = emailControllers.text.trim();
    final otp = otpController.text.trim();
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (otp.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }

    if (newPassword != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }

    isLoading.value = true;
    try {
      final response = await authService.resetPassword(email, otp, newPassword);
      if (response['status'] == 200 || response['status'] == 'success') {
        Get.snackbar(
            "Success", response['message'] ?? "Password reset successful",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
        Future.delayed(Duration(seconds: 2), () {
          Get.offAll(() => LoginScreen());
        });
      } else {
        Get.snackbar("Error", response['message'] ?? "Password reset failed",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    countdownTimer?.cancel();
    emailControllers.dispose();
    otpController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}

class UserConformationControler extends GetxController {
  late String email;
  CountdownController countdownController = CountdownController();
  TextEditingController textEditingController = TextEditingController();
  final AuthController authService = Get.find<AuthController>();
  TextEditingController emailotpcontroller = TextEditingController();
  var messageOtp = ''.obs;
  RxBool canResendOtp = false.obs;
  RxInt otpCountdown = 30.obs; // Countdown timer for OTP
  RxBool isLoading = false.obs;
  Timer? countdownTimer;
  // countdownOTP function
  void startOtpCountdown({int seconds = 30}) {
    otpCountdown.value = seconds; // Reset countdown to 60 seconds
    canResendOtp.value = false; // Disable resend button
    countdownTimer?.cancel(); // Cancel any existing timer
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (otpCountdown.value > 0) {
        otpCountdown.value--; // Decrement countdown
      } else {
        timer.cancel(); // Stop the timer when countdown reaches 0
        canResendOtp.value = true; // Enable resend button
      }
    });
  }

  // Resend OTP function
  Future<void> resendOtp({String type = "User_Confirmation"}) async {
    isLoading(true);
    try {
      final response = await authService.resendOtp(email);
      print("Resend OTP API response: $response");

      if (response['status'] == 'success') {
        Get.snackbar("Success", "OTP resent successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
        otpCountdown.value = 60; // Reset countdown to 60 seconds
        canResendOtp.value = false; // Disable resend button
        startOtpCountdown(); // Start countdown timer
      } else {
        Get.snackbar("Error", response['message'] ?? "Failed to resend OTP",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "An error occured: ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    } finally {
      isLoading(false);
    }
  }
  // Conform otp function

  void setEmail(String email) {
    this.email = email;
    print("Email set  in controller : $email");
  }

  Future<void> confirmOtp() async {
    final otp =
        //emailotpcontroller.text.isNotEmpty
        emailotpcontroller.text.trim();
    //  : phoneotpcontroller.text;

    if (otp.isEmpty) {
      Get.snackbar("Error", "Please enter OTP",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }

    isLoading.value = true;

    try {
      print("confirming Otp for : $email and OTP: $otp");
      final response = await authService.confirmOtp(email, otp);

      print("Conform Otp Api response: $response");

      final status = response['status']?.toString().toLowerCase() ?? "";
      final message = response['message']?.toString().toLowerCase() ?? "";

      if ((status == 'success' ||
              status == '200' ||
              status.contains(
                  '200')) /* &&
          (message.contains("otp") && message.contains("confirm")*/
          ) {
        print("if working");
        Get.offAll(() => MainScreen());
      } else {
        Get.snackbar("success", message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
        print("else working, $message");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occured: ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    email = (Get.arguments as Map<String, dynamic>?)?['email'] ?? '';
    print("Email received in controller: $email");
    startOtpCountdown(); // Start countdown timer when controller is initialized
  }

  @override
  void onClose() {
    super.onClose();
    countdownTimer?.cancel(); // Cancel the timer when the controller is closed
    emailotpcontroller.dispose();
  }
}

// i have to implemeny if user login sucessfully one time then user will be navigate to home screen

// profile controlller

class ProfileController extends GetxController {
  AuthController authController = AuthController();
  late SharedPreferences prefs;
  final ImagePicker _imagePicker = ImagePicker();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
  RxString userPhoneNumber = ''.obs;
  RxString userImage = ''.obs; // Google image URL or from backend
  RxString profilepicpath = ''.obs; // Local image path

  RxBool isGoogleUser = false.obs;
  RxBool isUploading = false.obs;

  late Dio _dio;

  @override
  void onReady() {
    super.onReady();
    _initPrefs().then((_) => _initializedController());
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> _initializedController() async {
    prefs = await SharedPreferences.getInstance();
    _dio = Dio(
      BaseOptions(
        baseUrl:
            'https://yourbackend.api', // <-- replace with your backend base URL
        connectTimeout: const Duration(
            seconds: 5), // <-- replace with your backend base URL5000,
        receiveTimeout: const Duration(
            seconds: 5), // <-- replace with your backend base URL5000,

        headers: {'Authorization': 'Bearer ${prefs.getString('token')}'},
      ),
    );

    await _loadStoredProfileData();
  }

  /// Load saved profile data from local storage
  Future<void> _loadStoredProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    profilepicpath.value = prefs.getString('profilepicpath') ?? '';
    isGoogleUser.value = prefs.getBool('isGoogleUser') ?? false;
    userEmail.value = prefs.getString('userEmail') ?? '';
    userName.value = prefs.getString('userName') ?? '';
    userPhoneNumber.value = prefs.getString('userPhoneNumber') ?? '';
    userImage.value = prefs.getString('userImage') ?? '';

    if (isGoogleUser.value) {
      final GoogleSignInAccount? googleUser =
          await _googleSignIn.signInSilently();
      if (googleUser != null) {
        await authController.fetchGoogleProfile(googleUser);
      }
    } else {
      await _fetchUserProfileFromBackend(); // Fetch from backend for manual users
    }
  }

  /// Fetch user profile from backend for manual users
  Future<void> _fetchUserProfileFromBackend() async {
    if (userEmail.value.isEmpty) {
      // No user email stored, fallback
      _loadManualUserProfileFromPrefs();
      return;
    }

    try {
      final response = await _dio.get('/api/profile/${userEmail.value}');
      if (response.statusCode == 200) {
        final data = response.data;
        userName.value = data['name'] ?? 'Manual User';
        userPhoneNumber.value = data['phoneNumber'] ?? 'N/A';
        userImage.value = data['profileImageUrl'] ?? '';
        profilepicpath.value =
            ''; // clear local image because backend has image url
        // Save to prefs for offline cache
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userName', userName.value);
        await prefs.setString('userEmail', userEmail.value);
        await prefs.setString('userPhone', userPhoneNumber.value);
        await prefs.setString('profilepicpath', '');
      } else {
        _loadManualUserProfileFromPrefs();
      }
    } catch (e) {
      print("Error fetching user profile from backend: $e");
      _loadManualUserProfileFromPrefs();
    }
  }

  /// Load manual profile data from SharedPreferences as fallback
  void _loadManualUserProfileFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    userName.value = prefs.getString('userName') ?? 'Manual User';
    userEmail.value = prefs.getString('userEmail') ?? 'manual@vikrayon.com';
    userPhoneNumber.value = prefs.getString('userPhone') ?? 'N/A';
  }

  /// Pick image from camera or gallery
  Future<void> pickImage(ImageSource source) async {
    final pickedFile =
        await _imagePicker.pickImage(source: source, imageQuality: 80);
    if (pickedFile != null) {
      isUploading.value = true;
      try {
        final imageUrl =
            await _uploadProfileImageToBackend(File(pickedFile.path));
        if (imageUrl.isNotEmpty) {
          await _updateUserProfileOnBackend(imageUrl);
          userImage.value = imageUrl; // update with backend image url
          profilepicpath.value =
              ''; // clear local path since backend image is used

          // Save updated info locally
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('profilepicpath', '');
          await prefs.setString('userImage', imageUrl);
        }
      } catch (e) {
        Get.snackbar('Upload Failed', 'Could not upload profile image: $e',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color(0xff5ce1e6));
      } finally {
        isUploading.value = false;
        Get.back();
      }
    }
  }

  /// Upload profile image file to backend, returns URL string
  Future<String> _uploadProfileImageToBackend(File file) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last),
    });
    final response = await _dio
        .post('/api/profile/upload-image/${userEmail.value}', data: formData);
    if (response.statusCode == 200) {
      return response.data.toString();
    } else {
      throw Exception('Failed to upload image');
    }
  }

  /// Update user's profile image URL on backend
  Future<void> _updateUserProfileOnBackend(String imageUrl) async {
    final response = await _dio.put('/api/profile/${userEmail.value}', data: {
      "name": userName.value,
      "profileImageUrl": imageUrl,
    });
    if (response.statusCode != 200) {
      throw Exception('Failed to update profile on backend');
    }
  }

  // /// Fetch profile data for Google sign-in
  // Future<void> _fetchGoogleProfile(GoogleSignInAccount googleUser) async {
  //   final prefs = await SharedPreferences.getInstance();

  //   try {
  //     final bool isGoogleUser = prefs.getBool('isGoogleUser') ?? false;

  //     if (!isGoogleUser) return;

  //     final GoogleSignInAccount? googleUser =
  //         await _googleSignIn.signInSilently();

  //     if (googleUser == null) {
  //       await prefs.clear();
  //       Get.off(() => LoginScreen());
  //       Get.snackbar("Error", "Google Sign-In failed!",
  //           snackPosition: SnackPosition.BOTTOM);
  //       return;
  //     }

  //     userName.value = googleUser.displayName ?? 'Google User';
  //     userEmail.value = googleUser.email;
  //     userPhoneNumber.value = '';
  //     userImage.value = googleUser.photoUrl ?? '';
  //     profilepicpath.value = '';

  //     // Save Google user info locally
  //     await prefs.setString('userName', userName.value);
  //     await prefs.setString('userEmail', userEmail.value);
  //     await prefs.setBool('isGoogleUser', true);
  //     await prefs.setString('userImage', userImage.value);
  //   } catch (e) {
  //     await prefs.clear();
  //     Get.snackbar("Error", "Google profile fetch failed: $e",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: const Color(0xff5ce1e6));
  //     Get.off(() => LoginScreen());
  //   }
  // }

  /// Logout and clear all data
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    if (isGoogleUser.value) {
      try {
        await _googleSignIn.signOut();
      } catch (e) {
        Get.snackbar('Error', 'Google sign-out failed: $e',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color(0xff5ce1e6));
      }
    }

    await prefs.clear();

    userName.value = '';
    userEmail.value = '';
    userPhoneNumber.value = '';
    userImage.value = '';
    profilepicpath.value = '';
    isGoogleUser.value = false;

    Get.offAll(() => LoginScreen());
  }
}

class AuthService extends GetxController {
  final SplashController splashControler = Get.put(SplashController());
  final LoginControler loginControler = Get.put(LoginControler());
  final SignupControler signupControler = Get.put(SignupControler());
  final UserConformationControler userConformationControler =
      Get.put(UserConformationControler());
  final ProfileController profileControler = Get.put(ProfileController());
}
