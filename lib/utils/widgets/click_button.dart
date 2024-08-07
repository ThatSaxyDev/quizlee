// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quizlee/theme/palette.dart';

class ClickButton extends StatefulWidget {
  final void Function()? onTap;
  final double? width;
  final String text;
  final bool? isActive;
  const ClickButton({
    super.key,
    this.onTap,
    this.width,
    required this.text,
    this.isActive = true,
  });

  @override
  State<ClickButton> createState() => _ClickButtonState();
}

class _ClickButtonState extends State<ClickButton> {
  final ValueNotifier<bool> clicked = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: clicked,
      child: const SizedBox.shrink(),
      builder: (context, value, child) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            if (widget.isActive == true) {
              clicked.value = true;
              Timer(const Duration(milliseconds: 100), () {
                clicked.value = false;
                widget.onTap?.call();
              });
            }
          },
          child: SizedBox(
            height: 70.h,
            width: widget.width ?? double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: clicked.value == true
                      ? Alignment.bottomCenter
                      : Alignment.topCenter,
                  child: Container(
                    height: 68.h,
                    width: widget.width ?? double.infinity,
                    decoration: BoxDecoration(
                      color: widget.isActive == true
                          ? Pallete.buttonBlue
                          : Pallete.inactiveButtonBlue,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: widget.isActive == true
                              ? Pallete.buttonShadow
                              : Pallete.inactiveButtonShadow,
                          offset: clicked.value == true
                              ? const Offset(0, 0)
                              : Offset(0, 5.h),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        widget.text,
                        style: TextStyle(
                          color: widget.isActive == true
                              ? Pallete.textWhite
                              : Pallete.textGrey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
