import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/features/quiz/providers/quiz_providers.dart';
import 'package:quizlee/models/quiz_model.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/error_text.dart';
import 'package:quizlee/utils/loader.dart';
import 'package:quizlee/utils/nav.dart';
import 'package:quizlee/utils/string_extensions.dart';
import 'package:quizlee/utils/utils.dart';
import 'package:quizlee/utils/widget_extensions.dart';
import 'package:quizlee/utils/widgets/click_button.dart';
import 'package:quizlee/utils/widgets/myicon.dart';

class ConfirmQuizBottomSheet extends ConsumerWidget {
  final QuizModel quiz;
  const ConfirmQuizBottomSheet({
    super.key,
    required this.quiz,
  });

  void confirmQuiz({required BuildContext context, required WidgetRef ref}) {
    ref
        .read(quizControllerProvider.notifier)
        .confirmQuizCreation(context: context, quiz: quiz);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizStream = ref.watch(getQuizByIdProvider(quiz.quizId));
    return Container(
      height: 656.h,
      width: double.infinity,
      padding: 20.padH,
      decoration: const BoxDecoration(
        color: Pallete.backgroundBlue,
      ),
      child: quizStream.when(
        data: (data) {
          return data.isCreationComplete == false
              //! displayed when the quiz has not been confirmed
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    32.sbH,
                    //! header
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Confirm Quiz',
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
                        imageUrl: quiz.image,
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
                            .animate(
                                onPlay: (controller) => controller.repeat())
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
                    24.sbH,

                    //! title
                    Text(
                      quiz.title,
                      style: TextStyle(
                        color: Pallete.textWhite,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    8.sbH,

                    //! description
                    Text(
                      quiz.description,
                      // 'Join the quiz frenzy! Enter our game room to compete against other players and see who can score the most points. Join the quiz frenzy! Enter our game room to compete against other players and see who can score the most points.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Pallete.textGrey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    12.sbH,

                    Wrap(
                      spacing: 12.w,
                      runSpacing: 8.h,
                      children: [
                        ConfirmChip(
                          text: convert24HourTo12Hour(quiz.time),
                          icon: 'time',
                        ),
                        ConfirmChip(
                          text: formatDate(quiz.date),
                          icon: 'date',
                        ),
                        ConfirmChip(
                          text: quiz.questionIds.length.toString(),
                          icon: 'quesno',
                        ),
                        ConfirmChip(
                          text: quiz.isPublic == true ? 'Public' : 'Private',
                          icon: 'access',
                        ),
                      ],
                    ),
                    52.sbH,

                    //! go back
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => goBack(context),
                        child: Text(
                          'Go Back to Edit',
                          style: TextStyle(
                            color: Pallete.textWhite,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    24.sbH,

                    ClickButton(
                      onTap: () => confirmQuiz(context: context, ref: ref),
                      text: 'Confirm Quiz',
                    ),
                  ],
                )
              :
              //! displayed when the quiz has been confirmed
              Column(
                  children: [
                    76.sbH,
                    SizedBox(
                      height: 169.h,
                      width: 132.w,
                      child: Stack(
                        children: [
                          //! image
                          CircleAvatar(
                            radius: 66.w,
                            backgroundColor: Pallete.greenn,
                            child: CircleAvatar(
                              // backgroundImage: NetworkImage(quiz.image),
                              radius: 56.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(56.r),
                                child: CachedNetworkImage(
                                  width: 112.w,
                                  fit: BoxFit.cover,
                                  imageUrl: quiz.image,
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
                                      .animate(
                                          onPlay: (controller) =>
                                              controller.repeat())
                                      .shimmer(duration: 1200.ms),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    color:
                                        Pallete.darkBlueGrey.withOpacity(0.1),
                                    child: Center(
                                      child: Icon(
                                        Icons.error,
                                        size: 30.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: MyIcon(icon: 'quiz-complete', height: 52.h),
                          ),
                        ],
                      ),
                    ),
                    19.sbH,

                    //! quiz created successfully
                    Text(
                      'Quiz Created\nSuccessfully',
                      style: TextStyle(
                        color: Pallete.textWhite,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    39.sbH,
                    //! quiz id box
                    Container(
                      height: 88.h,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Pallete.darkBlueGrey,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //! for quiz id
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Quiz ID',
                                style: TextStyle(
                                  color: Pallete.textHintGrey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                quiz.quizRoomId,
                                style: TextStyle(
                                  color: Pallete.textWhite,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          //! for link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Invite Link',
                                style: TextStyle(
                                  color: Pallete.textHintGrey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Quizlee.com/${quiz.title}'
                                    .removeSpacesAndLower(),
                                style: TextStyle(
                                  color: Pallete.textWhite,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    51.sbH,

                    //! share
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyIcon(
                            icon: 'share',
                            height: 16.h,
                          ),
                          8.sbH,
                          Text(
                            'Share Link',
                            style: TextStyle(
                              color: Pallete.textWhite,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    24.sbH,
                    ClickButton(text: 'Done'),
                  ],
                );
        },
        error: (error, stactrace) => ErrorText(error: error.toString()),
        loading: () => const Loader(),
      ),
    );
  }
}

class ConfirmChip extends StatelessWidget {
  final String text;
  final String icon;

  const ConfirmChip({
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
        color: Pallete.darkBlueGrey,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyIcon(
            icon: icon,
            height: 16.h,
            color: Pallete.textWhite,
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
    );
  }
}
