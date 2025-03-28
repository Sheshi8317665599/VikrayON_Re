import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikrayon/main_screen.dart';
import 'package:vikrayon/views/auth/login_screen.dart';
import 'package:vikrayon/views/auth/user_conformation_screen.dart';
import 'package:vikrayon/views/home/home_screen/home_screen.dart';

class AuthController {
  final String baseUrl;

  AuthController(this.baseUrl);
  // google signin function

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
  RxString userphonenumber = ''.obs;
  RxString userImage = ''.obs;

  // normal signin function

  Future<void> loginuser(String name, String userid, String phonenumber) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setString('userEmail', userid);
    await prefs.setString('userImage', '');
    await prefs.setString('userphonenumber', phonenumber);
    await prefs.setBool('isLoggedIn', true);

    userName.value = name;
    userEmail.value = userid;
    userImage.value = '';
    userphonenumber.value = phonenumber;

    Get.offAllNamed('/home');
  }
  // Google Sign In

  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userNmae', googleUser.displayName ?? '');
        await prefs.setString('userEmail', googleUser.email);
        await prefs.setString('userphonenumber', '');
        await prefs.setString('userImage', googleUser.photoUrl ?? '');
        await prefs.setBool('isLoggedIn', true);

        // update RX variables
        userName.value = googleUser.displayName ?? '';
        userEmail.value = googleUser.email;
        userphonenumber.value = '';
        userImage.value = googleUser.photoUrl ?? '';

        Get.off(() => HomeScreen());
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

    Future.delayed(Duration.zero, () => Get.off(() => LoginScreen()));
  }
  // Login function

  Future<Map<String, dynamic>> login(String userid, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'userid': userid, 'password': password}),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {"message": "Login failed!"};
      }
    } catch (e) {
      return {"message": "Error:${e.toString()}"};
    }
  }

  // signup function

  Future<Map<String, dynamic>> signup(String name, String userid,
      String password, String confirmpassword, int phonenumber) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/signup'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'userid': userid,
          'password': password,
          'confirmpassword': confirmpassword,
          'phonenumber': phonenumber
        }),
      );

      if (response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        return {"message": "Signup failed!"};
      }
    } catch (e) {
      return {"message": "Error:${e.toString()}"};
    }
  }

  // Confirm Otp Function

  Future<Map<String, dynamic>> confirmOtp(
      String emailorPhone, String otp) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/confirmotp'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'emailorPhone': emailorPhone, 'otp': otp}),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {"message": "Invalid OTP!"};
      }
    } catch (e) {
      return {"message": "Error:${e.toString()}"};
    }
  }

  // Resend Otp Function

  Future<Map<String, dynamic>> resendOtp(String emailorPhone) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/resendotp'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'emailorPhone': emailorPhone}),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {"message": "Invalid OTP!"};
      }
    } catch (e) {
      return {"message": "Error:${e.toString()}"};
    }
  }

  // fetch user profile from api
  Future<Map<String, dynamic>> getUserProfile() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/profile'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {"message": "Failed to fetch user profile!"};
      }
    } catch (e) {
      return {"message": "Error:${e.toString()}"};
    }
  }
}

class LoginControler extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  var useridController = ''.obs;
  var passswordController = ''.obs;
  var isPasswordVisible = false.obs;
  var isLoginEnable = false.obs;

  final AuthController authService = AuthController('http://192.168.1.69:8000');

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    String userid = useridController.value;
    String password = passswordController.value;

    if (userid.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please enter both email and pasword",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }

    try {
      final response = await authService.login(userid, password);

      if (response['message'] == "login sucessful") {
        Get.to(() => MainScreen());
      } else {
        Get.snackbar("Error", "An error occured: ${e.toString()}",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "An error occured: ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    }
  }
}

class SignupControler extends GetxController {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController useridcontroller = TextEditingController();
  TextEditingController passswordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  var nameController = ''.obs;
  var useridController = ''.obs;
  var passswordController = ''.obs;
  var confirmpasswordController = ''.obs;
  var phonenumberController = ''.obs;
  var isPasswordVisible = false.obs;
  var isLoginEnable = false.obs;

  final AuthController authService = AuthController('http://192.168.1.69:8000');

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> signup() async {
    String name = nameController.value;
    String userid = useridController.value;
    String password = passswordController.value;
    String confirmpassword = confirmpasswordController.value;
    String phonenumber = phonenumberController.value;

    if (name.isEmpty ||
        userid.isEmpty ||
        password.isEmpty ||
        confirmpassword.isEmpty ||
        phonenumberController.isEmpty) {
      Get.snackbar("Error", "All fields are required",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }

    if (password != confirmpassword) {
      Get.snackbar("Error", "Passwords do not match",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }
    try {
      final response = await authService.signup(
          name, userid, password, confirmpassword, phonenumber as int);

      if (response['message'] == "signup sucessful") {
        Get.to(() => UserConformationScreen());
      } else {
        Get.snackbar("Error", response['message'],
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
      }
    } catch (e) {
      Get.snackbar("Error", "An error occured: ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
    }
  }
}

class UserConformationControler extends GetxController {
  TextEditingController emailotpcontroller = TextEditingController();
  TextEditingController phoneotpcontroller = TextEditingController();
  var emailotp = ''.obs;
  var phoneoto = ''.obs;
  var isLoginEnable = false.obs;
  var isLoading = false.obs;

  final AuthController authService = AuthController('http://192.168.1.69:8000');

  // Conform otp function

  Future<void> confirmOtp() async {
    String identifier = emailotpcontroller.text.isNotEmpty
        ? emailotpcontroller.text
        : phoneotpcontroller.text;
    String otp = emailotpcontroller.text.isNotEmpty
        ? emailotpcontroller.text
        : phoneotpcontroller.text;

    if (identifier.isEmpty || otp.isEmpty) {
      Get.snackbar("Error", "Please enter otp",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff5ce1e6));
      return;
    }

    isLoading.value = true;

    try {
      final response = await authService.confirmOtp(identifier, otp);

      if (response['message'] == "otp confirmed") {
        Get.to(() => MainScreen ());
      } else {
        Get.snackbar("Error", response['message'] ?? "Invalid OTP!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xff5ce1e6));
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
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userphonenumber = ''.obs;
  var userImage = ''.obs;
  var profilepicpath = ''.obs;

  final ImagePicker _imagePicker = ImagePicker();

  final AuthController authService = AuthController('http://192.168.1.69:8000');

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
