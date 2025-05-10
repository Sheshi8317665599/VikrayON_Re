import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SWrapper extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  const SWrapper(
      {super.key, required this.child, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: child,
          )
        : child;
  }
}
