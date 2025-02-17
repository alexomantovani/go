import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
    this.circle = false,
    this.diameter = 64.0,
    this.height,
    this.width,
    this.borderRadius,
  });

  final bool? circle;
  final double? diameter;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width ?? diameter,
        height: height ?? diameter,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          shape: circle! ? BoxShape.circle : BoxShape.rectangle,
          borderRadius:
              circle! ? null : borderRadius ?? BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
