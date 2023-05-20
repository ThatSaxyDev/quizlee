import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/features/quiz/widgets/confirm_quiz_bottom_sheet.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/string_extensions.dart';
import 'package:quizlee/utils/utils.dart';
import 'package:quizlee/utils/widget_extensions.dart';
import 'package:quizlee/utils/widgets/click_button.dart';

class JoinQuizBottomSheet extends ConsumerWidget {
  const JoinQuizBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 744.h,
      width: double.infinity,
      padding: 20.padH,
      decoration: const BoxDecoration(
        color: Pallete.backgroundBlue,
      ),
      child: Column(
        children: [
          32.sbH,
          //! title
          Align(
            alignment: Alignment.center,
            child: Text(
              'Quiz Title',
              style: TextStyle(
                color: Pallete.textWhite,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          24.sbH,

          //! image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              height: 174.h,
              width: double.infinity,
              fit: BoxFit.cover,
              imageUrl: 'quiz.image',
              placeholder: (context, url) => Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black12.withOpacity(0.1),
                      Colors.black12.withOpacity(0.1),
                      Colors.black26,
                      Colors.black26,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15.r),
                ),
              )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(duration: 1200.ms),
              errorWidget: (context, url, error) => Container(
                color: Pallete.darkBlueGrey.withOpacity(0.1),
                child: Center(
                  child: Icon(
                    Icons.error,
                    size: 30.sp,
                  ),
                ),
              ),
            ),
          ),
          12.sbH,

          Text(
            // quiz.description,
            'Join the quiz frenzy! Enter our game room to compete against other players and see who can score the most points. Join the quiz frenzy! Enter our game room to compete against other players and see who can score the most points.',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Pallete.textGrey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          16.sbH,

          //! details
          SizedBox(
            height: 28.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              children: [
                ConfirmChip(
                  // text: convert24HourTo12Hour(quiz.time),
                  text: '9:30pm',
                  icon: 'time',
                ),
                12.sbW,
                ConfirmChip(
                  // text: formatDate(quiz.date),
                  text: '12th, November',
                  icon: 'date',
                ),
                12.sbW,
                ConfirmChip(
                  // text: quiz.questionIds.length.toString(),
                  text: '5',
                  icon: 'quesno',
                ),
                12.sbW,
                ConfirmChip(
                  // text: quiz.isPublic == true ? 'Public' : 'Private',
                  text: 'Public',
                  icon: 'access',
                ),
              ],
            ),
          ),

          24.sbH,
          //! card with partcipants and countdown timer
          //! top with participants
          Container(
            height: 96.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('joinBackground'.jpg),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  20.sbH,
                  Text(
                    '7 OTHERS HAVE JOINED',
                    style: TextStyle(
                      color: Pallete.answerBorder,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  8.sbH,
                ],
              ),
            ),
          ),

          //! bottom with countdown
          Stack(
            children: [
              Container(
                height: 96.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Pallete.darkBlueGrey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r),
                  ),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            20.sbH,
                            Text(
                              'QUIZ STARTS IN',
                              style: TextStyle(
                                color: Pallete.textGrey,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            8.sbH,
                            Text(
                              '09 Hrs 25 Min 45 Sec',
                              style: TextStyle(
                                color: Pallete.gradientGreen,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //! green shine
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 0.5,
                        width: 0.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          boxShadow: [
                            BoxShadow(
                              color: Pallete.gradientGreen,
                              spreadRadius: 20.w,
                              blurRadius: 50.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //! gradient border work around
          Column(
            children: [
              Container(
                height: 1.5.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Pallete.gradientGreen,
                      Colors.transparent,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
              Container(
                height: 29.h,
                width: double.infinity,
                color: Pallete.backgroundBlue,
              ),
            ],
          ),

          // 29.sbH,
          ClickButton(
            text: 'Join Quiz',
            isActive: false,
          )
        ],
      ),
    );
  }
}
