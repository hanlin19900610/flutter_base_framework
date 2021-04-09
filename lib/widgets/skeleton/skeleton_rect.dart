import 'package:flutter/material.dart';
import 'package:flutter_base_framework/flutter_base_framework.dart';


class SkeletonRect extends BaseSkeletonWidget {
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;

  SkeletonRect({this.width, this.height, this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color ?? skeletonColor,
          borderRadius: BorderRadius.circular(radius!)),
    );
  }
}