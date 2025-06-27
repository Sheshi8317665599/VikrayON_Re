import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vikrayon/utils/colors.dart';

class LoginFeild extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool readOnly;
  final void Function(String)? onchanged;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  const LoginFeild(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.keyboardType,
      required this.suffixIcon,
      required this.prefixIcon,
      required this.obscureText,
      required this.readOnly,
      this.onchanged,
      required this.validator,
      required this.hintStyle});

  @override
  State<LoginFeild> createState() => _LoginFeildState();
}

class _LoginFeildState extends State<LoginFeild> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 250.w,
      ),
      child: SizedBox(
        height: 60.h,
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            // contentPadding: const EdgeInsets.all(15),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Authcolors.borederColor,
                width: 3.w,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Authcolors.gradient2,
                width: 3.w,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 3.w,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            errorStyle:
                TextStyle(fontSize: 12.sp, height: 1.2, color: Colors.red),
            alignLabelWithHint: true,
            isDense: true,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 3.w,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          validator: widget.validator,
          style: widget.hintStyle,
        ),
      ),
    );
  }
}
