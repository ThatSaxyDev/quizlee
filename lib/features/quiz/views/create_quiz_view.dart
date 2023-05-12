import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/features/quiz/widgets/selection_widget.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_constants.dart';
import 'package:quizlee/utils/app_texts.dart';
import 'package:quizlee/utils/nav.dart';
import 'package:quizlee/utils/widget_extensions.dart';
import 'package:quizlee/utils/widgets/click_button.dart';
import 'package:quizlee/utils/widgets/myicon.dart';
import 'package:quizlee/utils/widgets/text_input.dart';

class CreateQuizView extends ConsumerStatefulWidget {
  const CreateQuizView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateQuizViewState();
}

class _CreateQuizViewState extends ConsumerState<CreateQuizView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    children: [
                      112.sbH,
                      //! pick image
                      Container(
                        height: 174.h,
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
                        child: Center(
                          child: Text(
                            'Tap here to add cover image',
                            style: TextStyle(
                              color: Pallete.textWhite,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      20.sbH,

                      //! name text field
                      TextInputBox(
                        hintText: 'Enter title',
                        inputTitle: 'Title',
                        controller: _titleController,
                      ),
                      16.sbH,

                      //! description
                      TextInputBox(
                        isExtended: true,
                        hintText: 'Enter description',
                        inputTitle: 'Description',
                        overallheight: 112.h,
                        height: 88.h,
                        maxLines: 4,
                        controller: _descriptionController,
                      ),
                      16.sbH,

                      //! date, time
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SelectionWidget(
                            width: 159.5.w,
                            title: 'Quiz date',
                          ),
                          SelectionWidget(
                            width: 159.5.w,
                            title: 'Quiz time',
                          ),
                        ],
                      ),
                      16.sbH,

                      //! participants
                      SelectionWidget(
                        title: 'Quiz date',
                      ),
                      12.sbH,
                      ClickButton(
                        text: 'Continue to Add Questions',
                      ),
                      40.sbH,
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
              padding:
                  EdgeInsets.symmetric(horizontal: 20.w).copyWith(bottom: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //! create quiz
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
                          AppTexts.createQuiz,
                          style: TextStyle(
                            color: Pallete.textWhite,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
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
