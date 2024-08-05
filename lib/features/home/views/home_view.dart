import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:quizlee/core/type_defs.dart';
import 'package:quizlee/features/auth/controller/auth_controller.dart';
import 'package:quizlee/features/home/widgets/upcoming_game_card.dart';
import 'package:quizlee/features/quiz/providers/quiz_providers.dart';
import 'package:quizlee/features/quiz/widgets/join_quiz_bottom_sheet.dart';
import 'package:quizlee/models/user_model.dart';
import 'package:quizlee/router.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_constants.dart';
import 'package:quizlee/utils/app_texts.dart';
import 'package:quizlee/utils/banner.dart';
import 'package:quizlee/utils/error_text.dart';
import 'package:quizlee/utils/loader.dart';
import 'package:quizlee/utils/app_extensions.dart';
import 'package:quizlee/utils/widgets/click_button.dart';
import 'package:quizlee/utils/widgets/myicon.dart';
import 'package:quizlee/utils/widgets/text_input.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void checkIfQuizRoomExists({
    required WidgetRef ref,
  }) {
    ref.read(quizControllerProvider.notifier).checkIfQUizRoomExists(
          context: context,
          quizRoomId: _codeController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final confirmedQuizzesStream = ref.watch(getConfirmedQuizzesProvider);
    final isLoading = ref.watch(quizControllerProvider);
    UserModel user = ref.watch(userProvider)!;
    List<String> names = user.name.split(' ');
    String firstName = names[0];
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    128.sbH,

                    //! enter quiz
                    Text(
                      AppTexts.enterQuizCode,
                      style: TextStyle(
                        color: Pallete.textWhite,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    4.sbH,
                    Text(
                      AppTexts.playWithFriends,
                      style: TextStyle(
                        color: Pallete.textGrey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    16.sbH,

                    //! text field
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextInputBox2(
                          hintText: AppTexts.enterCodeHere,
                          width: 251.w,
                          controller: _codeController,
                        ),

                        //! join button
                        isLoading
                            ? const Loader()
                            : InkWell(
                                onTap: () {
                                  if (_codeController.text.length == 6) {
                                    checkIfQuizRoomExists(ref: ref);
                                  } else {
                                    showBanner(
                                      context: context,
                                      theMessage: 'Enter valid code',
                                      theType: NotificationType.failure,
                                    );
                                  }
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: SizedBox(
                                  height: 44.h,
                                  width: 76.w,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                    //! or
                    16.sbH,
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppTexts.or,
                        style: TextStyle(
                          color: Pallete.textHintGrey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    16.sbH,
                    //! button
                    ClickButton(
                      onTap: () {
                        nav(destination: '/create-quiz', context: context);
                      },
                      text: AppTexts.createQuiz,
                    ),
                    32.sbH,

                    //! upcoming
                    Text(
                      AppTexts.upcoming,
                      style: TextStyle(
                        color: Pallete.textHintGrey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    12.sbH,

                    //! upcoming game cards
                    confirmedQuizzesStream.when(
                      data: (quizzes) {
                        if (quizzes.isEmpty) {
                          return Column(
                            children: [
                              120.sbH,
                              const ErrorText(error: 'No upcoming quiz'),
                            ],
                          );
                        }

                        return Column(
                          children: List.generate(
                            quizzes.length,
                            (index) => UpcomingGameCard(
                              quiz: quizzes[index],
                            ),
                          ),
                        );
                      },
                      error: (error, stactrace) =>
                          ErrorText(error: error.toString()),
                      loading: () => const Loader(),
                    ),

                    //! space
                    50.sbH,
                  ],
                ),
              ),
            ),
          ),

          //! header
          Container(
            height: 96.h,
            width: double.infinity,
            color: Pallete.backgroundBlue.withOpacity(0.7),
            padding: 20.padH,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    //! display photo
                    CircleAvatar(
                      radius: 20.w,
                      backgroundColor: Pallete.textWhite,
                      child: CircleAvatar(
                        radius: 18.w,
                        backgroundColor: Pallete.textGrey,
                        child: MyIcon(
                          icon: 'emptyDp',
                          height: 20.h,
                        ),
                      ),
                    ),
                    16.sbW,

                    //! greet user
                    Text(
                      'Hi, $firstName',
                      style: TextStyle(
                        color: Pallete.textWhite,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const Spacer(),
                    //! notification
                    MyIcon(
                      icon: 'notif',
                      onTap: () {
                        nav(destination: '/notifications', context: context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
