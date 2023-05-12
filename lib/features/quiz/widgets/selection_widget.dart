// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/theme/palette.dart';

import 'package:quizlee/utils/widget_extensions.dart';

class SelectionWidget extends StatelessWidget {
  final double? height;
  final double? overallheight;
  final double? width;
  final String title;
  const SelectionWidget({
    Key? key,
    this.height,
    this.overallheight,
    this.width,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: overallheight ?? 68.h,
      width: width ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: 8.padH,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Pallete.textGrey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            height: height ?? 44.h,
            width: width ?? double.infinity,
            decoration: BoxDecoration(
              color: Pallete.darkBlueGrey,
              border: Border.all(
                color: Pallete.borderBlueGrey,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ],
      ),
    );
  }
}
