// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_texts.dart';
import 'package:quizlee/utils/widget_extensions.dart';
import 'package:quizlee/utils/widgets/myicon.dart';

class UpcomingGameCard extends ConsumerWidget {
  const UpcomingGameCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 304.h,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Pallete.borderBlueGrey,
        ),
        color: Pallete.upcomingblue,
      ),
      child: Column(
        children: [
          //! image
          Container(
            height: 80.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(
                color: Pallete.borderBlueGrey,
              ),
              color: Pallete.greyColor,
            ),
          ),
          18.sbH,

          //! title, time alert
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Night Crawlers',
                style: TextStyle(
                  color: Pallete.textWhite,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Pallete.backgroundBlue,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyIcon(
                        icon: 'redtime',
                        height: 16.h,
                      ),
                      4.sbW,
                      Text(
                        '1 min',
                        style: TextStyle(
                          color: Pallete.redColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          14.sbH,

          //! description
          Text(
            'Join the quiz frenzy! Enter our game room to compete against other players and see who can score the most.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Pallete.textGrey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          16.sbH,

          //! items
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UpcomingCardChip(
                text: '9:30pm',
                icon: 'time',
              ),
              12.sbW,
              UpcomingCardChip(
                text: '5',
                icon: 'quesno',
              ),
              12.sbW,
              UpcomingCardChip(
                text: 'Unlimited',
                icon: 'participants',
              ),
            ],
          ),

          //! avatars, join
          const Spacer(),
          Row(
            children: [
              CircleAvatar(
                radius: 16.w,
                backgroundColor: Pallete.textWhite,
                child: CircleAvatar(
                  radius: 14.w,
                  backgroundColor: Pallete.textGrey,
                  child: MyIcon(
                    icon: 'emptyDp',
                    height: 20.h,
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: SizedBox(
                  width: 76.w,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppTexts.join,
                          style: TextStyle(
                            color: Pallete.textWhite,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        13.sbW,
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14.sp,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UpcomingCardChip extends StatelessWidget {
  final String text;
  final String icon;

  const UpcomingCardChip({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Pallete.backgroundBlue,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyIcon(
              icon: icon,
              height: 16.h,
              color: Pallete.textGrey,
            ),
            4.sbW,
            Text(
              text,
              style: TextStyle(
                color: Pallete.textWhite,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
