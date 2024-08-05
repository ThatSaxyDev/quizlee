// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_extensions.dart';
import 'package:quizlee/utils/widgets/myicon.dart';

class SelectionWidget extends StatelessWidget {
  final double? height;
  final double? overallheight;
  final double? width;
  final String title;
  final String icon;
  final String text;
  final bool? isDate;
  final void Function()? onTap;
  const SelectionWidget({
    super.key,
    this.height,
    this.overallheight,
    this.width,
    required this.title,
    required this.icon,
    required this.text,
    this.isDate = true,
    this.onTap,
  });

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
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: height ?? 44.h,
              width: width ?? double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Pallete.darkBlueGrey,
                border: Border.all(
                  color: Pallete.borderBlueGrey,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Row(
                  children: [
                    MyIcon(
                      icon: icon,
                      height: 16.h,
                    ),
                    8.sbW,
                    Text(
                      text,
                      style: TextStyle(
                        color: Pallete.textHintGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Spacer(),
                    if (isDate == false)
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Pallete.textHintGrey,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
