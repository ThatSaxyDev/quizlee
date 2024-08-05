import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_extensions.dart';
import 'package:quizlee/utils/widgets/myicon.dart';

class LeaderBoardTile extends StatelessWidget {
  final int index;
  const LeaderBoardTile({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      width: double.infinity,
      padding: 16.padH,
      decoration: BoxDecoration(
        color: index == 0 ? Pallete.upcomingblue : Pallete.backgroundBlue,
        borderRadius: index == 0
            ? BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              )
            : null,
      ),
      child: Row(
        children: [
          const MyIcon(
            icon: 'leaderRed',
          ),
          4.sbW,
          Text(
            '4.',
            style: TextStyle(
              color: Pallete.textWhite,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          17.sbW,
          CircleAvatar(
            radius: 20.w,
            backgroundColor: Pallete.buttonBlue,
          ),
          12.sbW,
          Text(
            'Player',
            style: TextStyle(
              color: Pallete.textWhite,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            '800 Pts',
            style: TextStyle(
              color: Pallete.textWhite,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
