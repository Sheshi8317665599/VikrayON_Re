// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:vikrayon/views/auth/login_screen.dart';

// class ApiClient {
//   static Dio? _dio;
//   static const String baseUrl = 'https://a0f0-43-230-212-128.ngrok-free.app/';

//   // Auth endpoints
//   static const String loginUrl = 'auth/login';
//   static const String registerUrl = 'auth/register';
//   static const confirmOtpUrl = 'auth/confirm-otp';
//   static const String resendOtpUrl = 'auth/resend-otp';
//   static const String forgotPasswordUrl = 'auth/forgot-password';
//   static const String resetPasswordUrl = 'auth/reset-password';
//   static const String googleSignInUrl = 'auth/google-signin';
//   static const String getUserProfileUrl = 'auth/profile';
//   static const String getUploadImageUrl = 'auth/upload-profile-image';
//   // sector , category , subcategory, teardrop , pvb, vb in sub category :vb , rvb  endpoints
//   static const String getsectorsUrl = 'sectors';
//   static const String getCategoriesUrl = 'categories';
//   static const String getSubCategoriesUrl = 'subcategories';
//   static const String getTearDropUrl = 'teardrop';
//   static const String getpvbUrl = 'pvb';
//   static const String getvbUrl = 'vb';
//   static const String getrvbUrl = 'rvb';

//   // Product endpoints
//   static const String getProductsUrl = 'products/living_generals';

//   static Future<Dio> getDio() async {
//     if (_dio != null) return _dio!;

//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token') ?? '';
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: baseUrl,
//         connectTimeout: const Duration(seconds: 5),
//         receiveTimeout: const Duration(seconds: 5),
//         contentType: 'application/json',
//         responseType: ResponseType.json,
//         headers: token.isNotEmpty ? {'Authorization': 'Bearer $token'} : {},
//       ),
//     );
//     _dio?.interceptors.add(InterceptorsWrapper(onError: (error, handler) async {
//       if (error.response?.statusCode == 401) {
//         await clearToken();
//         Get.to(() => LoginScreen());
//       } else {
//         final errorMessage = error.response?.data['message'] ??
//             error.message ??
//             'an error occurred';
//         Get.snackbar("Error", errorMessage,
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Color(0xff5ce1e6));
//       }
//       handler.next(error);
//     }));
//     return _dio!;
//   }

//   static Future<void> updateToken(String newToken) async {
//     _dio?.options.headers['Authorization'] = 'Bearer $newToken';
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('token', newToken);
//   }

//   static Future<void> clearToken() async {
//     _dio?.options.headers['Authorization'] = null;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token');
//   }
// }

import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikrayon/views/auth/login_screen.dart';

class ApiClient {
  static Dio? dio;
  static const String baseUrl = 'https://870a-43-230-212-240.ngrok-free.app';

  // api routes map for dynamic usage
  static const Map<String, String> endpoints = {
    'login': '/auth/login',
    'register': '/auth/register',
    'confirmOtp': '/auth/confirm-otp',
    'resendOtp': '/auth/resend-otp',
    'forgotPassword': '/auth/forgot-password',
    'verifyOtp': '/auth/verify-otp',
    'resetPassword': '/auth/reset-password',
    'googleSignIn': '/auth/google-signin',

    'getUserProfile': '/auth/profile',
    'getUploadImage': '/auth/upload-profile-image',
    'editProfile': '/auth/edit-profile',

    // email Change
    'initiateEmailChange': '/auth/epchange-email/initiate',
    'confirmEmailChange': '/auth/epchange-email/confirm',
    // password change
    'initiatePasswordChange': '/auth/epchange-password/initiate',
    'verifyOtpPasswordChange': '/auth/epchange-password/verify-otp',
    // Adress
    'updatedWorkAdress': '/auth/update-work-address',
    'updateOPtionalAdress': '/auth/update-optional-address',
    'getsectorsUrl': '/sectors/',
    'getCategoriesUrl': '/categories/',
    'getSubCategoriesUrl': '/subcategories/ ',
    'getTearDropUrl': '/teardrop/',
    'getpvbUrl': '/pvb/carousel/',
    'getvbUrl': '/vb/',
    'getrvbUrl': '/rvb/',
    'getProductsUrl': '/Products',
  };

  static Future<Dio> getDio() async {
    if (dio != null) return dio!;
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    print(token);
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      contentType: 'application/json',
      responseType: ResponseType.json,
      validateStatus: (status) => status != null && status < 500,
      headers: token != null && token.isNotEmpty
          ? {'Authorization': 'Bearer $token'}
          : {},

      // headers: token!.isNotEmpty ? {'Authorization': 'Bearer $token'} : {},
    ));
    dio!.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            await clearToken();
            Get.to(() => const LoginScreen());
          } else {
            final errorMessage = error.response?.data['message'] ??
                error.message ??
                'An error occurred';
            Get.snackbar("Error", errorMessage,
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: const Color(0xff5ce1e6));
          }
          handler.next(error);
        },
      ),
    );
    return dio!;
  }

  static Future<void> updateToken(String newToken) async {
    dio?.options.headers['Authorization'] = 'Bearer $newToken';
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', newToken);
  }

  static Future<void> clearToken() async {
    dio?.options.headers['Authorization'] = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  // Get request handler for soft coding

  static Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParams,
      Map<String, String>? queryParameters}) async {
    final dio = await getDio();
    return dio.get(endpoints[endpoint] ?? endpoint,
        queryParameters: queryParams);
  }

  // Post request handler for soft coding
  static Future<Response> post(
      String endpoint, Map<String, dynamic> data) async {
    final dio = await getDio();
    return dio.post(endpoints[endpoint] ?? endpoint, data: data);
  }

  // Put request handler for soft coding
  static Future<Response> put(
      String endpoint, Map<String, dynamic> data) async {
    final dio = await getDio();
    return dio.put(endpoints[endpoint] ?? endpoint, data: data);
  }

  // Delete request handler for soft coding
  static Future<Response> delete(String endpoint) async {
    final dio = await getDio();
    return dio.delete(endpoints[endpoint] ?? endpoint);
  }
}
