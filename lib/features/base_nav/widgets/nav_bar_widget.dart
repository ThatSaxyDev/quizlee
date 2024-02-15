// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_extensions.dart';
import 'package:quizlee/utils/widgets/myicon.dart';

class NavBarWidget extends StatelessWidget {
  final String icon;
  final Color? color;
  final Color? textColor;
  final String label;
  final FontWeight? fontWeight;
  final void Function()? onTap;
  const NavBarWidget({
    super.key,
    required this.icon,
    this.color,
    this.textColor,
    required this.label,
    this.fontWeight,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: SizedBox(
          height: 48.h,
          width: 80.w,
          child: Column(
            children: [
              //! ICON
              MyIcon(
                icon: icon,
                color: color ?? Pallete.textHintGrey,
              ),

              //! SPACER
              4.sbH,

              //! LABEL
              Text(
                label,
                style: TextStyle(
                  color: textColor ?? Pallete.textHintGrey,
                  fontWeight: fontWeight ?? FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      );
}
