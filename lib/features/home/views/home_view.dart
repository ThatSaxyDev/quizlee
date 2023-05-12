import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/features/auth/controller/auth_controller.dart';
import 'package:quizlee/features/home/widgets/upcoming_game_card.dart';
import 'package:quizlee/models/user_model.dart';
import 'package:quizlee/router.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_constants.dart';
import 'package:quizlee/utils/app_texts.dart';
import 'package:quizlee/utils/widget_extensions.dart';
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

  @override
  Widget build(BuildContext context) {
    UserModel user = ref.watch(userProvider)!;
    List<String> names = user.name.split(' ');
    String firstName = names[0];
    return Scaffold(
      backgroundColor: Pallete.backgroundBlue,
      body: SizedBox(
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
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: SizedBox(
                              height: 44.h,
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
                      Column(
                        children: List.generate(
                          3,
                          (index) => UpcomingGameCard(),
                        ),
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
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
