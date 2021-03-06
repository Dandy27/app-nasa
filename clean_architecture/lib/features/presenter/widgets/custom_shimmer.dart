import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final Widget child;

  CustomShimmer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: child,
        ),
        baseColor: Colors.grey,
        highlightColor: Colors.white);
  }
}
