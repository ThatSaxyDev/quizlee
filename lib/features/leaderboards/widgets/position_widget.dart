// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_extensions.dart';
import 'package:quizlee/utils/widgets/myicon.dart';

class PositionWidget extends StatelessWidget {
  final String icon;
  const PositionWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.w,
      height: 150.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //! photo
          SizedBox(
            height: 76.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: 30.w,
                    backgroundColor: Pallete.whiteColor,
                    child: CircleAvatar(
                      radius: 28.w,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: MyIcon(
                    icon: icon,
                    height: 32.h,
                  ),
                )
              ],
            ),
          ),
          8.sbH,

          //! name
          Row(
            children: [
              MyIcon(
                icon: 'leaderRed',
                height: 19.h,
              ),
              Text(
                'Player',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Pallete.whiteColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          8.sbH,
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 4.h,
            ),
            decoration: BoxDecoration(
                color: Pallete.upcomingblue,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: Pallete.answerBorder,
                )),
            child: Text(
              '900 Pts',
              style: TextStyle(
                color: Pallete.whiteColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
