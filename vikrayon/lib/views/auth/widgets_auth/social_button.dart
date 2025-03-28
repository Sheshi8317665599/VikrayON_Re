import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vikrayon/controllers/auth_controller.dart';
import 'package:vikrayon/utils/colors.dart';

class SocialButton extends StatefulWidget {
  final String iconPath;
  final String label;
  final double horizontalPadding;
  final double verticalPadding;
  const SocialButton(
      {super.key,
      required this.iconPath,
      required this.label,
      required this.horizontalPadding,
      required this.verticalPadding});

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  final AuthController authController = Get.find<AuthController>();
  // final GoogleSignIn _googleSignIn =
  //     GoogleSignIn(scopes: ['email', 'name', 'image']);

  // Future<void> _handleGoogleSignIn() async {
  //   try {
  //     final GoogleSignInAccount? account = await _googleSignIn.signIn();

  //     if (account != null) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => HomeScreen()),
  //       );
  //     }
  //   } catch (error) {
  //     print("Google Sign-in error: $error");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        await authController.googleSignIn();
      },
      icon: SvgPicture.asset(
        widget.iconPath,
        width: 25,
        color: Authcolors.whiteColor,
      ),
      label: Text(
        widget.label,
        style: const TextStyle(
          color: Authcolors.whiteColor,
        ),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: 15, horizontal: widget.horizontalPadding),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Authcolors.borederColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
