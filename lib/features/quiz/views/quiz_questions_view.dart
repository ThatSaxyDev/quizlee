// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/features/quiz/providers/quiz_providers.dart';
import 'package:quizlee/features/quiz/widgets/add_questions_bottom_sheet.dart';
import 'package:quizlee/features/quiz/widgets/confirm_quiz_bottom_sheet.dart';
import 'package:quizlee/features/quiz/widgets/question_list_card.dart';

import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_constants.dart';
import 'package:quizlee/utils/error_text.dart';
import 'package:quizlee/utils/loader.dart';
import 'package:quizlee/utils/nav.dart';
import 'package:quizlee/utils/widget_extensions.dart';
import 'package:quizlee/utils/widgets/click_button.dart';
import 'package:quizlee/utils/widgets/myicon.dart';

class QuizQuestionsView extends ConsumerWidget {
  final String quizId;
  const QuizQuestionsView({
    super.key,
    required this.quizId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizStream = ref.watch(getQuizByIdProvider(quizId));
    final questionsStream = ref.watch(getAllQuestionsInAQuizProvider(quizId));
    return Scaffold(
      backgroundColor: Pallete.backgroundBlue,
      body: quizStream.when(
        data: (quiz) {
          return SizedBox(
            height: height(context),
            width: width(context),
            child: Stack(
              children: [
                //! main body
                SizedBox(
                  height: height(context),
                  width: width(context),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    child: Padding(
                      padding: 20.padH,
                      child: Column(
                        children: [
                          112.sbH,
                          questionsStream.when(
                            data: (questions) {
                              if (questions.isEmpty) {
                                return const ErrorText(error: 'E no dey');
                              }

                              return Column(
                                children: List.generate(
                                  questions.length,
                                  (index) => QuestionListCard(
                                    indexx: index,
                                    question: questions[index],
                                  ),
                                ),
                              );
                            },
                            error: (error, stactrace) =>
                                ErrorText(error: error.toString()),
                            loading: () => const Loader(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //! button
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 61.h),
                    child: ClickButton(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          enableDrag: false,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => Wrap(
                            children: [
                              AddQuestionsBottomSheet(
                                quiz: quiz,
                              ),
                            ],
                          ),
                        );
                      },
                      text: '+',
                      width: 64.w,
                    ),
                  ),
                ),

                //! header
                Container(
                  height: 96.h,
                  width: double.infinity,
                  color: Pallete.backgroundBlue.withOpacity(0.7),
                  padding: EdgeInsets.symmetric(horizontal: 20.w)
                      .copyWith(bottom: 16.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //! create quiz
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              goBack(context);
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              children: [
                                const MyIcon(icon: 'back'),
                                8.sbW,
                                Text(
                                  quiz.title,
                                  style: TextStyle(
                                    color: Pallete.textWhite,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          questionsStream.when(
                            data: (questions) {
                              if (questions.isEmpty) {
                                return const SizedBox.shrink();
                              }

                              return InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    enableDrag: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) => Wrap(
                                      children: [
                                        ConfirmQuizBottomSheet(
                                          quiz: quiz,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Text(
                                  'Done',
                                  style: TextStyle(
                                    color: Pallete.textWhite,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            },
                            error: (error, stactrace) =>
                                ErrorText(error: error.toString()),
                            loading: () => const Loader(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stactrace) => ErrorText(error: error.toString()),
        loading: () => const Loader(),
      ),
    );
  }
}
