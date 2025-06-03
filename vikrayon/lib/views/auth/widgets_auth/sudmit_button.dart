import 'package:flutter/material.dart';
import 'package:vikrayon/utils/colors.dart';

class SudmitButton extends StatefulWidget {
  final void Function() onPressed;
  final String text;
  const SudmitButton({super.key, required this.onPressed, required this.text});

  @override
  State<SudmitButton> createState() => _SudmitButtonState();
}

class _SudmitButtonState extends State<SudmitButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Authcolors.gradient1,
            Authcolors.gradient2,
            Authcolors.gradient3,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(250, 50),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Authcolors.whiteColor,
          ),
        ),
      ),
    );
  }
}
