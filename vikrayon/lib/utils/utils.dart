
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissonController extends GetxController {
  final Map<String, bool> _handlePermissions = {};
  Future<void> requestAllPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.location,
      Permission.storage,
      Permission.microphone,
      Permission.contacts,
      Permission.phone,
      Permission.sms,
      Permission.notification,
    ].request();

    statuses.forEach((permission, status) {
      final permissionNmae = permission.toString().split('.').last;
      _handlePermissionStatus(status, permissionNmae);
    });
  }

  // request camera permission
  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    _handlePermissionStatus(status, "camera");
  }

  // request locatio service permission
  Future<void> requestLocationServicePermission() async {
    final status = await Permission.location.request();
    _handlePermissionStatus(status, "location service");
  }

  // request storage permission
  Future<void> requestStoragePermission() async {
    final status = await Permission.storage.request();
    _handlePermissionStatus(status, "storage");
  }

  // request microphone permission
  Future<void> requestMicrophonePermission() async {
    final status = await Permission.microphone.request();
    _handlePermissionStatus(status, "microphone");
  }

  // request notification permission
  Future<void> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    _handlePermissionStatus(status, "notification");
  }

// contact

  Future<void> requestContactPermission() async {
    final status = await Permission.contacts.request();
    _handlePermissionStatus(status, "contact");
  }

// phone

  Future<void> requestPhonePermission() async {
    final status = await Permission.phone.request();
    _handlePermissionStatus(status, "phone");
  }

// request sms permission
  Future<void> requestSmsPermission() async {
    final status = await Permission.sms.request();
    _handlePermissionStatus(status, "sms");
  }

  void _handlePermissionStatus(PermissionStatus status, String permissionName) {
    if (_handlePermissions[permissionName] == true) return;
    _handlePermissions[permissionName] = true;
    if (status.isGranted) {
      // Get.snackbar("$permissionName Permission", "Granted✅",
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Color(0xff4ce305));
    } else if (status.isDenied) {
      // Get.snackbar("$permissionName Permission", "Denied❌",
      //     snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    } else if (status.isPermanentlyDenied) {
      // Get.snackbar("$permissionName Permission", "Permanently Denied❌",
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.redAccent);
      openAppSettings();
    }
  }
}
