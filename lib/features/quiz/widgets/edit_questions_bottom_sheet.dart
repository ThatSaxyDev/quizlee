// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:quizlee/features/quiz/providers/quiz_providers.dart';
import 'package:quizlee/features/quiz/widgets/add_questions_bottom_sheet.dart';
import 'package:quizlee/models/question_model.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_constants.dart';
import 'package:quizlee/utils/loader.dart';
import 'package:quizlee/utils/nav.dart';
import 'package:quizlee/utils/widget_extensions.dart';
import 'package:quizlee/utils/widgets/click_button.dart';
import 'package:quizlee/utils/widgets/myicon.dart';

class EditQuestionsBottomSheet extends ConsumerStatefulWidget {
  final QuestionModel question;
  const EditQuestionsBottomSheet({
    super.key,
    required this.question,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditQuestionsBottomSheetState();
}

class _EditQuestionsBottomSheetState
    extends ConsumerState<EditQuestionsBottomSheet> {
  final ValueNotifier<int?> correctAnswerIndex = ValueNotifier(null);
  TextEditingController _questionController = TextEditingController();
  TextEditingController _answer0Controller = TextEditingController();
  TextEditingController _answer1Controller = TextEditingController();
  TextEditingController _answer2Controller = TextEditingController();
  TextEditingController _answer3Controller = TextEditingController();
  List<CoolDropdownItem<String>> timesDropdownItems = [];
  List<CoolDropdownItem<String>> pointsDropdownItems = [];

  final timesDropdownController = DropdownController();
  final pointsDropdownController = DropdownController();

  int time = 20;
  int point = 100;

  void editQuestion({
    required WidgetRef ref,
    required String questionTitle,
    required int correctAnswerIndex,
    required List<String> answerOptions,
    required int timeToAnswer,
    required int points,
  }) {
    ref.read(quizControllerProvider.notifier).editQuestion(
          context: context,
          questionId: widget.question.questionId,
          quizId: widget.question.quizId,
          questionTitle: questionTitle,
          correctAnswerIndex: correctAnswerIndex,
          answerOptions: answerOptions,
          points: points,
          timeToAnswer: timeToAnswer,
        );
  }

  void deleteQuestion({
    required WidgetRef ref,
  }) {
    ref
        .read(quizControllerProvider.notifier)
        .deleteQuestion(context: context, question: widget.question);
  }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < times.length; i++) {
      timesDropdownItems.add(
        CoolDropdownItem<String>(
          label: '${times[i]} secs',
          value: '${times[i]}',
        ),
      );
    }
    for (var i = 0; i < points.length; i++) {
      pointsDropdownItems.add(
        CoolDropdownItem<String>(
          label: '${points[i]} pts',
          value: '${points[i]}',
        ),
      );
    }

    //!
    _questionController =
        TextEditingController(text: widget.question.questionTitle);
    correctAnswerIndex.value = widget.question.correctAnswerIndex;
    _answer0Controller =
        TextEditingController(text: widget.question.answerOptions[0]);
    _answer1Controller =
        TextEditingController(text: widget.question.answerOptions[1]);
    _answer2Controller =
        TextEditingController(text: widget.question.answerOptions[2]);
    _answer3Controller =
        TextEditingController(text: widget.question.answerOptions[3]);
    time = widget.question.timeToAnswer;
    point = widget.question.points;
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(quizControllerProvider);
    List<TextEditingController> controllers = [
      _answer0Controller,
      _answer1Controller,
      _answer2Controller,
      _answer3Controller,
    ];

    return Container(
      height: 756.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Pallete.backgroundBlue,
      ),
      child: SizedBox(
        height: 756.h,
        width: width(context),
        child: Stack(
          children: [
            //! main body
            SizedBox.expand(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                child: Padding(
                  padding: 20.padH,
                  child: Column(
                    children: [
                      88.sbH,
                      //! question text box
                      Container(
                        height: 132.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: Pallete.borderBlueGrey,
                          ),
                          color: Pallete.upcomingblue,
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 300,
                            child: TextField(
                              controller: _questionController,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              maxLines: 4,
                              cursorColor: Pallete.buttonBlue,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Pallete.textWhite,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Tap here to add your question',
                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Pallete.textGrey,
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      24.sbH,

                      //! time, points

                      Row(
                        children: [
                          //! select time
                          CoolDropdown<String>(
                            controller: timesDropdownController,
                            dropdownList: timesDropdownItems,
                            defaultItem: time == 10
                                ? timesDropdownItems[0]
                                : time == 20
                                    ? timesDropdownItems[1]
                                    : timesDropdownItems[2],
                            onChange: (timee) {
                              setState(() {
                                time = int.parse(timee);
                              });

                              timesDropdownController.close();
                            },
                            resultOptions: ResultOptions(
                              width: 100.w,
                              height: 40.h,
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              textStyle: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Pallete.whiteColor,
                              ),
                              openBoxDecoration: BoxDecoration(
                                  color: Pallete.darkBlueGrey,
                                  borderRadius: BorderRadius.circular(20.r),
                                  border: Border.all(
                                    color: Pallete.answerBorder,
                                  )),
                              boxDecoration: BoxDecoration(
                                  color: Pallete.darkBlueGrey,
                                  borderRadius: BorderRadius.circular(20.r),
                                  border: Border.all(
                                    color: Pallete.answerBorder,
                                  )),
                              render: ResultRender.reverse,
                              icon: SizedBox(
                                width: 10.w,
                                height: 10.h,
                                child: const CustomPaint(
                                  painter: DropdownArrowPainter(
                                      color: Pallete.whiteColor),
                                ),
                              ),
                            ),
                            dropdownOptions: DropdownOptions(
                              width: 100.w,
                            ),
                            dropdownItemOptions: DropdownItemOptions(
                              alignment: Alignment.center,
                              render: DropdownItemRender.label,
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              selectedPadding:
                                  EdgeInsets.symmetric(horizontal: 10.w),
                              textStyle: TextStyle(
                                color: Pallete.backgroundBlue,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              selectedTextStyle: TextStyle(
                                color: Pallete.whiteColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              selectedBoxDecoration: const BoxDecoration(
                                color: Pallete.backgroundBlue,
                              ),
                            ),
                          ),
                          12.sbW,

                          //! points
                          CoolDropdown<String>(
                            controller: pointsDropdownController,
                            dropdownList: pointsDropdownItems,
                            defaultItem: point == 50
                                ? pointsDropdownItems[0]
                                : point == 100
                                    ? pointsDropdownItems[1]
                                    : pointsDropdownItems[2],
                            onChange: (points) {
                              setState(() {
                                point = int.parse(points);
                              });

                              pointsDropdownController.close();
                            },
                            resultOptions: ResultOptions(
                              width: 100.w,
                              height: 40.h,
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              textStyle: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Pallete.whiteColor,
                              ),
                              openBoxDecoration: BoxDecoration(
                                  color: Pallete.darkBlueGrey,
                                  borderRadius: BorderRadius.circular(20.r),
                                  border: Border.all(
                                    color: Pallete.answerBorder,
                                  )),
                              boxDecoration: BoxDecoration(
                                  color: Pallete.darkBlueGrey,
                                  borderRadius: BorderRadius.circular(20.r),
                                  border: Border.all(
                                    color: Pallete.answerBorder,
                                  )),
                              render: ResultRender.reverse,
                              icon: SizedBox(
                                width: 10.w,
                                height: 10.h,
                                child: const CustomPaint(
                                  painter: DropdownArrowPainter(
                                      color: Pallete.whiteColor),
                                ),
                              ),
                            ),
                            dropdownOptions: DropdownOptions(
                              width: 100.w,
                            ),
                            dropdownItemOptions: DropdownItemOptions(
                              alignment: Alignment.center,
                              render: DropdownItemRender.label,
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              selectedPadding:
                                  EdgeInsets.symmetric(horizontal: 10.w),
                              textStyle: TextStyle(
                                color: Pallete.backgroundBlue,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              selectedTextStyle: TextStyle(
                                color: Pallete.whiteColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              selectedBoxDecoration: const BoxDecoration(
                                color: Pallete.backgroundBlue,
                              ),
                            ),
                          ),
                        ],
                      ),

                      32.sbH,
                      //! questions choice
                      SizedBox(
                        height: 272.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            4,
                            (index) => ValueListenableBuilder(
                                valueListenable: correctAnswerIndex,
                                child: const SizedBox.shrink(),
                                builder: (context, value, child) {
                                  return SizedBox(
                                    height: 56.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 56.h,
                                          width: 291.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.r),
                                            border: Border.all(
                                              color: Pallete.borderBlueGrey,
                                            ),
                                            color: Pallete.upcomingblue,
                                          ),
                                          child: Center(
                                            child: SizedBox(
                                              width: 200.w,
                                              child: TextField(
                                                controller: controllers[index],
                                                textAlign: TextAlign.center,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                maxLines: 1,
                                                cursorColor: Pallete.buttonBlue,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Pallete.textWhite,
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: index == 2 ||
                                                          index == 3
                                                      ? 'Add answer here (Optional)'
                                                      : 'Add answer here',
                                                  hintStyle: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Pallete.textHintGrey,
                                                  ),
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            correctAnswerIndex.value = index;
                                            log(correctAnswerIndex.value
                                                .toString());
                                          },
                                          child: MyIcon(
                                            icon: correctAnswerIndex.value ==
                                                    index
                                                ? 'correctans'
                                                : 'wrongans',
                                            height: 32.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                      51.sbH,

                      //! add button
                      isLoading
                          ? const Loader()
                          : ClickButton(
                              onTap: () {
                                if (correctAnswerIndex.value != null) {
                                  editQuestion(
                                    ref: ref,
                                    questionTitle:
                                        _questionController.text.trim(),
                                    correctAnswerIndex:
                                        correctAnswerIndex.value!,
                                    answerOptions: [
                                      _answer0Controller.text.trim(),
                                      _answer1Controller.text.trim(),
                                      _answer2Controller.text.trim(),
                                      _answer3Controller.text.trim(),
                                    ],
                                    timeToAnswer: time,
                                    points: point,
                                  );
                                }
                              },
                              text: 'Done',
                            ),
                    ],
                  ),
                ),
              ),
            ),

            //! header
            Container(
              height: 72.h,
              width: double.infinity,
              color: Pallete.backgroundBlue.withOpacity(0.7),
              padding:
                  EdgeInsets.symmetric(horizontal: 20.w).copyWith(bottom: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //! add questions
                  InkWell(
                    onTap: () {
                      goBack(context);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MyIcon(icon: 'down'),
                        Text(
                          'Edit Question',
                          style: TextStyle(
                            color: Pallete.textWhite,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        //! temporary delete
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => deleteQuestion(ref: ref),
                          icon: const Icon(
                            PhosphorIcons.trashFill,
                            color: Pallete.redColor,
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
