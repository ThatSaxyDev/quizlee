// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizlee/utils/app_extensions.dart';

class MyIcon extends StatelessWidget {
  final void Function()? onTap;
  final String icon;
  final double? height;
  final Color? color;

  const MyIcon({
    super.key,
    required this.icon,
    this.height,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        icon.svg,
        color: color,
        height: height ?? 24.h,
      ),
    );
  }
}

class BackIcon extends StatelessWidget {
  final void Function()? onTap;
  const BackIcon({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SvgPicture.asset(
        'back'.svg,
        height: 24.h,
      ),
    );
  }
}
