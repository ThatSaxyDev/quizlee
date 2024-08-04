import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:quizlee/core/providers/loading_state.dart';
import 'package:quizlee/features/quiz/providers/quiz_providers.dart';
import 'package:quizlee/features/quiz/widgets/selection_widget.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_constants.dart';
import 'package:quizlee/utils/app_texts.dart';
import 'package:quizlee/utils/convert_time.dart';
import 'package:quizlee/utils/loader.dart';
import 'package:quizlee/utils/nav.dart';
import 'package:quizlee/utils/snack_bar.dart';
import 'package:quizlee/utils/utils.dart';
import 'package:quizlee/utils/app_extensions.dart';
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
  String date = '';
  String time = '';
  DateTime? datee;

  @override
  void initState() {
    super.initState();
    date = 'Set date';
    time = 'Set time';
  }

  File? image;
  void selectImage() async {
    final res = await pickImage();

    if (res != null) {
      setState(() {
        image = File(res.files.first.path!);
      });
    }
  }

  // //! create quiz
  // void createQuiz({
  //   required WidgetRef ref,
  //   required String title,
  //   required String description,
  //   required DateTime date,
  //   required String time,
  // }) {
  //   ref.read(quizControllerProvider.notifier).createQuiz(
  //         context: context,
  //         title: title,
  //         description: description,
  //         date: date,
  //         time: time,
  //         image: image,
  //         isPublic: true,
  //       );
  // }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(loadingStateControllerProvider);
    final quizState = ref.watch(quizStateNotifierProvider);
    return Scaffold(
      backgroundColor: Pallete.backgroundBlue,
      body: isLoading
          ? const Loader()
          : GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: SizedBox(
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
                              GestureDetector(
                                onTap: selectImage,
                                child: Container(
                                  height: 174.h,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(bottom: 16.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(
                                      color: Pallete.borderBlueGrey,
                                    ),
                                    color: Pallete.upcomingblue,
                                  ),
                                  child: image != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          child: Image.file(
                                            image!,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Center(
                                          child: Text(
                                            AppTexts.tapToAddImage,
                                            style: TextStyle(
                                              color: Pallete.textWhite,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                              20.sbH,

                              //! name text field
                              TextInputBox(
                                hintText: 'Enter title',
                                inputTitle: AppTexts.title,
                                controller: _titleController,
                              ),
                              16.sbH,

                              //! description
                              TextInputBox(
                                isExtended: true,
                                hintText: 'Enter description',
                                inputTitle: AppTexts.description,
                                overallheight: 112.h,
                                height: 88.h,
                                maxLines: 4,
                                controller: _descriptionController,
                              ),
                              16.sbH,

                              //! date, time
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SelectionWidget(
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          //DateTime.now() - not to allow to choose before today.
                                          lastDate: DateTime(2100));

                                      if (pickedDate != null) {
                                        String formattedDate =
                                            DateFormat('dd-MM-yy')
                                                .format(pickedDate);

                                        setState(() {
                                          datee = pickedDate;
                                          date = formattedDate;
                                        });
                                      } else {}
                                    },
                                    width: 159.5.w,
                                    title: AppTexts.quizDate,
                                    icon: 'date',
                                    text: date,
                                  ),
                                  SelectionWidget(
                                    onTap: () async {
                                      TimeOfDay? pickedTime =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            DateTime.now()),
                                      );

                                      if (pickedTime != null) {
                                        String formattedTime =
                                            '${convertTime(pickedTime.hour.toString())}:${convertTime(pickedTime.minute.toString())}';

                                        setState(() {
                                          time = formattedTime;
                                        });
                                      } else {}
                                    },
                                    width: 159.5.w,
                                    title: AppTexts.quizTime,
                                    icon: 'date',
                                    text: time,
                                  ),
                                ],
                              ),
                              16.sbH,

                              // //! participants
                              // SelectionWidget(
                              //   onTap: () {},
                              //   title: AppTexts.maxParticipants,
                              //   icon: 'participants',
                              //   text: 'Select',
                              //   isDate: false,
                              // ),
                              //!
                              68.sbH,
                              12.sbH,
                              quizState.isLoading
                                  ? const Center(child: CupertinoActivityIndicator())
                                  : ClickButton(
                                      isActive: !quizState.isLoading,
                                      onTap: () {
                                        if (image != null &&
                                            _titleController.text.isNotEmpty &&
                                            _descriptionController
                                                .text.isNotEmpty &&
                                            date.isNotEmpty &&
                                            time.isNotEmpty) {
                                          ref
                                              .read(quizStateNotifierProvider
                                                  .notifier)
                                              .createQuiz(
                                                context: context,
                                                title: _titleController.text
                                                    .trim(),
                                                description:
                                                    _descriptionController.text
                                                        .trim(),
                                                date: datee!,
                                                time: time,
                                                image: image,
                                                isPublic: true,
                                              );
                                        } else {
                                          showSnackBar(context, 'Fill');
                                        }
                                      },
                                      text: AppTexts.continueToAddQuestions,
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
                      padding: EdgeInsets.symmetric(horizontal: 20.w)
                          .copyWith(bottom: 16.h),
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
            ),
    );
  }
}
