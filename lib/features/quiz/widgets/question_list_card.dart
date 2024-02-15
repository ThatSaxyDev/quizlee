// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/features/quiz/widgets/edit_questions_bottom_sheet.dart';
import 'package:quizlee/models/question_model.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_extensions.dart';

import 'package:quizlee/utils/widgets/myicon.dart';

class QuestionListCard extends StatelessWidget {
  final int indexx;
  final QuestionModel question;
  const QuestionListCard({
    super.key,
    required this.indexx,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      height: 110.h,
      width: double.infinity, // 335.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              27.sbH,
              Text(
                '${(indexx + 1).toString()}.',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 307.w,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        enableDrag: false,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => Wrap(
                          children: [
                            EditQuestionsBottomSheet(
                              question: question,
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      height: 68.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 16.h),
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: Pallete.borderBlueGrey,
                        ),
                        color: Pallete.upcomingblue,
                      ),
                      child: Center(
                        child: Text(
                          question.questionTitle,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Pallete.textWhite,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Wrap(
                    spacing: 10.w,
                    runSpacing: 10.h,
                    children: List.generate(
                      question.answerOptions.length,
                      (index) => Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: Pallete.answerBorder,
                            )),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            index == question.correctAnswerIndex
                                ? Padding(
                                    padding: EdgeInsets.only(right: 4.w),
                                    child: MyIcon(
                                      icon: 'correctans',
                                      height: 16.h,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            Text(
                              question.answerOptions[index],
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<String> answers = [
  'Africa',
  'Europe',
  'Asia',
  'South AMerica',
];
