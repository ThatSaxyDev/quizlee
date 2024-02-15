import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_constants.dart';
import 'package:quizlee/utils/app_extensions.dart';
import 'package:quizlee/utils/nav.dart';
import 'package:quizlee/utils/widgets/myicon.dart';

class NotificationsView extends ConsumerWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Pallete.notifbackgroundBlue,
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: Stack(
          children: [
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
                          'Notifications',
                          style: TextStyle(
                            color: Pallete.textWhite,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {},
                          child: Text(
                            'Mark all as read',
                            style: TextStyle(
                              color: Pallete.textWhite,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
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
