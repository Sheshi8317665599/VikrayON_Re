import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart' hide FormData, MultipartFile, Response;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:vikrayon/api/api_client.dart';
import 'package:vikrayon/main_screen.dart';
import 'package:vikrayon/splash_screens/Main_splashscreen.dart';
import 'package:vikrayon/views/auth/login_screen.dart';
import 'package:vikrayon/views/auth/user_conformation_screen.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;

  // final Dio dio = Dio(BaseOptions(
  //   baseUrl: 'https://3185-43-230-212-140.ngrok-free.app/auth',
  //   connectTimeout: const Duration(seconds: 5),
  //   receiveTimeout: const Duration(seconds: 5),
  //   contentType: 'application/json',
  //   responseType: ResponseType.json,
  // ));

  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isUserCreated = prefs.getBool('isUserCreated') ?? false;
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final email = prefs.getString('userEmail') ?? '';
    final token = prefs.getString('token') ?? '';
    if (isUserCreated && isLoggedIn && email.isNotEmpty && token.isNotEmpty) {
      saveLoginSession(email, token);
    }
  }

  Future<void> saveSignupSession(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isUserCreated', true);
    await prefs.setString('userEmail', email);
    isLoggedIn.value = false;
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
    try {
      final isUserCreated = prefs.getBool('isUserCreated') ?? false;
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      final email = prefs.getString('userEmail') ?? '';
      final token = prefs.getString('token') ?? '';

      if (!isUserCreated) return 'login';
      if (isLoggedIn && email.isNotEmpty && token.isNotEmpty) {
        return 'main';
      }
      return 'login';
    } catch (e) {
      print("Error in getIntialRoute: $e");
      return 'login';
    }
  }

  // google signin function
  RxString userName = ''.obs;
  RxString userPassword = ''.obs;
  RxString userEmail = ''.obs;
  RxString userphonenumber = ''.obs;
  RxString userImage = ''.obs;
  RxBool isGoogleUser = false.obs;
  RxString profilepicpath = ''.obs;
  RxString userDob = ''.obs;

  RxString userGender = ''.obs;

  RxString userArea = ''.obs;
  RxString userCity = ''.obs;
  RxString userState = ''.obs;
  RxString userCountry = ''.obs;
  RxString userPincode = ''.obs;

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
  }
  // Google Sign In

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes:
     [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
  );
  Future<void> googleSignIn() async{
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        Get.snackbar("Error", "Google Sign-In failed!",
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      // final photoUrl = googleUser.photoUrl ?? '';
      // final GoogleSignInAuthentication googleAuth =
      //     await googleUser.authentication;

      // final String? idToken = googleAuth.idToken;

      // if (idToken == null) {
      //   Get.snackbar("Error", "Google Sign-In failed!",
      //       snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      //   return;
      // }

      // final response = await ApiClient.post(
      //     'googleSignIn', {'idToken': idToken, 'type': 'google'});

      // if (response.statusCode == 200) {
      //   final data = response.data;
      //   final String jwtToken = data['jwtToken'];
      //   await ApiClient.updateToken(jwtToken);
      // }

      await fetchGoogleProfile(googleUser);
      Get.to(() => MainScreen());
    } catch (error) {
      Get.snackbar("Error", "Google Sign-In failed!",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
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
      //   Get.to(() => LoginScreen());
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
      Get.to(() => LoginScreen());
      Get.snackbar("Error", "Google profile fetch failed: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xff5ce1e6));
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

    Get.to(() => LoginScreen());
  }
  // Login function

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await ApiClient.post(
        'login',
        {'email': email, 'password': password},
      );

      final data = response.data;
      if (data['jwtToken'] != null) {
        await ApiClient.updateToken(data['jwtToken']);
      }
      return data;
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
      final response = await ApiClient.post(
        'register',
        {
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'phoneNumber': phoneNumber,
          'role': 'user'
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
      final response = await ApiClient.post(
        'confirmOtp',
        {'email': email, 'otp': otp},
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
      final response = await ApiClient.post(
        'resendOtp',
        {'email': email, 'type': type},
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
      final response = await ApiClient.post(
        'resetPassword',
        {'email': email, 'otp': otp, 'newPassword': newPassword},
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
      final response = await ApiClient.get(
        'getUserProfile',
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

// hide email

String hideEmail(String email) {
  // Hide the first part of the email
  int atIndex = email.indexOf('@');
  if (atIndex > 2) {
    return '*' * (atIndex + 2) + email.substring(atIndex - 2);
  }
  return email; // Return as is if not enough characters
}

// Login Controller
class LoginControler extends GetxController {
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

  Future<bool> login() async {
    String email = emailController.value.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please enter both email and pasword",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return false;
    }
    isLoading(true);
    try {
      // print(
      //     'Api URL: ${ApiClient.baseUrl + (ApiClient.endpoints['login'] ?? 'No_Endpoint')}');
      final response = await ApiClient.post(
        'login',
        {'email': email, 'password': password},
        //   options: Options(
        //     sendTimeout: Duration(seconds: 5),
        //     receiveTimeout: Duration(seconds: 5),
        //   ),
        // )
        // .timeout(const Duration(seconds: 5);
      );

      final data = response.data;
      print(data);
      if (data.containsKey('jwtToken')) {
        await ApiClient.updateToken(data['jwtToken']);
        return true;
      } else {
        Get.snackbar("Login Falied", data['message'] ?? "Login failed!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
        return false;
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "An error occured",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return false;
    } finally {
      isLoading(false);
    }
  }

  Future<void> sendResentOtp({bool IsForgot_Password = false}) async {
    String email = forgotEmailController.value.text.trim();
    if (email.isEmpty) {
      Get.snackbar("Error", "Please enter your email",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }
    isLoading(true);
    try {
      final response = await ApiClient.post(
        'resendOtp',
        {
          'email': email,
          'type': IsForgot_Password ? 'forgot_password' : 'user_confirmation'
        },
        //   options: Options(
        //     sendTimeout: Duration(seconds: 5),
        //     receiveTimeout: Duration(seconds: 5),
        //   ),
        // )
        // .timeout(const Duration(seconds: 5)
      );
      final data = response.data;
      if (data['status'] == 200) {
        Get.snackbar("Success", data['message'] ?? "OTP resent successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      } else {
        Get.snackbar("Error", data['message'] ?? "Failed to resend OTP",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "Server issue",
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
      final response = await ApiClient.post('resetPasswordUrl',
          {'email': email, 'otp': otp, 'password': newPassword});
      final data = response.data;
      if (data['status'] == 200) {
        Get.snackbar("Success", data['message'] ?? "Unknown error",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      } else {
        Get.snackbar("Error", data['message'] ?? "Unknown error",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "Server issue",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    } finally {
      isLoading(false);
    }
  }
}

class SignupControler extends GetxController {
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
    print("signup method called");
    isLoading(true);

    final name = namecontroller.text.trim();
    final email = emailcontroller.text.trim();
    final password = passswordcontroller.text.trim();
    final confirmPassword = confirmpasswordcontroller.text.trim();
    final phoneNumber = phonenumbercontroller.text.trim();
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        phoneNumber.isEmpty) {
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

      final response = await ApiClient.post('register', {
        'name': name,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'phoneNumber': phonenumber,
        'role': 'user',
      }); //authService.signup(

      final data = response.data;
      print(response.statusCode);
      if (response.statusCode == 200) {
        //response.containsKey('jwtToken')) {
        print("it's working");
        Get.to(() => UserConformationScreen(), arguments: {'email': email});
        Get.snackbar("Success", data['message'] ?? "Unknown error",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
        isLoading(true);
        return;
      } else {
        Get.snackbar("Error", data['message'] ?? "Signup failed!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "Server issue",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    } finally {
      isLoading(false);
    }
  }
}

class ForgotPasswordController extends GetxController {
  TextEditingController emailControllers = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isNewPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;

  RxBool canResendOtp = false.obs;
  RxInt otpCountdown = 30.obs;
  Timer? countdownTimer;

  void clearAllFeilds() {
    emailControllers.clear();
    otpController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  void startOtpCountdown({int seconds = 30}) {
    otpCountdown.value = seconds; // Reset countdown to 60 seconds
    canResendOtp.value = false; // Disable resend button
    countdownTimer?.cancel(); // Cancel any existing timer
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (otpCountdown.value > 0) {
        otpCountdown.value--; // Decrement countdown
      } else {
        timer.cancel(); // Stop the timer when countdown reaches 0
        canResendOtp.value = true; // Enable resend buttonl
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
      final response = await ApiClient.post(
          'forgotPassword', {'email': email, 'type': 'forgot_password'});
      final data = response.data;
      if (data['status'] == 200 || data['status'] == 'success') {
        Get.snackbar("Success", data['message'] ?? "OTP sent to email",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
        startOtpCountdown();
        clearAllFeilds();
        Get.to(() => OtpScreen(), arguments: {'email': email});
      } else {
        Get.snackbar("Error", data['message'] ?? "Failed to send OTP",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "Server issue",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    } finally {
      isLoading.value = false;
    }
    //  Get.to(() => OtpScreen(), arguments: {'email': email});
  }

  Future<void> resendForgotOtp() async {
    final email = Get.arguments['email'];
    if (email.isEmpty) {
      Get.snackbar("Error", "Email is empty",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }

    isLoading.value = true;
    try {
      final response = await ApiClient.post(
          'resendOtp', {'email': email, 'type': 'forgot_password'});
      final data = response.data;
      if (data['status'] == 200 || data['status'] == 'success') {
        Get.snackbar("Success", "OTP resent successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
        startOtpCountdown();
      } else {
        Get.snackbar("Error", data['message'] ?? "Failed to resend OTP",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "Server issue",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetPassword() async {
    final email = emailControllers.text.trim();
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
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
      final response = await ApiClient.post('resetPassword', {
        'email': emailControllers.text,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword
      });
      final data = response.data;
      if (response.statusCode == 200 || data['status'] == 'success') {
        Get.snackbar("Success", data['message'] ?? "Password reset successful",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));

        await Future.delayed(
          Duration(seconds: 2),
        );
        Get.to(() => LoginScreen());
      } else {
        Get.snackbar("Error", data['message'] ?? "Password reset failed",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "Server issue",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOtp(String email) async {
    if (otpController.text.trim().length != 6) {
      Get.snackbar("Error", "Invalid OTP",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }
    isLoading.value = true;
    try {
      final response = await ApiClient.post(
          'verifyOtp', {'email': email, 'otp': otpController.text.trim()});
      final data = response.data;
      if (response.statusCode == 200 || data['status'] == 'success') {
        Get.snackbar("Success", data['message'] ?? "OTP verified successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));

        Get.to(() => ResetPassword(),
            arguments: {'email': email, 'otp': otpController.text.trim()});
      } else {
        Get.snackbar("Error", data['message'] ?? "Failed to verify OTP",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "Server issue",
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
  final CountdownController countdownController = CountdownController();
  final TextEditingController emailotpcontroller = TextEditingController();
  // RxString messageOtp = ''.obs;
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
        update();
      } else {
        timer.cancel(); // Stop the timer when countdown reaches 0
        canResendOtp.value = true; // Enable resend buttonl
        update();
      }
    });
  }

  // Resend OTP function
  Future<void> resendOtp({String type = "User_Confirmation"}) async {
    isLoading(true);
    try {
      final response = await ApiClient.post('resendOtp',
          {'email': email, 'type': type}); // Call the API to resendOtp(email);

      final data = response.data;

      if (data['status'] == 'success') {
        Get.snackbar("Success", "OTP resent successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
        otpCountdown.value = 60; // Reset countdown to 60 seconds
        canResendOtp.value = false; // Disable resend button
        startOtpCountdown(); // Start countdown timer
      } else {
        Get.snackbar("Error", data['message'] ?? "Failed to resend OTP",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "Server issue",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    } finally {
      isLoading(false);
    }
  }
  // Conform otp function

  // void setEmail(String email) {
  //   this.email = email;
  //   print("Email set  in controller : $email");
  // }

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
      final response = await ApiClient.post('confirmOtp', {
        'email': email,
        'otp': otp,
      });

      final data = response.data;

      final status = data['status']?.toString().toLowerCase() ?? "";
      final message = data['message']?.toString().toLowerCase() ?? "";

      if ((status == 'success' ||
              status == '200' ||
              status.contains(
                  '200')) /* &&
          (message.contains("otp") && message.contains("confirm")*/
          ) {
        print("if working");
        Get.to(() => LoginScreen());
      } else {
        Get.snackbar("success", message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
        print("else working, $message");
      }
      print("token: ${data['jwtToken']}");
    } catch (e) {
      Get.snackbar("Error", "Server issue",
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

  // @override
  // void onClose() {
  //   super.onClose();
  //   countdownTimer?.cancel(); // Cancel the timer when the controller is closed
  //   emailotpcontroller.dispose();
  // }
}

// i have to implemeny if user login sucessfully one time then user will be navigate to home screen

// profile controlller

// adjust path if needed

class ProfileController extends GetxController {
  final AuthController authController =
      Get.find<AuthController>(); // Get instance of AuthController>
//  final LocationController locationController = Get.put(LocationController());
  final ImagePicker _imagePicker = ImagePicker();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // user data observable
  final Rx<File?> _pickedImageFile = Rx<File?>(null);
  File? get pickedImageFile => _pickedImageFile.value;
  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
  RxString userPassword = ''.obs;
  RxString userPhoneNumber = ''.obs;
  RxString userDob = ''.obs;
  RxString userImage = ''.obs;
  RxString profilepicpath = ''.obs;
  RxString userGender = ''.obs;

  // State observalable
  RxBool isPasswordVisible = false.obs;
  RxBool hasLocalImage = false.obs;
  RxBool isGoogleUser = false.obs;
  RxBool isUploading = false.obs;
  RxBool isOtpSent = false.obs;
  RxInt otpCountdown = 0.obs;
  RxBool isOtpVerified =
      false.obs; // 0: not verified, 1: verified, 2: resend otp

  // add adress controller

  RxString userArea = ''.obs;
  RxString userCity = ''.obs;
  RxString userState = ''.obs;
  RxString userCountry = ''.obs;
  RxString userPincode = ''.obs;
  RxString userAddress = ''.obs;

// Form controller
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  //TextEditingController addressController = TextEditingController();

  Timer? otpCountdownTimer;
  @override
  void onInit() {
    super.onInit();
    initializedControllers();
    _loadUserdata();

    // ever(locationController.userArea,
    //     (value) => userArea.value = value.toString());
    // ever(locationController.userCity,
    //     (value) => userCity.value = value.toString());
    // ever(locationController.userState,
    //     (value) => userState.value = value.toString());
    // ever(locationController.userCountry,
    //     (value) => userCountry.value = value.toString());
    // ever(locationController.userPincode,
    //     (value) => userPincode.value = value.toString());
  }

  @override
  void onClose() {
    otpCountdownTimer?.cancel();
    disposeControllers();
    super.onClose();
  }

  void initializedControllers() {
    nameController = TextEditingController();
    // emailController = TextEditingController();
    //  passwordController = TextEditingController();
    // confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
    dobController = TextEditingController();
    // addressController = TextEditingController();
  }

  void disposeControllers() {
    nameController.dispose();
    //  emailController.dispose();
    //  passwordController.dispose();
    // confirmPasswordController.dispose();
    phoneController.dispose();
    dobController.dispose();
    //  addressController.dispose();
  }

  @override
  void onReady() {
    super.onReady();
    _initController();
  }

  Future<void> _initController() async {
    await _loadUserdata();
    await fetchUserProfile();
  }

  Future<void> checkLocalProfileImageExists() async {
    final path = profilepicpath.value;
    if (path.isNotEmpty) {
      final file = File(path);
      hasLocalImage.value = await file.exists();
    } else {
      hasLocalImage.value = false;
    }
  }

  Future<void> _loadUserdata() async {
    try {
      await authController.loadUserData();

      userName.value = authController.userName.value;
      userEmail.value = authController.userEmail.value;
      userPhoneNumber.value = authController.userphonenumber.value;
      userImage.value = authController.userImage.value;
      profilepicpath.value = authController.profilepicpath.value;
      isGoogleUser.value = authController.isGoogleUser.value;
      userDob.value = authController.userDob.value;

// load location data if avaliable

      // userArea.value = locationController.userArea.value;
      // userCity.value = locationController.userCity.value;
      // userState.value = locationController.userState.value;
      // userCountry.value = locationController.userCountry.value;
      // userPincode.value = locationController.userPincode.value;
      // userAddress.value = locationController.userFullAddress.value;

      nameController.text = userName.value;
      //  emailController.text = userEmail.value;
      phoneController.text = userPhoneNumber.value;
      dobController.text = userDob.value;
      await checkLocalProfileImageExists();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load user data: $e',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  Future<void> fetchUserProfile() async {
    if (isGoogleUser.value) {
      await fetchGoogleProfile();
    } else {
      await _fetchUserProfileFromBackend();
    }
  }

  Future<void> fetchGoogleProfile() async {
    try {
      final googleUser = await _googleSignIn.signInSilently();
      if (googleUser != null) {
        await authController.fetchGoogleProfile(googleUser);
        await _loadUserdata();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch Google profile: $e',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  Future<void> _fetchUserProfileFromBackend() async {
    try {
      final response = await ApiClient.get('getUserProfile');
      print(response);
      if (response.statusCode == 200) {
        final data = response.data;
        userName.value = data['name'] ?? userName.value;
        userEmail.value = data['email'] ?? userEmail.value;
        userPhoneNumber.value = data['phoneNumber'] ?? userPhoneNumber.value;
        userImage.value = data['profilePicture'] ?? userImage.value;
        print('userImage: $userImage.value');
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userName', userName.value);
        await prefs.setString('userEmail', userEmail.value);
        await prefs.setString('userPhoneNumber', userPhoneNumber.value);
        await prefs.setString('userImage', userImage.value);

        // update AuthController variables
        authController.userName.value = userName.value;
        authController.userEmail.value = userEmail.value;
        authController.userphonenumber.value = userPhoneNumber.value;
        authController.userImage.value = userImage.value;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch user profile: $e',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: source,
      );

      if (pickedFile != null) {
        isUploading.value = true;
        profilepicpath.value = pickedFile.path;
        await checkLocalProfileImageExists();
        final imageUrl = await _uploadProfileImage(File(pickedFile.path));
        if (imageUrl.isNotEmpty) {
          await _updateProfilewithImage(imageUrl);
          Get.back();
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    } finally {
      isUploading.value = false;
    }
  }

  Future<void> _updateProfilewithImage(String imageUrl) async {
    try {
      userImage.value = imageUrl;
      profilepicpath.value = '';

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userImage', imageUrl);
      await prefs.setString('profilepicpath', '');

      // update AuthController variables
      authController.userImage.value = imageUrl;
      authController.profilepicpath.value = '';
      update();

      Get.snackbar('Success', 'Profile updated successfully',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile: $e',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  Future<String> _uploadProfileImage(File imageFile) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path,
            filename: 'profile_${DateTime.now().microsecondsSinceEpoch}.jpg'),
      });

      final dio = await ApiClient.getDio();
      final response = await dio.put(
        ApiClient.endpoints['getUploadImage']!,
        data: formData,
      );
      if (response.statusCode == 200 && response.data['imageUrl'] != null) {
        return response.data['imageUrl'];
      }
      throw Exception('upload failed: ${response.statusCode}');
    } catch (e) {
      debugPrint('Image upload error: $e');
      Get.snackbar('Error', 'Failed to upload profile image: $e',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      rethrow;
    }
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: userDob.value.isNotEmpty
          ? DateTime.parse(userDob.value)
          : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      userDob.value = dobController.text;
    }
  }

  Future<void> updatedProfileInfo({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phonenumber,
    required String dob,
    required String profilepicpath,
    required String gender,
    // required String adress,
  }) async {
    try {
      final response = await ApiClient.get('getUserProfile', queryParams: {
        'name': name,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'phoneNumber': phonenumber,
        'dateOfBirth': dob,
        'profilePicture': profilepicpath,
        'gender': gender,
      });

      if (response.statusCode == 200) {
        userName.value = name;
        userEmail.value = email;
        userPassword.value = password;
        userPhoneNumber.value = phonenumber;
        userDob.value = dob;
        userImage.value = profilepicpath;

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userName', name);
        await prefs.setString('userEmail', email);
        await prefs.setString('userPassword', password);
        await prefs.setString('userPhoneNumber', phonenumber);
        await prefs.setString('userDob', dob);
        await prefs.setString('profilepicpath', profilepicpath);
        await prefs.setString('userImage', profilepicpath);

        // if (response.statusCode == 200) {
        //   locationController.userArea.value = userArea.value;
        //   locationController.userCity.value = userCity.value;
        //   locationController.userState.value = userState.value;
        //   locationController.userCountry.value = userCountry.value;
        //   locationController.userPincode.value = userPincode.value;
        //   //     locationController.userFullAddress.value = adress;
        // }

        Get.snackbar('Success', 'Profile updated successfully',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  void startOtpCountdown({int seconds = 30}) {
    otpCountdown.value = seconds;
    isOtpSent.value = false;
    otpCountdownTimer?.cancel();
    otpCountdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (otpCountdown.value > 0) {
        otpCountdown.value--;
      } else {
        timer.cancel();
        isOtpSent.value = true;
      }
    });
  }

  Future<void> updateEp() async {
    final uname = userName.value;
    final phoneNumber = userPhoneNumber.value;
    final dob = userDob.value;

    try {
      isUploading.value = true;
      final response = await ApiClient.put('editProfile', {
        "name": uname,
        "phoneNumber": phoneNumber,
        "dateOfBirth": dob,
      });
      print('Response status code : ${response.statusCode}');
      print('Response data : ${response.data}');
      print('uname : $uname');
      print('phoneNumber : $phoneNumber');
      print('dateOfBirth : $dob');
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Profile updated successfully',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    } finally {
      isUploading.value = false;
    }
  }

  Future<void> verifyOtpAndUpdateProfile() async {
    if (otpCountdown.value == 0 && isOtpSent.value) {
      isUploading.value = true;
      try {
        final otpResponse = await ApiClient.put('/auth/confirm-otp', {
          "otp": isOtpSent.value,
        });
        if (otpResponse.statusCode == 200) {
          final response = await ApiClient.put('/auth/edit-profile', {
            "name": userImage.value,
            "phoneNumber": userPhoneNumber.value,
            "dateOfBirth": userDob.value,
            "email": userEmail.value,
            "profileImage": userImage.value,
            "password": userPassword.value,
          });
          if (response.statusCode == 200) {
            authController.userName.value = userName.value;
            authController.userEmail.value = userEmail.value;
            authController.userphonenumber.value = userPhoneNumber.value;
            authController.userImage.value = userImage.value;
            Get.snackbar("Success", "Profile updated successfully",
                backgroundColor: Colors.green, colorText: Colors.white);
          } else {
            Get.snackbar("Error", "Failed to update profile",
                backgroundColor: Colors.red, colorText: Colors.white);
          }
        } else {
          Get.snackbar("Error", "Invalid OTP",
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      } catch (e) {
        Get.snackbar("Error", "Failed to update profile $e",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }

  void _clearLocalData() {
    userName.value = '';
    userEmail.value = '';
    userPassword.value = '';
    userPhoneNumber.value = '';
    userDob.value = '';
    userImage.value = '';
    profilepicpath.value = '';
    isGoogleUser.value = false;
  }

  String getFormattedDob() {
    if (userDob.value.isNotEmpty) return 'Not Set';
    try {
      final date = DateTime.parse(userDob.value);
      return DateFormat('MMMM d, yyyy').format(date);
    } catch (e) {
      return userDob.value;
    }
  }

  Future<void> logout() async {
    try {
      if (isGoogleUser.value) {
        await authController.googleSignOut();
      } else {
        await authController.logout();
      }

      _clearLocalData();
      Get.to(() => LoginScreen());
    } catch (e) {
      Get.snackbar('Error', 'Failed to logout',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }
}

class AuthService extends GetxController {
  final SplashController splashControler = Get.put(SplashController());
  final LoginControler loginControler = Get.put(LoginControler());
  final SignupControler signupControler = Get.put(SignupControler());
  final UserConformationControler userConformationControler =
      Get.put(UserConformationControler());
  final ProfileController profileControler = Get.put(ProfileController());
  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());
}
