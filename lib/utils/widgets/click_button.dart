// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quizlee/theme/palette.dart';

class ClickButton extends StatefulWidget {
  final void Function()? onTap;
  final double? width;
  final String text;
  const ClickButton({
    Key? key,
    this.onTap,
    this.width,
    required this.text,
  }) : super(key: key);

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
            clicked.value = true;
            Timer(const Duration(milliseconds: 100), () {
              clicked.value = false;
              widget.onTap?.call();
            });
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
                      color: Pallete.buttonBlue,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Pallete.buttonShadow,
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
                          color: Pallete.textWhite,
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
