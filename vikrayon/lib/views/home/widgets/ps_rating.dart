import 'package:flutter/material.dart';

class PSRating extends StatelessWidget {
  final double rating;
  final double size;
  const PSRating({super.key, required this.rating, required this.size});

  Color getColor(double rating) {
    if (rating >=1) return Colors.red;
    if (rating >=2) return Colors.orange;
    if (rating >=3) return Colors.yellow;
    if (rating >=4) return Colors.yellowAccent;
    return Colors.greenAccent;
  }

  @override
  Widget build(BuildContext context) {
    return  TweenAnimationBuilder<double>(tween: Tween<double>(begin: 0, end: rating), onEnd: () {}, duration: const Duration(milliseconds: 500),  builder: (context, animatedValue, _) {
      return Icon(
        
        Icons.star,
        color: getColor(animatedValue),
        size: size,
      );
    });
  }
}