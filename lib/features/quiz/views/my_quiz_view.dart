import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/features/home/widgets/upcoming_game_card.dart';
import 'package:quizlee/features/quiz/providers/quiz_providers.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_constants.dart';
import 'package:quizlee/utils/error_text.dart';
import 'package:quizlee/utils/loader.dart';
import 'package:quizlee/utils/app_extensions.dart';
import 'package:quizlee/utils/widgets/myicon.dart';

class MyQuizView extends ConsumerStatefulWidget {
  const MyQuizView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyQuizViewState();
}

class _MyQuizViewState extends ConsumerState<MyQuizView> {
  final ValueNotifier<int> _selectQuizIndex = ValueNotifier(0);
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    // final confirmedQuizzesStream = ref.watch(getConfirmedQuizzesProvider);
    // final joinedQuizzesStream = ref.watch(getAllQuizzesjoinedProvider);
    return Scaffold(
      backgroundColor: Pallete.darkBlueGrey,
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: Stack(
          children: [
            //! page view
            PageView(
              controller: _controller,
              children: [
                //! ceeated
                SizedBox(
                  height: height(context),
                  width: width(context),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: 20.padH,
                      child: Column(
                        children: [
                          164.sbH,
                          // confirmedQuizzesStream.when(
                          //   data: (createdQuizzes) {
                          //     if (createdQuizzes.isEmpty) {
                          //       return Column(
                          //         children: [
                          //           200.sbH,
                          //           Text('Empty'),
                          //         ],
                          //       );
                          //     }

                          //     return Column(
                          //       children: List.generate(
                          //         createdQuizzes.length,
                          //         (index) => UpcomingGameCard(
                          //           quiz: createdQuizzes[index],
                          //         ),
                          //       ),
                          //     );
                          //   },
                          //   error: (error, stactrace) =>
                          //       ErrorText(error: error.toString()),
                          //   loading: () => const Loader(),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),

                //! joined
                SizedBox(
                  height: height(context),
                  width: width(context),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: 20.padH,
                      child: Column(
                        children: [
                          164.sbH,
                          // ref.watch(getAllQuizzesjoinedProvider).when(
                          //   data: (createdQuizzes) {
                          //     if (createdQuizzes.isEmpty) {
                          //       return Column(
                          //         children: [
                          //           200.sbH,
                          //           Text('Empty'),
                          //         ],
                          //       );
                          //     }

                          //     return Column(
                          //       children: List.generate(
                          //         createdQuizzes.length,
                          //         (index) => UpcomingGameCard(
                          //           quiz: createdQuizzes[index],
                          //         ),
                          //       ),
                          //     );
                          //   },
                          //   error: (error, stactrace) =>
                          //       ErrorText(error: error.toString()),
                          //   loading: () => const Loader(),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),

                //! drafts
                const Center(
                  child: Text('drafts'),
                ),
              ],
            ),
            //! header and buttons for switching pages
            Container(
              height: 132.h,
              width: double.infinity,
              color: Pallete.darkBlueGrey.withOpacity(0.7),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        'My Quiz',
                        style: TextStyle(
                          color: Pallete.textWhite,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      //! notification
                      MyIcon(
                        icon: 'notif',
                        color: Pallete.textGrey,
                        onTap: () {},
                      ),
                    ],
                  ),
                  16.sbH,

                  //! buttons
                  ValueListenableBuilder(
                      valueListenable: _selectQuizIndex,
                      builder: (context, value, child) {
                        return Row(
                          children: List.generate(
                            quizzes.length,
                            (index) => InkWell(
                              onTap: () {
                                _selectQuizIndex.value = index;
                                _controller.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 8.h),
                                margin: EdgeInsets.only(right: 8.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: _selectQuizIndex.value == index
                                      ? Pallete.buttonBlue
                                      : Pallete.upcomingblue,
                                ),
                                child: Text(
                                  quizzes[index],
                                  style: TextStyle(
                                    color: _selectQuizIndex.value == index
                                        ? Colors.white
                                        : Pallete.textGrey,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> quizzes = [
  'Created',
  'Joined',
  'Drafts',
];
