import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikrayon/main_screen.dart';
import 'package:vikrayon/views/auth/login_screen.dart';
import 'package:vikrayon/views/auth/user_conformation_screen.dart';

class AuthController {
  final String baseUrl;
  final Dio dio;

  AuthController(
    this.baseUrl,
  ) : dio = Dio(BaseOptions(baseUrl: baseUrl));

  // google signin function

  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
  RxString userphonenumber = ''.obs;
  RxString userImage = ''.obs;

  // normal signin function

  Future<void> loginuser(String name, String email, String phonenumber) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setString('userEmail', email);
    await prefs.setString('userImage', '');
    await prefs.setString('userphonenumber', phonenumber);
    await prefs.setBool('isLoggedIn', true);

    userName.value = name;
    userEmail.value = email;
    userImage.value = '';
    userphonenumber.value = phonenumber;

    Get.offAllNamed('/home');
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

      if (googleUser != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userNmae', googleUser.displayName ?? '');
        await prefs.setString('userEmail', googleUser.email);
        await prefs.setString('userphonenumber', '');
        String? photoUrl = googleUser.photoUrl;
        if (photoUrl != null) {
          await prefs.setString('userImage', photoUrl);
        } else {
          await prefs.setString('userImage', '');
        }
        await prefs.setBool('isLoggedIn', true);

        // update RX variables
        userName.value = googleUser.displayName ?? '';
        userEmail.value = googleUser.email;
        userphonenumber.value = '';
        if (photoUrl != null) {
          userImage.value = photoUrl;
        } else {
          userImage.value = '';
        }
        userphonenumber.value = '';

        Get.off(() => MainScreen());
      }
    } catch (error) {
      Get.snackbar("Error", "Google Sign-In failed!",
          snackPosition: SnackPosition.BOTTOM);
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
    await prefs.clear();

    userName.value = '';
    userEmail.value = '';
    userphonenumber.value = '';
    userImage.value = '';

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
        return {"message": response.data, "status": "sucess"};
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

  Future<Map<String, dynamic>> resendOtp(String emailorPhone) async {
    try {
      final response = await dio.post(
        '/resendotp',
        data: {'emailorPhone': emailorPhone},
      );
      return response.data;
    } on DioException catch (e) {
      return {
        "message": e.response?.data['message'] ?? "Resend OTP failed!",
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

  // var emailController = ''.obs;
  // var passswordController = ''.obs;
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
}

class SignupControler extends GetxController {
  final AuthController authService = Get.find<AuthController>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passswordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  // RxString nameController = ''.obs;
  // RxString emailController = ''.obs;
  // RxString passswordController = ''.obs;
  // RxString confirmpasswordController = ''.obs;
  // RxString phonenumberController = ''.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> signup() async {
    isLoading(true);
    // String name = nameController.value;
    // String email = emailController.value;
    // String password = passswordController.value;
    // String confirmpassword = confirmpasswordController.value;
    // String phonenumber = phonenumberController.value;

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

      if (response['status'] == 'sucess') {
        final email = emailcontroller.text.trim();
        //response.containsKey('jwtToken')) {

        final userConformationControler = Get.put(UserConformationControler());
        userConformationControler.setEmail(email);
        Get.offAll(() => UserConformationScreen());
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

class UserConformationControler extends GetxController {
  final AuthController authService = Get.find<AuthController>();
  TextEditingController emailotpcontroller = TextEditingController();

  RxBool isLoading = false.obs;
  String email = '';
  // Conform otp function

  void setEmail(String email) {
    this.email = email;
    print("Email set  in controller : $email");
  }

  Future<void> confirmOtp() async {
    String otp =
        //emailotpcontroller.text.isNotEmpty
        emailotpcontroller.text.trim();
    //  : phoneotpcontroller.text;

    if (otp.isEmpty) {
      Get.snackbar("Error", "Please enter OTP",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }

    // if (email.isEmpty) {
    //  // print("Email is empty in confirmOtp!");
    //   Get.snackbar("Error", "Email is empty in confirmOtp!",
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Color(0xff5ce1e6));
    //   return;
    // }
    isLoading.value = true;

    try {
      print("confirming Otp for : $email and OTP: $otp");
      final response = await authService.confirmOtp(email, otp);

      print("Conform Otp Api response: $response");

      final status = response['status']?.toString().toLowerCase() ?? "";
      final message = response['message']?.toString().toLowerCase() ?? "";

      if ((status == 'success' || status == '200' || status.contains('200'))/* &&
          (message.contains("otp") && message.contains("confirm")*/) {
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
}

// i have to implemeny if user login sucessfully one time then user will be navigate to home screen

// profile controlller

class ProfileControler extends GetxController {
  final AuthController authService = Get.find<AuthController>();
  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
  RxString userphonenumber = ''.obs;
  RxString userImage = ''.obs;
  RxString profilepicpath = ''.obs;

  final ImagePicker _imagePicker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    loadProfileImage();
    getUserProfile();
  }

  // set and save profile image path locally
  void setProfileImagePath(String path) async {
    profilepicpath.value = path;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profilepicpath', path);
  }

  // load saved profile image
  Future<void> loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    profilepicpath.value = prefs.getString('profilepicpath') ?? '';
  }

  // pick and update image
  Future<void> pickImage(ImageSource source) async {
    final pickedImage =
        await _imagePicker.pickImage(source: source, imageQuality: 100);
    if (pickedImage != null) {
      setProfileImagePath(pickedImage.path);
      Get.back();
    }
  }

  // fetch user profile from api

  Future<void> getUserProfile() async {
    try {
      final response = await authService.getUserProfile();
      userName.value = response['name'];
      userEmail.value = response['email'];
      userphonenumber.value = response['phonenummber'];
      userImage.value = response['image'];

      // if userImage is avaliable, store it as profilepicpath
      if (userImage.value.isNotEmpty) {
        setProfileImagePath(userImage.value);
      }
    } catch (e) {
      Get.snackbar("Error", "An error occured: ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    }
  }
}

class AuthService extends GetxController {

  final LoginControler loginControler = Get.put(LoginControler());
  final SignupControler signupControler = Get.put(SignupControler());
  final UserConformationControler userConformationControler =
      Get.put(UserConformationControler());
  final ProfileControler profileControler = Get.put(ProfileControler());
}
