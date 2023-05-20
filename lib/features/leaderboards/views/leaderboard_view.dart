// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizlee/features/leaderboards/widgets/leaderboard_tile.dart';
import 'package:quizlee/features/leaderboards/widgets/position_widget.dart';

import 'package:quizlee/features/leaderboards/widgets/slide_containers.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_constants.dart';
import 'package:quizlee/utils/string_extensions.dart';
import 'package:quizlee/utils/widget_extensions.dart';
import 'package:quizlee/utils/widgets/myicon.dart';

class LeaderBoardView extends ConsumerStatefulWidget {
  const LeaderBoardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LeaderBoardViewState();
}

class _LeaderBoardViewState extends ConsumerState<LeaderBoardView> {
  final ValueNotifier<int> _selectPeriodIndex = ValueNotifier(0);
  bool canAnimate = false;

  void animate() {
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        canAnimate = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.darkBlueGrey,
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
                child: Stack(
                  children: [
                    //! where animations would take place
                    SizedBox(
                      height: height(context),
                      width: width(context),
                      child: Stack(
                        children: [
                          //! position 3
                          const Align(
                            alignment: Alignment.center,
                            child: SlideContainer3(
                              child: PositionWidget(
                                icon: 'third',
                              ),
                            ),
                          ),

                          //! postion 2
                          const Align(
                            alignment: Alignment.center,
                            child: SlideContainer2(
                              child: PositionWidget(
                                icon: 'second',
                              ),
                            ),
                          ),

                          //! position 1
                          const Align(
                            alignment: Alignment.center,
                            child: SlideContainer1(
                              child: PositionWidget(
                                icon: 'firstPlace',
                              ),
                            ),
                          ),

                          AnimatedAlign(
                            duration: const Duration(milliseconds: 1500),
                            curve: Curves.elasticOut,
                            alignment: canAnimate == true
                                ? const Alignment(0, 0.07)
                                : Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  'platform2'.svg,
                                  width: 88.w,
                                ),
                                SvgPicture.asset(
                                  'platform1'.svg,
                                  width: 104.w,
                                ),
                                SvgPicture.asset(
                                  'platform3'.svg,
                                  width: 88.w,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //! list
                    Column(
                      children: [
                        523.sbH,
                        Padding(
                          padding: 20.padH,
                          child: Column(
                            children: List.generate(
                              10,
                              (index) => LeaderBoardTile(
                                index: index,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                        'Leaderboard',
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
                      valueListenable: _selectPeriodIndex,
                      builder: (context, value, child) {
                        return Row(
                          children: List.generate(
                            periods.length,
                            (index) => InkWell(
                              onTap: () {
                                _selectPeriodIndex.value = index;
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 8.h),
                                margin: EdgeInsets.only(right: 8.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: _selectPeriodIndex.value == index
                                      ? Pallete.buttonBlue
                                      : Pallete.upcomingblue,
                                ),
                                child: Text(
                                  periods[index],
                                  style: TextStyle(
                                    color: _selectPeriodIndex.value == index
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

List<String> periods = [
  'Today',
  'This week',
  'All time',
];
